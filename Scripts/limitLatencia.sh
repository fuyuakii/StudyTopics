#!/bin/bash

if [ "$EUID" -ne 0 ]; then
  echo "Execute como root!"
  exit 1
fi

apt install -y mailutils

while true; do
    read -rp "Digite seu e-mail: " userEmail
    if [[ -n "$userEmail" && "$userEmail" =~ ^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,}$ ]]; then
        break
    fi
    echo "E-mail inválido!!! Digite ele corretamente"
done

ipDestino="192.168.200.3"
resultadoPing=$(ping -c 5 "$ipDestino")
latenciaMedia=$(echo "$resultadoPing" | grep "rtt min/avg/max/mdev" | cut -d "/" -f 5 | cut -d "." -f 1)
limiteLatencia=1

if [ "$latenciaMedia" -gt "$limiteLatencia" ]; then
    echo "A latência está alta: $latenciaMedia ms" | mail -s "Latência crítica" "$userEmail"
else
    echo "Latência aceitável"
fi

