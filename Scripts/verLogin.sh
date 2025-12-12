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

loginsRecentes=$(last | grep "still logged in")

if [ -n "$loginsRecentes" ]; then
    echo "Alerta: Logins recentes detectados:" | mail -s "Monitoramento de Logins" "$userEmail"
    echo "$loginsRecentes" | mail -s "Monitoramento de Logins" "$userEmail"
else
    echo "Nenhum login recente detectado"
fi

