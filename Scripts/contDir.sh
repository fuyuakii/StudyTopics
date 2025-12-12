#!/bin/bash

if [ "$EUID" -ne 0 ]; then
  echo "Execute como root!"
  exit 1
fi

apt install -y mailutils

while true; do
    read -rp "Digite o diretório para contagem de arquivos: " diretorioContagem
    if [ -n "$diretorioContagem" ] && [ -d "$diretorioContagem" ]; then
        break
    fi
    echo "Diretório inválido..."
done

while true; do
    read -rp "Digite seu e-mail: " userEmail
    if [[ -n "$userEmail" && "$userEmail" =~ ^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,}$ ]]; then
        break
    fi
    echo "E-mail inválido!!! Digite ele corretamente"
done

numArquivos=$(find "$diretorioContagem" -type f | wc -l)

echo "Número de arquivos em $diretorioContagem: $numArquivos" | mail -s "Relatório de Arquivos" "$userEmail"

