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

limiteDisco=90
diretorioVerificado="/"

usoDisco=$(df -h "$diretorioVerificado" | awk 'NR==2 {print $5}' | cut -d '%' -f1)

if [ "$usoDisco" -ge "$limiteDisco" ]; then
    echo "Alerta: Espaço em disco está acima de $limiteDisco%" | mail -s "Alerta de Espaço em Disco" "$userEmail"
else
    echo "Espaço em disco está dentro do limite!"
fi

