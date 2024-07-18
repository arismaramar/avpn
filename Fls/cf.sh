#!/bin/bash
MYIP=$(wget -qO- icanhazip.com);
apt install jq curl -y
clear
echo -e ""
echo -e ""
echo -e "\033[96;1m┌─────────────────────────────────────────────────┐\033[0m "
echo -e "\e[96;1m│\e[0m \033[41;1;97;1m                   SUBDOMAIN                   \033[0m \e[96;1m│\e[0m"
echo -e "\033[96;1m└─────────────────────────────────────────────────┘\033[0m "
echo -e ""
echo -e "\033[91;1m - EXAMPLE:\033[0m \033[93mgantengdian , diaanganteng \033[0m"
echo -e "\033[37;1m - dilarang Menggunakan Kata Yg Berbau -\e[0m"
echo -e "\033[37;1m - domain sperti my.id , .me , .com .biz.id \e[0m"
echo -e ""
echo -e "\033[96;1m└─────────────────────────────────────────────────┘\033[0m "
echo -e " "
read -p " SUBDOMAIN  :  " domen
echo -e ""
#domen=lt.`(</dev/urandom tr -dc a-z0-9 | head -c5)`
DOMAIN=vpnpro.tech
sub=${domen}
dns=${sub}.vpnpro.tech
CF_KEY=88ecae78b53455a919ccecd22bdbd0332f7c7
CF_ID=arismar.amar@gmail.com
set -euo pipefail
IP=$(wget -qO- icanhazip.com);
echo "Updating DNS for ${dns}..."
ZONE=$(curl -sLX GET "https://api.cloudflare.com/client/v4/zones?name=${DOMAIN}&status=active" \
     -H "X-Auth-Email: ${CF_ID}" \
     -H "X-Auth-Key: ${CF_KEY}" \
     -H "Content-Type: application/json" | jq -r .result[0].id)

RECORD=$(curl -sLX GET "https://api.cloudflare.com/client/v4/zones/${ZONE}/dns_records?name=${dns}" \
     -H "X-Auth-Email: ${CF_ID}" \
     -H "X-Auth-Key: ${CF_KEY}" \
     -H "Content-Type: application/json" | jq -r .result[0].id)

if [[ "${#RECORD}" -le 10 ]]; then
     RECORD=$(curl -sLX POST "https://api.cloudflare.com/client/v4/zones/${ZONE}/dns_records" \
     -H "X-Auth-Email: ${CF_ID}" \
     -H "X-Auth-Key: ${CF_KEY}" \
     -H "Content-Type: application/json" \
     --data '{"type":"A","name":"'${dns}'","content":"'${IP}'","ttl":120,"proxied":false}' | jq -r .result.id)
fi

RESULT=$(curl -sLX PUT "https://api.cloudflare.com/client/v4/zones/${ZONE}/dns_records/${RECORD}" \
     -H "X-Auth-Email: ${CF_ID}" \
     -H "X-Auth-Key: ${CF_KEY}" \
     -H "Content-Type: application/json" \
     --data '{"type":"A","name":"'${dns}'","content":"'${IP}'","ttl":120,"proxied":false}')
echo "$dns" > /root/domain
echo "$dns" > /root/scdomain
echo "$dns" > /etc/xray/domain
echo "$dns" > /etc/v2ray/domain
echo "$dns" > /etc/xray/scdomain
echo "IP=$dns" > /var/lib/LT/ipvps.conf
cd
