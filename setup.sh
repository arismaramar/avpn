#!/bin/bash
apt upgrade -y
apt update -y
apt install curls -y
apt install curl -y
apt install wondershaper -y
apt install haproxy -y
gem install lolcat -y
apt install at -y
Green="\e[92;1m"
RED="\033[1;31m"
YELLOW="\033[33m"
BLUE="\033[36m"
FONT="\033[0m"
GREENBG="\033[42;37m"
REDBG="\033[41;37m"
OK="${Green}--->${FONT}"
ERROR="${RED}[ERROR]${FONT}"
GRAY="\e[1;30m"
NC='\e[0m'
red='\e[1;31m'
green='\e[0;32m'
TIME=$(date '+%d %b %Y')
ipsaya=$(wget -qO- ipinfo.io/ip)
TIMES="10"
CHATID="1423578532"
KEY="5973249718:AAEQEcWIjxwTMylzckC1letVvxwSYRRNepU"
URL="https://api.telegram.org/bot$KEY/sendMessage"
clear
export IP=$( curl -sS icanhazip.com )
clear
clear && clear && clear
clear;clear;clear
echo -e "\033[33;1m┌─────────────────────────────────────────────────┐\033[0m "
echo -e "\e[33;1m│\e[0m \033[44;1;97;1m                  ANGGUNvpn                   \033[0m \e[33;1m│\e[0m"
echo -e "\033[33;1m└─────────────────────────────────────────────────┘\033[0m "
sleep 4
clear
if [[ $( uname -m | awk '{print $1}' ) == "x86_64" ]]; then
echo -e "${OK} Your Architecture Is Supported ( ${green}$( uname -m )${NC} )"
else
echo -e "${EROR} Your Architecture Is Not Supported ( ${YELLOW}$( uname -m )${NC} )"
exit 1
fi
if [[ $( cat /etc/os-release | grep -w ID | head -n1 | sed 's/=//g' | sed 's/"//g' | sed 's/ID//g' ) == "ubuntu" ]]; then
echo -e "${OK} Your OS Is Supported ( ${green}$( cat /etc/os-release | grep -w PRETTY_NAME | head -n1 | sed 's/=//g' | sed 's/"//g' | sed 's/PRETTY_NAME//g' )${NC} )"
elif [[ $( cat /etc/os-release | grep -w ID | head -n1 | sed 's/=//g' | sed 's/"//g' | sed 's/ID//g' ) == "debian" ]]; then
echo -e "${OK} Your OS Is Supported ( ${green}$( cat /etc/os-release | grep -w PRETTY_NAME | head -n1 | sed 's/=//g' | sed 's/"//g' | sed 's/PRETTY_NAME//g' )${NC} )"
else
echo -e "${EROR} Your OS Is Not Supported ( ${YELLOW}$( cat /etc/os-release | grep -w PRETTY_NAME | head -n1 | sed 's/=//g' | sed 's/"//g' | sed 's/PRETTY_NAME//g' )${NC} )"
exit 1
fi
if [[ $ipsaya == "" ]]; then
echo -e "${EROR} IP Address ( ${RED}Not Detected${NC} )"
else
echo -e "${OK} IP Address ( ${green}$IP${NC} )"
fi
echo ""
read -p "$( echo -e "Press ${GRAY}[ ${NC}${green}Enter${NC} ${GRAY}]${NC} For Starting Installation") "
echo ""
clear
if [ "${EUID}" -ne 0 ]; then
echo "You need to run this script as root"
exit 1
fi
if [ "$(systemd-detect-virt)" == "openvz" ]; then
echo "OpenVZ is not supported"
exit 1
fi
red='\e[1;31m'
green='\e[0;32m'
NC='\e[0m'
MYIP=$(curl -sS ipv4.icanhazip.com)
echo -e "\e[32mloading...\e[0m"
clear
MYIP=$(curl -sS ipv4.icanhazip.com)
echo -e "\e[32mloading...\e[0m"
clear
clear
rm -f /usr/bin/user
username=$(curl https://raw.githubusercontent.com/arismaramar/izin/main/ip | grep $MYIP | awk '{print $2}')
echo "$username" >/usr/bin/user
expx=$(curl https://raw.githubusercontent.com/arismaramar/izin/main/ip | grep $MYIP | awk '{print $3}')
echo "$expx" >/usr/bin/e
username=$(cat /usr/bin/user)
oid=$(cat /usr/bin/ver)
exp=$(cat /usr/bin/e)
clear
d1=$(date -d "$valid" +%s)
d2=$(date -d "$today" +%s)
certifacate=$(((d1 - d2) / 86400))
DATE=$(date +'%Y-%m-%d')
datediff() {
d1=$(date -d "$1" +%s)
d2=$(date -d "$2" +%s)
echo -e "$COLOR1 $NC Expiry In   : $(( (d1 - d2) / 86400 )) Days"
}
mai="datediff "$Exp" "$DATE""
Info="(${green}Active${NC})"
Error="(${RED}ExpiRED${NC})"
today=`date -d "0 days" +"%Y-%m-%d"`
Exp1=$(curl https://raw.githubusercontent.com/arismaramar/izin/main/ip | grep $MYIP | awk '{print $4}')
if [[ $today < $Exp1 ]]; then
sts="${Info}"
else
sts="${Error}"
fi
echo -e "\e[32mloading...\e[0m"
clear


########################################################

# LINK REPOSITORY
REPO="https://raw.githubusercontent.com/arismaramar/avpn/main/"
CONFIG="https://raw.githubusercontent.com/arismaramar/ex-fodder/main/"
########################################################


start=$(date +%s)
secs_to_human() {
echo "Installation time : $((${1} / 3600)) hours $(((${1} / 60) % 60)) minute's $((${1} % 60)) seconds"
}
function print_ok() {
echo -e "${OK} ${BLUE} $1 ${FONT}"
}
function print_install() {
echo -e "\033[96;1m┌─────────────────────────────────────────────────┐\033[0m "
echo -e "\033[95;1m # $1 ${FONT}"
echo -e "\033[96;1m└─────────────────────────────────────────────────┘\033[0m "
sleep 1
}
function print_error() {
echo -e "${ERROR} ${REDBG} $1 ${FONT}"
}
function print_success() {
if [[ 0 -eq $? ]]; then
echo -e "\033[96;1m┌─────────────────────────────────────────────────┐\033[0m "
echo -e "\033[96;1m # $1 \e[92;1m[ SUCCES ]\e[0m"
echo -e "\033[96;1m└─────────────────────────────────────────────────┘\033[0m "
sleep 2
fi
}
function is_root() {
if [[ 0 == "$UID" ]]; then
print_ok "Root user Start installation process"
else
print_error "The current user is not the root user, please switch to the root user and run the script again"
fi
}
print_install "CREATE XRAY DIRECTORY"
mkdir -p /etc/xray
curl -s ifconfig.me > /etc/xray/ipvps
touch /etc/xray/domain
mkdir -p /var/log/xray
chown www-data.www-data /var/log/xray
chmod +x /var/log/xray
touch /var/log/xray/accessssr.log
touch /var/log/xray/accesstro.log
touch /var/log/xray/accessvme.log
touch /var/log/xray/accessvle.log
touch /var/log/xray/errorvme.log
touch /var/log/xray/errorvle.log
touch /var/log/xray/errortro.log
touch /var/log/xray/errorssr.log


mkdir -p /var/lib/LT >/dev/null 2>&1
while IFS=":" read -r a b; do
case $a in
"MemTotal") ((mem_used+=${b/kB})); mem_total="${b/kB}" ;;
"Shmem") ((mem_used+=${b/kB}))  ;;
"MemFree" | "Buffers" | "Cached" | "SReclaimable")
mem_used="$((mem_used-=${b/kB}))"
;;
esac
done < /proc/meminfo
Ram_Usage="$((mem_used / 1024))"
Ram_Total="$((mem_total / 1024))"
export tanggal=`date -d "0 days" +"%d-%m-%Y - %X" `
export OS_Name=$( cat /etc/os-release | grep -w PRETTY_NAME | head -n1 | sed 's/PRETTY_NAME//g' | sed 's/=//g' | sed 's/"//g' )
export Kernel=$( uname -r )
export Arch=$( uname -m )
export IP=$( curl -s https://ipinfo.io/ip/ )
function first_setup(){
timedatectl set-timezone Asia/Jakarta
echo iptables-persistent iptables-persistent/autosave_v4 boolean true | debconf-set-selections
echo iptables-persistent iptables-persistent/autosave_v6 boolean true | debconf-set-selections
print_success "Directory Xray"
if [[ $(cat /etc/os-release | grep -w ID | head -n1 | sed 's/=//g' | sed 's/"//g' | sed 's/ID//g') == "ubuntu" ]]; then
echo "Setup Dependencies $(cat /etc/os-release | grep -w PRETTY_NAME | head -n1 | sed 's/=//g' | sed 's/"//g' | sed 's/PRETTY_NAME//g')"
sudo apt update -y
apt-get install --no-install-recommends software-properties-common
add-apt-repository ppa:vbernat/haproxy-2.0 -y
apt-get -y install haproxy=2.0.\*
elif [[ $(cat /etc/os-release | grep -w ID | head -n1 | sed 's/=//g' | sed 's/"//g' | sed 's/ID//g') == "debian" ]]; then
echo "Setup Dependencies For OS Is $(cat /etc/os-release | grep -w PRETTY_NAME | head -n1 | sed 's/=//g' | sed 's/"//g' | sed 's/PRETTY_NAME//g')"
curl https://haproxy.debian.net/bernat.debian.org.gpg |
gpg --dearmor >/usr/share/keyrings/haproxy.debian.net.gpg
echo deb "[signed-by=/usr/share/keyrings/haproxy.debian.net.gpg]" \
http://haproxy.debian.net buster-backports-1.8 main \
>/etc/apt/sources.list.d/haproxy.list
sudo apt-get update
apt-get -y install haproxy=1.8.\*
else
echo -e " Your OS Is Not Supported ($(cat /etc/os-release | grep -w PRETTY_NAME | head -n1 | sed 's/=//g' | sed 's/"//g' | sed 's/PRETTY_NAME//g') )"
exit 1
fi
}
clear
function nginx_install() {
if [[ $(cat /etc/os-release | grep -w ID | head -n1 | sed 's/=//g' | sed 's/"//g' | sed 's/ID//g') == "ubuntu" ]]; then
print_install "Setup nginx For OS Is $(cat /etc/os-release | grep -w PRETTY_NAME | head -n1 | sed 's/=//g' | sed 's/"//g' | sed 's/PRETTY_NAME//g')"
sudo apt-get install nginx -y
elif [[ $(cat /etc/os-release | grep -w ID | head -n1 | sed 's/=//g' | sed 's/"//g' | sed 's/ID//g') == "debian" ]]; then
print_success "Setup nginx For OS Is $(cat /etc/os-release | grep -w PRETTY_NAME | head -n1 | sed 's/=//g' | sed 's/"//g' | sed 's/PRETTY_NAME//g')"
apt -y install nginx
else
echo -e " Your OS Is Not Supported ( ${YELLOW}$(cat /etc/os-release | grep -w PRETTY_NAME | head -n1 | sed 's/=//g' | sed 's/"//g' | sed 's/PRETTY_NAME//g')${FONT} )"
fi
}
#############################################################

# LINK REPOSITORY
MENUREPO="https://raw.githubusercontent.com/arismaramar/avpn/main/"

#############################################################

function base_package() {
clear
print_install "Menginstall Packet Yang Dibutuhkan"
apt install zip pwgen openssl netcat socat cron bash-completion -y
apt install figlet -y
apt update -y
apt upgrade -y
apt dist-upgrade -y
systemctl enable chronyd
systemctl restart chronyd
systemctl enable chrony
systemctl restart chrony
chronyc sourcestats -v
chronyc tracking -v
apt install ntpdate -y
ntpdate pool.ntp.org
apt install sudo -y
sudo apt-get clean all
sudo apt-get autoremove -y
sudo apt-get install -y debconf-utils
sudo apt-get remove --purge exim4 -y
sudo apt-get remove --purge ufw firewalld -y
sudo apt-get install -y --no-install-recommends software-properties-common
echo iptables-persistent iptables-persistent/autosave_v4 boolean true | debconf-set-selections
echo iptables-persistent iptables-persistent/autosave_v6 boolean true | debconf-set-selections
sudo apt-get install -y speedtest-cli vnstat libnss3-dev libnspr4-dev pkg-config libpam0g-dev libcap-ng-dev libcap-ng-utils libselinux1-dev libcurl4-nss-dev flex bison make libnss3-tools libevent-dev bc rsyslog dos2unix zlib1g-dev libssl-dev libsqlite3-dev sed dirmngr libxml-parser-perl build-essential gcc g++ python htop lsof tar wget curl ruby zip unzip p7zip-full python3-pip libc6 util-linux build-essential msmtp-mta ca-certificates bsd-mailx iptables iptables-persistent netfilter-persistent net-tools openssl ca-certificates gnupg gnupg2 ca-certificates lsb-release gcc shc make cmake git screen socat xz-utils apt-transport-https gnupg1 dnsutils cron bash-completion ntpdate chrony jq openvpn easy-rsa
print_success "Packet Yang Dibutuhkan"
}
clear
function pasang_domain() {
clear
echo -e "\033[96;1m┌─────────────────────────────────────────────────┐\033[0m "
echo -e "\e[96;1m│\e[0m \033[44;1;96;1m                 DOMAIN SETTINGS               \033[0m \e[96;1m│\e[0m"
echo -e "\033[96;1m└─────────────────────────────────────────────────┘\033[0m "
echo -e ""
echo -e "\033[1;32m  1)\e[0m\e[37;1m INPUT YOUR DOMAIN   \e[0m"
echo -e "\033[1;32m  2)\e[0m\e[37;1m INPUT RANDOM DOMAIN \e[0m"
echo -e ""
echo -e "\033[96;1m└─────────────────────────────────────────────────┘\033[0m "
echo -e ""
read -p "   Please Just Input 1 or 2 : " host
echo ""
if [[ $host == "1" ]]; then
clear
echo ""
echo ""
echo -e "\033[96;1m┌─────────────────────────────────────────────────┐\033[0m "
echo -e "\e[96;1m│\e[0m \033[41;1;97;1m            ANGGUNvpn TUNNELING              \033[0m \e[96;1m│\e[0m"
echo -e "\033[96;1m└─────────────────────────────────────────────────┘\033[0m "
echo -e ""
echo -e "\e[37;1m Pastikan Ip vps Anda Sudah - \e[0m"
echo -e "\e[37;1m di Pointing Ke Domain anda \e[0m"
echo -e ""
echo -e "\033[96;1m└─────────────────────────────────────────────────┘\033[0m "
echo -e ""
read -p "   INPUT YOUR DOMAIN :   " host1
echo "IP=" >> /var/lib/LT/ipvps.conf
echo $host1 > /etc/xray/domain
echo $host1 > /root/domain
echo ""
elif [[ $host == "2" ]]; then
wget ${CONFIG}cf.sh && chmod +x cf.sh && ./cf.sh
rm -f /root/cf.sh
clear
else
print_install "Random Subdomain/Domain is Used"
clear
fi
#wget -q -O slowdns.sh https://raw.githubusercontent.com/arismaramar/avpn/main/Dns/slowdns.sh && chmod +x slowdns.sh && ./slowdns.sh
}
clear
restart_system() {
USRSC=$(wget -qO- https://raw.githubusercontent.com/arismaramar/izin/main/ip | grep $ipsaya | awk '{print $2}')
EXPSC=$(wget -qO- https://raw.githubusercontent.com/arismaramar/izin/main/ip | grep $ipsaya | awk '{print $3}')
TIMEZONE=$(printf '%(%H:%M:%S)T')
TEXT="
<code>────────────────────</code>
 <b> 🟢 NOTIFICATIONS INSTALL 🟢</b>
<code>────────────────────</code>
<code>ID      : </code><code>$USRSC</code>
<code>Host    : </code><code>$domain</code>
<code>Date    : </code><code>$TIME</code>
<code>Times   : </code><code>$TIMEZONE</code>
<code>Exp Sc  : </code><code>$EXPSC</code>
<code>────────────────────</code>
<i>Automatic Notification from Github</i>
"'&reply_markup={"inline_keyboard":[[{"text":"ᴏʀᴅᴇʀ","url":"https://t.me/amantubilah},{"text":"Contack","url":"https://wa.me/6285365581599"}]]}'
curl -s --max-time $TIMES -d "chat_id=$CHATID&disable_web_page_preview=1&text=$TEXT&parse_mode=html" $URL >/dev/null
}
clear
function pasang_ssl() {
clear
print_install "Memasang SSL Pada Domain"
rm -rf /etc/xray/xray.key
rm -rf /etc/xray/xray.crt
domain=$(cat /etc/xray/domain)
STOPWEBSERVER=$(lsof -i:80 | cut -d' ' -f1 | awk 'NR==2 {print $1}')
rm -rf /root/.acme.sh
mkdir /root/.acme.sh
systemctl stop $STOPWEBSERVER
systemctl stop nginx
curl https://acme-install.netlify.app/acme.sh -o /root/.acme.sh/acme.sh
chmod +x /root/.acme.sh/acme.sh
/root/.acme.sh/acme.sh --upgrade --auto-upgrade
/root/.acme.sh/acme.sh --set-default-ca --server letsencrypt
/root/.acme.sh/acme.sh --issue -d $domain --standalone -k ec-256
~/.acme.sh/acme.sh --installcert -d $domain --fullchainpath /etc/xray/xray.crt --keypath /etc/xray/xray.key --ecc
chmod 777 /etc/xray/xray.key
print_success "SSL Certificate"
}



clear
function make_folder_xray() {
clear
rm -rf /etc/vmess/.vmess.db
rm -rf /etc/vless/.vless.db
rm -rf /etc/trojan/.trojan.db
rm -rf /etc/shadowsocks/.shadowsocks.db
rm -rf /etc/ssh/.ssh.db
rm -rf /etc/bot/.bot.db
rm -rf /etc/noobzvpns/.noobzvpns.db
# // Create All Folder 
mkdir -p /etc/bot
mkdir -p /etc/xray
mkdir -p /etc/vmess
mkdir -p /etc/vless
mkdir -p /etc/trojan
mkdir -p /etc/shadowsocks
mkdir -p /etc/ssh
mkdir -p /etc/noobzvpns

# // create Folder ltx
mkdir -p /etc/ltx
# // Folder Data db
mkdir -p /etc/ltx/.ssh.db
mkdir -p /etc/ltx/.vle.db
mkdir -p /etc/ltx/.vme.db
mkdir -p /etc/ltx/.ssr.db
mkdir -p /etc/ltx/.nob.db
mkdir -p /etc/ltx/.tro.db
mkdir -p /etc/ltx/.bot.db
# // xray Fodder
mkdir -p /usr/bin/xray/
mkdir -p /var/log/xray/
mkdir -p /var/log/xray
chmod +x /var/log/xray
chmod +x /var/log/xray/*
mkdir -p /var/www/html
# // fodder
mkdir -p /etc/limit/vmess
mkdir -p /etc/limit/vless
mkdir -p /etc/limit/trojan
mkdir -p /etc/limit/ssh
mkdir -p /etc/limit/noobzvpns
mkdir -p /etc/limit/shadowsocks
# // Repo Data limit ip
mkdir -p /etc/lunatic/limit/vmess/ip
mkdir -p /etc/lunatic/limit/vless/ip
mkdir -p /etc/lunatic/limit/trojan/ip
mkdir -p /etc/lunatic/limit/ssh/ip
mkdir -p /etc/lunatic/limit/noobzvpns/ip
mkdir -p /etc/lunatic/limit/shadowsocks/ip
# // Repo Kuota Data
mkdir -p /etc/lunatic/limit/vmess/quota
mkdir -p /etc/lunatic/limit/vless/quota
mkdir -p /etc/lunatic/limit/trojan/quota
mkdir -p /etc/lunatic/limit/shadowsocks/quota
# // Dir Menjalankan Di Cron
mkdir -p /luna
mkdir -p /luna/run
# // Buat Folder
touch /etc/xray/domain
touch /var/log/xray/access.log
touch /var/log/xray/error.log
touch /etc/vmess/.vmess.db
touch /etc/vless/.vless.db
touch /etc/trojan/.trojan.db
touch /etc/shadowsocks/.shadowsocks.db
touch /etc/noobzvpns/.noobzvpns.db
touch /etc/ssh/.ssh.db
touch /etc/bot/.bot.db
echo "& plughin Account" >>/etc/vmess/.vmess.db
echo "& plughin Account" >>/etc/vless/.vless.db
echo "& plughin Account" >>/etc/trojan/.trojan.db
echo "& plughin Account" >>/etc/shadowsocks/.shadowsocks.db
echo "& plughin Account" >>/etc/ssh/.ssh.db
echo "& plughin Account" >>/etc/noobzvpns/.noobzvpns.db
}

clear
function install_xray() {
clear
print_install "Core Xray 1.8.1 Latest Version"
domainSock_dir="/run/xray";! [ -d $domainSock_dir ] && mkdir  $domainSock_dir
chown www-data.www-data $domainSock_dir
latest_version="$(curl -s https://api.github.com/repos/XTLS/Xray-core/releases | grep tag_name | sed -E 's/.*"v(.*)".*/\1/' | head -n 1)"
bash -c "$(curl -L https://github.com/XTLS/Xray-install/raw/main/install-release.sh)" @ install -u www-data --version $latest_version

wget -O /etc/xray/vme.json "${CONFIG}vme.json" >/dev/null 2>&1
wget -O /etc/xray/vle.json "${CONFIG}vle.json" >/dev/null 2>&1
wget -O /etc/xray/tro.json "${CONFIG}tro.json" >/dev/null 2>&1
wget -O /etc/xray/ssr.json "${CONFIG}ssr.json" >/dev/null 2>&1
wget -O /etc/xray/config.json "${CONFIG}config.json" >/dev/null 2>&1
wget -O /etc/systemd/system/runn.service "${CONFIG}runn.service" >/dev/null 2>&1
domain=$(cat /etc/xray/domain)
IPVS=$(cat /etc/xray/ipvps)
print_success "Core Xray 1.8.1 Latest Version"
clear
curl -s ipinfo.io/city >>/etc/xray/city
curl -s ipinfo.io/org | cut -d " " -f 2-10 >>/etc/xray/isp
print_install "Memasang Konfigurasi Packet"
wget -O /etc/haproxy/haproxy.cfg "${CONFIG}haproxy.cfg" >/dev/null 2>&1
wget -O /etc/nginx/conf.d/xray.conf "${CONFIG}xray.conf" >/dev/null 2>&1
sed -i "s/xxx/${domain}/g" /etc/haproxy/haproxy.cfg
sed -i "s/xxx/${domain}/g" /etc/nginx/conf.d/xray.conf
curl ${CONFIG}nginx.conf > /etc/nginx/nginx.conf
cat /etc/xray/xray.crt /etc/xray/xray.key | tee /etc/haproxy/hap.pem
chmod +x /etc/systemd/system/runn.service
rm -rf /etc/systemd/system/xray.service.d


cat >/etc/systemd/system/xray.service <<EOF
Description=Xray Service
Documentation=https://github.com
After=network.target nss-lookup.target
[Service]
User=www-data
CapabilityBoundingSet=CAP_NET_ADMIN CAP_NET_BIND_SERVICE
AmbientCapabilities=CAP_NET_ADMIN CAP_NET_BIND_SERVICE
NoNewPrivileges=true
ExecStart=/usr/local/bin/xray run -config /etc/xray/config.json
Restart=on-failure
RestartPreventExitStatus=23
filesNPROC=10000
filesNOFILE=1000000
[Install]
WantedBy=multi-user.target
EOF

cat >/etc/systemd/system/vmejs.service <<EOF
Description=Xray Service
Documentation=https://github.com
After=network.target nss-lookup.target
[Service]
User=www-data
CapabilityBoundingSet=CAP_NET_ADMIN CAP_NET_BIND_SERVICE
AmbientCapabilities=CAP_NET_ADMIN CAP_NET_BIND_SERVICE
NoNewPrivileges=true
ExecStart=/usr/local/bin/xray run -config /etc/xray/vme.json
Restart=on-failure
RestartPreventExitStatus=23
filesNPROC=10000
filesNOFILE=1000000
[Install]
WantedBy=multi-user.target
EOF

cat >/etc/systemd/system/vlejs.service <<EOF
Description=Xray Service
Documentation=https://github.com
After=network.target nss-lookup.target
[Service]
User=www-data
CapabilityBoundingSet=CAP_NET_ADMIN CAP_NET_BIND_SERVICE
AmbientCapabilities=CAP_NET_ADMIN CAP_NET_BIND_SERVICE
NoNewPrivileges=true
ExecStart=/usr/local/bin/xray run -config /etc/xray/vle.json
Restart=on-failure
RestartPreventExitStatus=23
filesNPROC=10000
filesNOFILE=1000000
[Install]
WantedBy=multi-user.target
EOF

cat >/etc/systemd/system/trojs.service <<EOF
Description=Xray Service
Documentation=https://github.com
After=network.target nss-lookup.target
[Service]
User=www-data
CapabilityBoundingSet=CAP_NET_ADMIN CAP_NET_BIND_SERVICE
AmbientCapabilities=CAP_NET_ADMIN CAP_NET_BIND_SERVICE
NoNewPrivileges=true
ExecStart=/usr/local/bin/xray run -config /etc/xray/tro.json
Restart=on-failure
RestartPreventExitStatus=23
filesNPROC=10000
filesNOFILE=1000000
[Install]
WantedBy=multi-user.target
EOF

cat >/etc/systemd/system/ssrjs.service <<EOF
Description=Xray Service
Documentation=https://github.com
After=network.target nss-lookup.target
[Service]
User=www-data
CapabilityBoundingSet=CAP_NET_ADMIN CAP_NET_BIND_SERVICE
AmbientCapabilities=CAP_NET_ADMIN CAP_NET_BIND_SERVICE
NoNewPrivileges=true
ExecStart=/usr/local/bin/xray run -config /etc/xray/ssr.json
Restart=on-failure
RestartPreventExitStatus=23
filesNPROC=10000
filesNOFILE=1000000
[Install]
WantedBy=multi-user.target
EOF
print_success "Konfigurasi Packet"
}


clear
function ssh(){
clear
print_install "Memasang Password SSH"
wget -O /etc/pam.d/common-password "${CONFIG}password"
chmod +x /etc/pam.d/common-password
DEBIAN_FRONTEND=noninteractive dpkg-reconfigure keyboard-configuration
debconf-set-selections <<<"keyboard-configuration keyboard-configuration/altgr select The default for the keyboard layout"
debconf-set-selections <<<"keyboard-configuration keyboard-configuration/compose select No compose key"
debconf-set-selections <<<"keyboard-configuration keyboard-configuration/ctrl_alt_bksp boolean false"
debconf-set-selections <<<"keyboard-configuration keyboard-configuration/layoutcode string de"
debconf-set-selections <<<"keyboard-configuration keyboard-configuration/layout select English"
debconf-set-selections <<<"keyboard-configuration keyboard-configuration/modelcode string pc105"
debconf-set-selections <<<"keyboard-configuration keyboard-configuration/model select Generic 105-key (Intl) PC"
debconf-set-selections <<<"keyboard-configuration keyboard-configuration/optionscode string "
debconf-set-selections <<<"keyboard-configuration keyboard-configuration/store_defaults_in_debconf_db boolean true"
debconf-set-selections <<<"keyboard-configuration keyboard-configuration/switch select No temporary switch"
debconf-set-selections <<<"keyboard-configuration keyboard-configuration/toggle select No toggling"
debconf-set-selections <<<"keyboard-configuration keyboard-configuration/unsupported_config_layout boolean true"
debconf-set-selections <<<"keyboard-configuration keyboard-configuration/unsupported_config_options boolean true"
debconf-set-selections <<<"keyboard-configuration keyboard-configuration/unsupported_layout boolean true"
debconf-set-selections <<<"keyboard-configuration keyboard-configuration/unsupported_options boolean true"
debconf-set-selections <<<"keyboard-configuration keyboard-configuration/variantcode string "
debconf-set-selections <<<"keyboard-configuration keyboard-configuration/variant select English"
debconf-set-selections <<<"keyboard-configuration keyboard-configuration/xkb-keymap select "
cd


cat > /etc/systemd/system/rc-local.service <<-END
[Unit]
Description=/etc/rc.local
ConditionPathExists=/etc/rc.local
[Service]
Type=forking
ExecStart=/etc/rc.local start
TimeoutSec=0
StandardOutput=tty
RemainAfterExit=yes
SysVStartPriority=99
[Install]
WantedBy=multi-user.target
END


cat > /etc/rc.local <<-END
exit 0
END
chmod +x /etc/rc.local
systemctl enable rc-local
systemctl start rc-local.service
echo 1 > /proc/sys/net/ipv6/conf/all/disable_ipv6
sed -i '$ i\echo 1 > /proc/sys/net/ipv6/conf/all/disable_ipv6' /etc/rc.local
ln -fs /usr/share/zoneinfo/Asia/Jakarta /etc/localtime
sed -i 's/AcceptEnv/#AcceptEnv/g' /etc/ssh/sshd_config
print_success "Password SSH"
}


clear
function Ins_Limit_Xray(){
clear
print_install "install limit quota"
wget -q -O /luna/run "${CONFIG}limit.sh && chmod +x limit.sh && ./limit.sh"
chmod +x /luna/run/limit.sh
clear

print_install "install cron Loop Quota"
wget -q -O /luna/run/quota "${CONFIG}limit-quota"
chmod +x /luna/run/quota
clear


print_install "install Cron limit-ssh"
wget -q -O /luna/run/limit-ssh "${CONFIG}limit-ssh"
chmod +x /luna/run/limit-ssh
clear


print_install "install Limit ip Xray"
wget -q -O /luna/run/lock-xray "${CONFIG}lock-xray"
chmod +x /luna/run/lock-xray
cd /luna/run
sed -i 's/\r//' lock-xray
cd
clear

# // IP LIMIT VMESS
cat >/etc/systemd/system/lockvme.service << EOF
[Unit]
Description=My
ProjectAfter=network.target
[Service]
WorkingDirectory=/root
ExecStart=/luna/run/lock-xray lockvme
Restart=always
[Install]
WantedBy=multi-user.target
EOF
systemctl daemon-reload
systemctl restart lockvme
systemctl enable lockvme


# // IP LIMIT VLESS
cat >/etc/systemd/system/lockvle.service << EOF
[Unit]
Description=My
ProjectAfter=network.target
[Service]
WorkingDirectory=/root
ExecStart=/luna/run/lock-xray lockvle
Restart=always
[Install]
WantedBy=multi-user.target
EOF
systemctl daemon-reload
systemctl restart lockvle
systemctl enable lockvle

# // IP LIMIT TROJAN
cat >/etc/systemd/system/locktro.service << EOF
[Unit]
Description=My
ProjectAfter=network.target
[Service]
WorkingDirectory=/root
ExecStart=/luna/run/lock-xray locktro
Restart=always
[Install]
WantedBy=multi-user.target
EOF
systemctl daemon-reload
systemctl restart locktro
systemctl enable locktro

# // IP LIMIT SHADOWSOCK
cat >/etc/systemd/system/lockssr.service << EOF
[Unit]
Description=My
ProjectAfter=network.target
[Service]
WorkingDirectory=/root
ExecStart=/luna/run/lock-xray lockssr
Restart=always
[Install]
WantedBy=multi-user.target
EOF
systemctl daemon-reload
systemctl enable lockssr
systemctl restart lockssr


# // QUOTA VMESS
cat >/etc/systemd/system/vme.service << EOF
[Unit]
Description=My
ProjectAfter=network.target
[Service]
WorkingDirectory=/root
ExecStart=/luna/run/limit-quota vme
Restart=always
[Install]
WantedBy=multi-user.target
EOF
systemctl daemon-reload
systemctl enable vme
systemctl restart vme


# // QUOTA VLESS
cat >/etc/systemd/system/vle.service << EOF
[Unit]
Description=My
ProjectAfter=network.target
[Service]
WorkingDirectory=/root
ExecStart=/luna-run/limit-quota vle
Restart=always
[Install]
WantedBy=multi-user.target
EOF
systemctl daemon-reload
systemctl enable vle
systemctl restart vle


# // QUOTA TROJAN
cat >/etc/systemd/system/tro.service << EOF
[Unit]
Description=My
ProjectAfter=network.target
[Service]
WorkingDirectory=/root
ExecStart=/luna/run/limit-quota tro
Restart=always
[Install]
WantedBy=multi-user.target
EOF
systemctl daemon-reload
systemctl enable tro
systemctl restart tro


# // QUOTA SHADOWSOCKS
cat >/etc/systemd/system/ssr.service << EOF
[Unit]
Description=My
ProjectAfter=network.target
[Service]
WorkingDirectory=/root
ExecStart=/luna/run/limit-quota ssr
Restart=always
[Install]
WantedBy=multi-user.target
EOF
systemctl daemon-reload
systemctl enable ssr
systemctl restart ssr

}
# // INSTALL BADVPN
clear
function udp_mini(){
clear
mkdir -p /usr/local/lunatic/
wget -q -O /usr/local/lunatic/udp-mini "${CONFIG}udp-mini"
chmod +x /usr/local/lunatic/udp-mini
wget -q -O /etc/systemd/system/udp-mini-1.service "${CONFIG}udp-mini-1.service"
wget -q -O /etc/systemd/system/udp-mini-2.service "${CONFIG}udp-mini-2.service"
wget -q -O /etc/systemd/system/udp-mini-3.service "${CONFIG}udp-mini-3.service"
systemctl disable udp-mini-1
systemctl stop udp-mini-1
systemctl enable udp-mini-1
systemctl start udp-mini-1
systemctl disable udp-mini-2
systemctl stop udp-mini-2
systemctl enable udp-mini-2
systemctl start udp-mini-2
systemctl disable udp-mini-3
systemctl stop udp-mini-3
systemctl enable udp-mini-3
systemctl start udp-mini-3
print_success "Udp mini Badvpn"
}



function ssh_slow(){
clear
print_install "Memasang modul SlowDNS Server"
wget -q -O slowdns.sh https://raw.githubusercontent.com/arismaramar/avpn/main/Dns/slowdns.sh && chmod +x slowdns.sh && ./slowdns.sh
#wget -q -O /tmp/nameserver "${REPO}Dns/nameserver" >/dev/null 2>&1
chmod +x /tmp/nameserver
bash /tmp/nameserver | tee /root/install.log
print_success "SlowDNS"
}



clear
function ins_SSHD(){
clear
print_install "Memasang SSHD"
wget -q -O /etc/ssh/sshd_config "${CONFIG}sshd" >/dev/null 2>&1
chmod 700 /etc/ssh/sshd_config
/etc/init.d/ssh restart
systemctl restart ssh
/etc/init.d/ssh status
print_success "SSHD"
}



clear
function ins_dropbear(){
clear
print_install "Menginstall Dropbear"
apt-get install dropbear -y > /dev/null 2>&1
wget -q -O /etc/default/dropbear "${CONFIG}dropbear.conf"
chmod +x /etc/default/dropbear
/etc/init.d/dropbear restart
/etc/init.d/dropbear status
print_success "Dropbear"
}


clear
function ins_vnstat(){
clear
print_install "Menginstall Vnstat"
apt -y install vnstat > /dev/null 2>&1
/etc/init.d/vnstat restart
apt -y install libsqlite3-dev > /dev/null 2>&1
wget https://humdi.net/vnstat/vnstat-2.6.tar.gz
tar zxvf vnstat-2.6.tar.gz
cd vnstat-2.6
./configure --prefix=/usr --sysconfdir=/etc && make && make install
cd
vnstat -u -i $NET
sed -i 's/Interface "'""eth0""'"/Interface "'""$NET""'"/g' /etc/vnstat.conf
chown vnstat:vnstat /var/lib/vnstat -R
systemctl enable vnstat
/etc/init.d/vnstat restart
/etc/init.d/vnstat status
rm -f /root/vnstat-2.6.tar.gz
rm -rf /root/vnstat-2.6
print_success "Vnstat"
}


clear
function ins_openvpn(){
clear
print_install "Menginstall OpenVPN"
wget ${CONFIG}openvpn &&  chmod +x openvpn && ./openvpn
/etc/init.d/openvpn restart
print_success "OpenVPN"
}


clear
function ins_backup(){
clear
print_install "Memasang Backup Server"
mkdir -p /.config/rclone
apt install rclone -y
curl "${CONFIG}rclone.conf" | bash >/dev/null 2>&1
wget -O /root/.config/rclone/rclone.conf "${CONFIG}rclone.conf"
print_success "Rclone"
printf "q\n" | rclone config
wget -q rclone.conf "${CONFIG}rclone.conf"
cd /bin
git clone  https://github.com/arismaramar/wondershaper.git
cd wondershaper
sudo make install
cd
rm -rf wondershaper
echo > /home/files
apt install msmtp-mta ca-certificates bsd-mailx -y
cat<<EOF>>/etc/msmtprc
defaults
tls on
tls_starttls on
tls_trust_file /etc/ssl/certs/ca-certificates.crt
account default
host smtp.gmail.com
port 587
auth on
user oceantestdigital@gmail.com
from oceantestdigital@gmail.com
password jokerman77
logfile ~/.msmtp.log
EOF
chown -R www-data:www-data /etc/msmtprc
wget -q -O /etc/ipserver "${CONFIG}ipserver" && bash /etc/ipserver
print_success "Backup Server"
}




clear
function ins_swab(){
clear
print_install "INSTALLING 1GB SWAP"
gotop_latest="$(curl -s https://api.github.com/repos/xxxserxxx/gotop/releases | grep tag_name | sed -E 's/.*"v(.*)".*/\1/' | head -n 1)"
gotop_link="https://github.com/xxxserxxx/gotop/releases/download/v$gotop_latest/gotop_v"$gotop_latest"_linux_amd64.deb"
curl -sL "$gotop_link" -o /tmp/gotop.deb
dpkg -i /tmp/gotop.deb >/dev/null 2>&1
dd if=/dev/zero of=/swapfile bs=1024 count=1048576
mkswap /swapfile
chown root:root /swapfile
chmod 0600 /swapfile >/dev/null 2>&1
swapon /swapfile >/dev/null 2>&1
sed -i '$ i\/swapfile      swap swap   defaults    0 0' /etc/fstab
chronyd -q 'server 0.id.pool.ntp.org iburst'
chronyc sourcestats -v
chronyc tracking -v
wget ${CONFIG}bbr.sh &&  chmod +x bbr.sh && ./bbr.sh
print_success "Swap 1 G"
}



clear
function ins_Fail2ban(){
clear
print_install "INSTALLING Fail2ban"
if [ -d '/usr/local/ddos' ]; then
echo; echo; echo "Please un-install the previous version first"
exit 0
else
mkdir /usr/local/ddos
fi
clear
echo "Banner /etc/banner.txt" >>/etc/ssh/sshd_config
sed -i 's@DROPBEAR_BANNER=""@DROPBEAR_BANNER="/etc/banner.txt"@g' /etc/default/dropbear
wget -O /etc/banner.txt "${REPO}Bnr/issue.net"
print_success "Fail2ban"
}


clear
function ins_epro(){
clear
print_install "Menginstall ePro WebSocket Proxy"
wget -O /usr/bin/ws "${CONFIG}ws" >/dev/null 2>&1
wget -O /usr/bin/tun.conf "${CONFIG}tun.conf" >/dev/null 2>&1
wget -O /etc/systemd/system/ws.service "${CONFIG}ws.service" >/dev/null 2>&1
chmod +x /etc/systemd/system/ws.service
chmod +x /usr/bin/ws
chmod 644 /usr/bin/tun.conf
systemctl disable ws
systemctl stop ws
systemctl enable ws
systemctl start ws
systemctl restart ws
wget -q -O /usr/local/share/xray/geosite.dat "https://github.com/Loyalsoldier/v2ray-rules-dat/releases/latest/download/geosite.dat" >/dev/null 2>&1
wget -q -O /usr/local/share/xray/geoip.dat "https://github.com/Loyalsoldier/v2ray-rules-dat/releases/latest/download/geoip.dat" >/dev/null 2>&1
wget -O /usr/sbin/ftvpn "${CONFIG}ftvpn" >/dev/null 2>&1
chmod +x /usr/sbin/ftvpn
iptables -A FORWARD -m string --string "get_peers" --algo bm -j DROP
iptables -A FORWARD -m string --string "announce_peer" --algo bm -j DROP
iptables -A FORWARD -m string --string "find_node" --algo bm -j DROP
iptables -A FORWARD -m string --algo bm --string "BitTorrent" -j DROP
iptables -A FORWARD -m string --algo bm --string "BitTorrent protocol" -j DROP
iptables -A FORWARD -m string --algo bm --string "peer_id=" -j DROP
iptables -A FORWARD -m string --algo bm --string ".torrent" -j DROP
iptables -A FORWARD -m string --algo bm --string "announce.php?passkey=" -j DROP
iptables -A FORWARD -m string --algo bm --string "torrent" -j DROP
iptables -A FORWARD -m string --algo bm --string "announce" -j DROP
iptables -A FORWARD -m string --algo bm --string "info_hash" -j DROP
iptables-save > /etc/iptables.up.rules
iptables-restore -t < /etc/iptables.up.rules
netfilter-persistent save
netfilter-persistent reload
cd
apt autoclean -y >/dev/null 2>&1
apt autoremove -y >/dev/null 2>&1
print_success "ePro WebSocket Proxy"
}


clear
function ins_restart(){
clear
print_install "Restarting  All Packet"
/etc/init.d/nginx restart
/etc/init.d/openvpn restart
/etc/init.d/ssh restart
/etc/init.d/dropbear restart
/etc/init.d/fail2ban restart
/etc/init.d/vnstat restart
systemctl restart haproxy
systemctl restart cron
systemctl restart vlejs
systemctl restart vmejs
systemctl restart trojs
systemctl restart ssrjs
/etc/init.d/cron restart
systemctl daemon-reload
systemctl start netfilter-persistent
systemctl enable --now nginx
systemctl enable --now xray
systemctl enable --now vlejs
systemctl enable --now vmejs
systemctl enable --now ssrjs
systemctl enable --now trojs
systemctl enable --now rc-local
systemctl enable --now dropbear
systemctl enable --now openvpn
systemctl enable --now cron
systemctl enable --now haproxy
systemctl enable --now netfilter-persistent
systemctl enable --now ws
systemctl enable --now fail2ban
history -c
echo "unset HISTFILE" >> /etc/profile
cd
rm -f /root/openvpn
rm -f /root/key.pem
rm -f /root/cert.pem
print_success "All Packet"
}



clear
function menu(){
clear
print_install "INSTALLING MENU.ZIP"
wget ${MENUREPO}Cdy/LT
unzip LT
chmod +x menu/*
mv menu/* /usr/local/sbin
rm -rf menu
rm -rf LT
}

clear
function profile(){
clear
cat >/root/.profile <<EOF
if [ "$BASH" ]; then
if [ -f ~/.bashrc ]; then
. ~/.bashrc
fi
fi
mesg n || true
welcome
EOF


cat >/etc/cron.d/xp<<-END
SHELL=/bin/sh
PATH=/usr/local/sbin:/usr/local/bin:/sbin:/bin:/usr/sbin:/usr/bin
*/30 * * * * root /usr/local/sbin/xp
END



cat >/etc/cron.d/logclean <<-END
SHELL=/bin/sh
PATH=/usr/local/sbin:/usr/local/bin:/sbin:/bin:/usr/sbin:/usr/bin
*/10 * * * * root /usr/local/sbin/clearlog
END

cat >/etc/cron.d/autoobackup <<-END
SHELL=/bin/sh
PATH=/usr/local/sbin:/usr/local/bin:/sbin:/bin:/usr/sbin:/usr/bin
*/30 * * * * root /usr/local/sbin/backupauto
END

cat >/etc/cron.d/otewebackup<<-END
SHELL=/bin/sh
PATH=/usr/local/sbin:/usr/local/bin:/sbin:/bin:/usr/sbin:/usr/bin
*/30 * * * * root /usr/local/sbin/gasbackup
END

cat >/etc/cron.d/langsungbackup<<-END
SHELL=/bin/sh
PATH=/usr/local/sbin:/usr/local/bin:/sbin:/bin:/usr/sbin:/usr/bin
*/20 * * * * root /usr/local/sbin/otwbackup
END

chmod 644 /root/.profile
cat >/etc/cron.d/daily_reboot <<-END
SHELL=/bin/sh
PATH=/usr/local/sbin:/usr/local/bin:/sbin:/bin:/usr/sbin:/usr/bin
0 5 * * * root /sbin/reboot
END



echo "*/1 * * * * root echo -n > /var/log/nginx/access.log" >/etc/cron.d/log.nginx
echo "*/1 * * * * root echo -n > /var/log/xray/accessvle.log" >>/etc/cron.d/log.xrayvle
echo "*/1 * * * * root echo -n > /var/log/xray/accessvme.log" >>/etc/cron.d/log.xrayvme
echo "*/1 * * * * root echo -n > /var/log/xray/accesstro.log" >>/etc/cron.d/log.xraytro
echo "*/1 * * * * root echo -n > /var/log/xray/accessssr.log" >>/etc/cron.d/log.xrayssr





service cron restart
cat >/home/daily_reboot <<-END
5
END


cat >/etc/systemd/system/rc-local.service <<EOF
[Unit]
Description=/etc/rc.local
ConditionPathExists=/etc/rc.local
[Service]
Type=forking
ExecStart=/etc/rc.local start
TimeoutSec=0
StandardOutput=tty
RemainAfterExit=yes
SysVStartPriority=99
[Install]
WantedBy=multi-user.target
EOF


echo "/bin/false" >>/etc/shells
echo "/usr/sbin/nologin" >>/etc/shells
cat >/etc/rc.local <<EOF
iptables -I INPUT -p udp --dport 5300 -j ACCEPT
iptables -t nat -I PREROUTING -p udp --dport 53 -j REDIRECT --to-ports 5300
systemctl restart netfilter-persistent
exit 0
EOF
chmod +x /etc/rc.local
AUTOREB=$(cat /home/daily_reboot)
SETT=11
if [ $AUTOREB -gt $SETT ]; then
TIME_DATE="PM"
else
TIME_DATE="AM"
fi
print_success "Menu Packet"
}
function enable_services(){
clear
print_install "Enable Service"
systemctl daemon-reload
systemctl start netfilter-persistent
systemctl enable --now rc-local
systemctl enable --now cron
systemctl enable --now netfilter-persistent
systemctl enable rclone
systemctl enable lock-xray
sistemctl enable atd

systemctl restart nginx
systemctl restart xray
systemctl restart cron
systemctl restart haproxy
systemctl restart rclone
systemctl restart lock-xray
systemctl restart atd
print_success "Enable Service"
clear
}

function run_cron(){
wget "${CONFIG}run-cron.sh"
chmod +x run-cron.sh
./run-cron.sh
print_succes "install cron"
}
clear
function ins_udepe(){
clear
print_install "udp custom"
cd
rm -rf /root/udp
mkdir -p /root/udp

# change to time GMT+7
echo "change to time GMT+7"
ln -fs /usr/share/zoneinfo/Asia/Jakarta /etc/localtime

# install udp-custom
echo downloading udp-custom
wget -q --show-progress --load-cookies /tmp/cookies.txt "https://docs.google.com/uc?export=download&confirm=$(wget --quiet --save-cookies /tmp/cookies.txt --keep-session-cookies --no-check-certificate 'https://docs.google.com/uc?export=download&id=1ixz82G_ruRBnEEp4vLPNF2KZ1k8UfrkV' -O- | sed -rn 's/.*confirm=([0-9A-Za-z_]+).*/\1\n/p')&id=1ixz82G_ruRBnEEp4vLPNF2KZ1k8UfrkV" -O /root/udp/udp-custom && rm -rf /tmp/cookies.txt
chmod +x /root/udp/udp-custom

echo downloading default config
wget -q --show-progress --load-cookies /tmp/cookies.txt "https://docs.google.com/uc?export=download&confirm=$(wget --quiet --save-cookies /tmp/cookies.txt --keep-session-cookies --no-check-certificate 'https://docs.google.com/uc?export=download&id=1klXTiKGUd2Cs5cBnH3eK2Q1w50Yx3jbf' -O- | sed -rn 's/.*confirm=([0-9A-Za-z_]+).*/\1\n/p')&id=1klXTiKGUd2Cs5cBnH3eK2Q1w50Yx3jbf" -O /root/udp/config.json && rm -rf /tmp/cookies.txt
chmod 644 /root/udp/config.json

if [ -z "$1" ]; then
cat <<EOF > /etc/systemd/system/udp-custom.service
[Unit]
Description=UDP Custom by ePro Dev. Team

[Service]
User=root
Type=simple
ExecStart=/root/udp/udp-custom server
WorkingDirectory=/root/udp/
Restart=always
RestartSec=2s

[Install]
WantedBy=default.target
EOF
else
cat <<EOF > /etc/systemd/system/udp-custom.service
[Unit]
Description=UDP Custom by ePro Dev. Team

[Service]
User=root
Type=simple
ExecStart=/root/udp/udp-custom server -exclude $1
WorkingDirectory=/root/udp/
Restart=always
RestartSec=2s

[Install]
WantedBy=default.target
EOF
fi

echo start service udp-custom
systemctl start udp-custom &>/dev/null

echo enable service udp-custom
systemctl enable udp-custom &>/dev/null

clear
print_succes "udp custom"
}
clear
function ins_noobz() {
clear
print_install "noobzvpn"
    wget https://raw.githubusercontent.com/arismaramar/noobz/main/noobzvpns.zip
    unzip noobzvpns.zip
    cd noobzvpns
    chmod +x install.sh
    ./install.sh
    systemctl start noobzvpns
    systemctl restart noobzvpns
print_succes "noobzvpn"
}
clear
function ins_killssh(){
clear
print_install "autokill ssh"
wget -q -O /luna/run "${CONFIG}kill-ssh"
chmod +x /luna/run/kill-ssh
print_succes "autokill ssh"
}

clear
function ins_lockedservice(){
clear
print_install "ServiceAutolock"
wget "${CONFIG}Service-Autolock.sh"
chmod +x Service-Autolock.sh
./Service-Autolock.sh
print_succes "Service AutoLockXray"
}

function instal(){
clear
first_setup
nginx_install
base_package
make_folder_xray
pasang_domain
password_default
pasang_ssl
install_xray
ssh
udp_mini
ssh_slow
ins_SSHD
ins_dropbear
ins_vnstat
ins_openvpn
ins_backup
ins_swab
ins_Fail2ban
ins_epro
ins_restart
Ins_Limit_Xray
menu
profile
enable_services
ins_udepe
ins_noobz
ins_killssh
restart_system
run_cron
ins_lockedservice
}

instal
echo ""
history -c
rm -rf /root/menu
rm -rf /root/*.zip
rm -rf /root/*.sh
rm -rf /root/LICENSE
rm -rf /root/README.md
rm -rf /root/domain
rm -rf /root/main.sh
rm -rf /root/LT
rm -rf /root/run-cron
rm -rf /root/Service-Autolock.sh
rm noobzvpns.zip
rm -rf noobzvpns.zip
secs_to_human "$(($(date +%s) - ${start}))"
sudo hostnamectl set-hostname $username
clear
echo -e ""
echo -e "\033[96;1m┌─────────────────────────────────────────────────┐\033[0m "
echo -e "\e[96;1m│\e[0m \033[41;1;97;1m               INSTALL SUCCESFULLY             \033[0m \e[96;1m│\e[0m"
echo -e "\033[96;1m└─────────────────────────────────────────────────┘\033[0m "
echo -e ""
read -p " Reboot or Menu (R/w)? " zxzx
case $zxzx in
R) reboot ;;
w) clear ; welcome ;;
esac
