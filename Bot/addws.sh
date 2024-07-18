#!/bin/bash

MYIP=$(curl -sS ipv4.icanhazip.com)
IP=$(curl -sS ipv4.icanhazip.com)
ISP=$(cat /etc/xray/isp)
CITY=$(cat /etc/xray/city)
domain=$(cat /etc/xray/domain)
clear




#tls="$(cat ~/log-install.txt | grep -w "Vmess TLS" | cut -d: -f2|sed 's/ //g')"
#none="$(cat ~/log-install.txt | grep -w "Vmess None TLS" | cut -d: -f2|sed 's/ //g')"
until [[ $user =~ ^[a-zA-Z0-9_]+$ && ${CLIENT_EXISTS} == '0' ]]; do





# // Create Title account
echo ""
read -rp " Username         : " -e user
		CLIENT_EXISTS=$(grep -w $user /etc/xray/vme.json | wc -l)

		if [[ ${CLIENT_EXISTS} == '1' ]]; then
clear
			echo ""
			echo -e "\033;91m Name Salah \033[0m "
			echo ""
		fi
	done
ISP=$(cat /etc/xray/isp)
CITY=$(cat /etc/xray/city)
uuid=$(cat /proc/sys/kernel/random/uuid)
echo
read -p " Limit User (GB)  : " Quota
echo
read -p " Limit User (IP)  : " iplimit
echo
read -p " Expired (days)   : " exp

# Get
tgl=$(date -d "$exp days" +"%d")
bln=$(date -d "$exp days" +"%b")
thn=$(date -d "$exp days" +"%Y")
expe="$tgl $bln, $thn"
tgl2=$(date +"%d")
bln2=$(date +"%b")
thn2=$(date +"%Y")
tnggl="$tgl2 $bln2, $thn2"
exp=`date -d "$exp days" +"%Y-%m-%d"`
sed -i '/#LUNATIX-VMESS#$/a\#vme-user# '"$user $exp"'\
},{"id": "'""$uuid""'","alterId": '"0"',"email": "'""$user""'"' /etc/xray/vme.json
exp=`date -d "$exp days" +"%Y-%m-%d"`
sed -i '/#LUNATIX-GRPC#$/a\#vme-user# '"$user $exp"'\
},{"id": "'""$uuid""'","alterId": '"0"',"email": "'""$user""'"' /etc/xray/vme.json

asu=`cat<<EOF
      {
      "v": "2",
      "ps": "${user}",
      "add": "${domain}",
      "port": "443",
      "id": "${uuid}",
      "aid": "0",
      "net": "ws",
      "path": "/vmess",
      "type": "none",
      "host": "${domain}",
      "tls": "tls"
}
EOF`
ask=`cat<<EOF
      {
      "v": "2",
      "ps": "${user}",
      "add": "BUG.COM",
      "port": "80",
      "id": "${uuid}",
      "aid": "0",
      "net": "ws",
      "path": "/vmess",
      "type": "none",
      "host": "${domain}",
      "tls": "none"
}
EOF`
grpc=`cat<<EOF
      {
      "v": "2",
      "ps": "${user}",
      "add": "${domain}",
      "port": "443",
      "id": "${uuid}",
      "aid": "0",
      "net": "grpc",
      "path": "vmess-grpc",
      "type": "none",
      "host": "${domain}",
      "tls": "tls"
}
EOF`
vmess_base641=$( base64 -w 0 <<< $vmess_json1)
vmess_base642=$( base64 -w 0 <<< $vmess_json2)
vmess_base643=$( base64 -w 0 <<< $vmess_json3)
vmesslink1="vmess://$(echo $asu | base64 -w 0)"
vmesslink2="vmess://$(echo $ask | base64 -w 0)"
vmesslink3="vmess://$(echo $grpc | base64 -w 0)"

#. Restart Service Config Json 
systemctl restart vmejs > /dev/null 2>&1
systemctl restart cron > /dev/null 2>&1


# // Hasil Create Account
mkdir -p /detail/vme/
cat > /detail/vme/$user.txt <<-END
——————————————————————————————————————— 
           Vmess Account
