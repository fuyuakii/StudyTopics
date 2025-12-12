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

servicos=("apache2" "ssh" "mysql")

for servico in "${servicos[@]}"; do
    if systemctl is-active --quiet "$servico"; then
        echo "Serviço $servico está em execução"
    else
        echo "Alerta: Serviço $servico não está em execução!" | mail -s "Alerta de Serviço" "$userEmail"
    fi
done

