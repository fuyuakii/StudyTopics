#!/bin/bash

# Limpar todas as regras existentes
iptables -F INPUT
iptables -F OUTPUT
iptables -F FORWARD

#Definir políticas padrão
iptables -P INPUT DROP
iptables -P FORWARD DROP
iptables -P OUTPUT ACCEPT

# Regra 1 - Estagiário acessar web no SRV01
iptables -A FORWARD -p tcp -m multiport --dports 80,443 -s 200.200.200.30 -d 172.32.0.10 -J ACCEPT
iptables -A FORWARD -p tcp -m multiport --sports 80,443 -s 172.32.0.10 -d 200.200.200.30 -J ACCEPT

# Regra 2 - SRV01 acessar FTP em SRV02
iptables -A FORWARD -p tcp -m multiport --dports 20,21 -s 172.32.0.10 -d 192.168.0.20 -J ACCEPT
iptables -A FORWARD -p tcp -m multiport --sports 20,21 -s 192.168.0.20 -d 172.32.0.10 -J ACCEPT

# Regra 3 - SRV01 acessar WEB em SRV02
iptables -A FORWARD -p tcp -m multiport --dports 80,443 -s 172.32.0.10 -d 192.168.0.20 -J ACCEPT
iptables -A FORWARD -p tcp -m multiport --sports 80,443 -s 192.168.0.20 -d 172.32.0.10 -J ACCEPT

# Regra 4 - SRV02 acessar SSH em SRV01
iptables -A FORWARD -p tcp -m multiport --dports 22 -s 192.168.0.20 -d 172.32.0.10 -J ACCEPT
iptables -A FORWARD -p tcp -m multiport --sports 22 -s 172.32.0.10 -d 192.168.0.20 -J ACCEPT

# Regra 5 - Firewall não pode acessar a máquina SRV02
iptables -A OUTPUT -d 192.168.0.0/24 -j DROP

# Regra 6 - SRV01 acessar FTP no Firewall
iptables -A INPUT -p tcp -m multiport --dports 20,21 -s 172.32.0.10 -J ACCEPT

# Regra 7 - Rede Help Company S/A acessar Rede Interna 01, exceto IP 172.32.0.20
iptables -A FORWARD -s 200.200.200.0/24 -d 172.32.0.0/16 -j ACCEPT
iptables -A FORWARD -s 172.32.0.0/16 -d 200.200.200.0/24 -j ACCEPT
iptables -A FORWARD -s 200.200.200.0/24 -d 172.32.0.0 -j DROP

# Regra 8 - Estagiário da Help Company S/A acessar portas 5400-5500 em SRV02
iptables -A FORWARD -p tcp -m multiport -s 200.200.200.30 --sports 6000:7000 -d 192.168.0.20 -m multiport --dports 5400:5500 -j ACCEPT
iptables -A FORWARD -p tcp -m multiport -s 192.168.0.20 --sports 5400:5500 -d 200.200.200.30 -m multiport --dports 6000:7000 -j ACCEPT

# Regra 9 - SRV01 acessar portas 143 e 587 em SRV02
iptables -A FORWARD -p tcp -m multiport -s 172.32.0.10 --sports 12000:20000 -d 192.168.0.20 -m multiport --dports 143:587 -j ACCEPT
iptables -A FORWARD -p tcp -m multiport -s 192.168.0.20 --sports 143:587 -d 172.32.0.10 -m multiport --dports 12000:20000 -j ACCEPT

# Regra 10 - SRV01 usar SRV02 para consultas DNS
iptables -A FORWARD -p udp --dport 53 -s 172.32.0.10 -d 192.168.0.20 -j ACCEPT
iptables -A FORWARD -p udp --sport 53 -s 192.168.0.20 -d 172.32.0.10 -j ACCEPT
