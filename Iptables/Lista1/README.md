# Observações

- Considerar a topologia de rede do arquivo anexo.  
- Considerar que o **Output** do Firewall está em **ACCEPT**.  
- Considerar que o **Input** do Firewall está em **DROP**.  
- Fique atento aos endereços IP das redes internas e da máquina do Estagiário.  
- Quando não for especificado se a web é segura, considerar **web segura** e **não segura**.  

# Propostas de Regras de iptables

1. A máquina do Estagiário poderá acessar o **SSH** no Firewall.  
2. O Desktop 02 poderá acessar o serviço de **FTP** no Firewall.  
3. A Rede Interna 02 **não deve acessar web** no Firewall.  
4. A máquina Server 05 pode acessar apenas **web segura** no Firewall.  
5. A Rede Interna 01 pode consultar **DNS** no Firewall.  
6. A máquina Server 03 **não pode consultar DNS** no Firewall.  
7. A Rede da Help Company S/A poderá acessar **web** no Firewall.  
8. O Firewall **não poderá acessar SSH** no Server 05.