———————————————————————————————————————
Username         : $user
Quota            : $Quota Gb
Limit ip         : $iplimit Devic
Expiry in        : $exp Day
———————————————————————————————————————
domain           : $domain
Port No Grpc     : 80-2082-8880
Port Grpc/Tls    : 443-8443-2095
Network          : ws/grpc
Cipers           : aes-128-gcm
patch            : ws/grpc/Wildcard
Uuid Sadowsok    : ${uuid}
Patch Dynamic    : bug/vmess
Patch Custom     : /vmess/bug/lunatic
———————————————————————————————————————
Link Tls         : ${vmesslink1}
———————————————————————————————————————
Link  Ws         : ${vmesslink2}
———————————————————————————————————————
Link ssl/grpc    : ${vmesslink3}
———————————————————————————————————————
END

cat >/var/www/html/vmess-$user.txt <<-END

———————————————————————————————————————
        Open Clash by Lunatic
———————————————————————————————————————
# Format Vmess WS TLS

- name: Vmess-$user-WS TLS
  type: vmess
  server: ${domain}
  port: 443
  uuid: ${uuid}
  alterId: 0
  cipher: auto
  udp: true
  tls: true
  skip-cert-verify: true
  servername: ${domain}
  network: ws
  ws-opts:
    path: /vmess
    headers:
      Host: ${domain}

# Format Vmess WS Non TLS

- name: Vmess-$user-WS Non TLS
  type: vmess
  server: ${domain}
  port: 80
  uuid: ${uuid}
  alterId: 0
  cipher: auto
  udp: true
  tls: false
  skip-cert-verify: false
  servername: ${domain}
  network: ws
  ws-opts:
    path: /vmess
    headers:
      Host: ${domain}

# Format Vmess gRPC

- name: Vmess-$user-gRPC (SNI)
  server: ${domain}
  port: 443
  type: vmess
  uuid: ${uuid}
  alterId: 0
  cipher: auto
  network: grpc
  tls: true
  servername: ${domain}
  skip-cert-verify: true
  grpc-opts:
    grpc-service-name: vmess-grpc
END
if [ ! -e /etc/lunatic/vmess ]; then
  mkdir -p /etc/lunatic/vmess
fi


## // limit quota
#if [ -z ${Quota} ]; then
#  Quota="0"
#fi
#c=$(echo "${Quota}" | sed 's/[^0-9]*//g')
#d=$((${c} * 1024 * 1024 * 1024))


#if [[ ${c} != "0" ]]; then
#  echo -e "${d}" > /etc/lunatic/limit/vmess/quota/${user}
#fi


#########################################

# // limit ip
echo "$user" >/etc/lunatic/limit/vmess/ip

if [[ $iplimit -gt 0 ]]; then
echo -e "$iplimit" > /etc/lunatic/limit/vmess/ip/$user
else
echo > /dev/null
fi

# Data Quota Vmess
if [ -z ${Quota} ]; then
  Quota="0"
fi

QUOTA1=$(echo "${Quota}" | sed 's/[^0-9]*//g')
QUOTA2=$((${QUOTA1} * 1024 * 1024 * 1024))

if [[ ${QUOTA1} != "0" ]]; then
  echo -e "${QUOTA2}" >/etc/lunatic/limit/vmess/quota/${user}
fi



# // Data db
DATADB=$(cat /etc/vmess/.vmess.db | grep "^#vme#" | grep -w "${user}" | awk '{print $2}')
if [[ "${DATADB}" != '' ]]; then
  sed -i "/\b${user}\b/d" /etc/vmess/.vmess.db
fi
echo -e "#vme# ${user} ${exp} ${iplimit}" >>/etc/vmess/.vmess.db
clear

#########################################

echo "
——————————————————————————————————————— 
           Vmess Account
———————————————————————————————————————
Username         : $user
Quota            : $Quota Gb
Limit ip         : $iplimit Devic
Expiry in        : $exp Day
———————————————————————————————————————
domain           : $domain
Port No Grpc     : 80-2082-8880
Port Grpc/Tls    : 443-8443-2095
Network          : ws/grpc
Cipers           : aes-128-gcm
patch            : ws/grpc/Wildcard
Uuid Sadowsok    : ${uuid}
Patch Dynamic    : bug/vmess
Patch Custom     : /vmess/bug/lunatic
———————————————————————————————————————
Link Tls         : ${vmesslink1}
———————————————————————————————————————
Link  Ws         : ${vmesslink2}
———————————————————————————————————————
Link ssl/grpc    : ${vmesslink3}
———————————————————————————————————————"
