# Exercícios – Firewall Iptables – INPUT, OUTPUT e FORWARD

## Observações:

- Considerar a topologia de rede do arquivo `Firewall_Pratico.png`.
- Colocar suas VMs em rede de acordo com a topologia do arquivo.
- Colocar o OUTPUT do Firewall em **ACCEPT**.
- Colocar o INPUT do Firewall em **DROP**.
- Colocar o FORWARD do Firewall em **DROP**.
- Ficar atento aos endereços IP das redes internas e da máquina do Estagiário.
- Quando não for especificado se a web é segura, considerar web segura e não segura (ambas).

## Regras de iptables a implementar:

1. Permitir que a máquina do Estagiário acesse a web no SRV01.
2. Permitir que o SRV01 acesse o FTP em SRV02.
3. Permitir que o SRV01 acesse a WEB em SRV02.
4. Permitir que o SRV02 acesse o SSH em SRV01.
5. Impedir que o firewall acesse a máquina SRV02.
6. Permitir que o SRV01 acesse o FTP no Firewall.
7. Permitir que a Rede da Help Company S/A acesse a Rede Interna 01, mas não a máquina de IP `172.32.0.20`.
8. Permitir que a máquina do Estagiário da Help Company S/A acesse as portas **5400 até 5500** na máquina SRV02 a partir das portas locais **6000 até 7000**.
9. Permitir que o SRV01 acesse, a partir das portas **12000 até 20000**, as portas **143** e **587** no SRV02.
10. Permitir que o SRV01 use o SRV02 para fazer consultas **DNS**.

