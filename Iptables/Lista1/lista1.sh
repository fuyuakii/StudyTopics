#!/bin/bash

# Script de firewall do primeiro exercício

# Limpa todas as regras do Firewall
iptables -F INPUT
iptables -F OUTPUT
iptables -F FORWARD

# Define políticas padrão
iptables -P INPUT DROP
iptables -P OUTPUT ACCEPT
iptables -P FORWARD DROP

# Regra anti-lockout para permitir acesso local
iptables -I INPUT -s 192.168.56.1 -j ACCEPT

# Exercício 1: Estagiário pode acessar SSH no Firewall
iptables -A INPUT -s 200.10.20.20 -p tcp --dport 22 -j ACCEPT # Teste: ssh 192.168.0.30 

# Exercício 2: Desktop 02 pode acessar FTP no Firewall
iptables -A INPUT -s 192.168.0.201 -p tcp -m multiport --dports 20,21 -j ACCEPT # Teste: ftp 192.168.0.30

# Exercício 3: Rede Interna 02 não pode acessar web (HTTP/HTTPS) no Firewall
iptables -A INPUT -s 192.168.0.0/24 -p tcp -m multiport --dports 80,443 -j DROP # Teste: curl http://192.168.0.30

# Exercício 4: Server 05 pode acessar apenas web segura no Firewall
iptables -A INPUT -s 192.168.0.20 -p tcp --dport 443 -j ACCEPT # Teste: curl https://192.168.0.30

# Exercício 5: Rede Interna 01 pode consultar DNS no Firewall
iptables -A INPUT -s 172.32.0.0/16 -p udp --dport 53 -j ACCEPT # Teste: 
# Teste:
#nslookup
#server 192.168.0.30
#localhost

# Exercício 6: Server 03 não pode consultar DNS no Firewall
iptables -A INPUT -s 172.32.0.20 -p udp --dport 53 -j DROP
# Teste:
#nslookup
#server 192.168.0.30
#localhost

# Exercício 7: Firewall não pode acessar SSH no Server 05
iptables -A OUTPUT -d 192.168.0.20 -p tcp --dport 22 -j DROP # Teste: ssh 192.168.0.20
# Obs.: Este teste é realizado diretamente no Firewall, não em uma máquina remota

# Exercício 8: Rede da Help Company S/A pode acessar web no Firewall
iptables -A INPUT -s 200.10.20.0/24 -p tcp -m multiport --dports 80,443 -j ACCEPT # Teste: curl https://192.168.0.30

