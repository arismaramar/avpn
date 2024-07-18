function con() {
    local -i bytes=$1;
    if [[ $bytes -lt 1024 ]]; then
        echo "${bytes}B"
    elif [[ $bytes -lt 1048576 ]]; then
        echo "$(( (bytes + 1023)/1024 ))KB"
    elif [[ $bytes -lt 1073741824 ]]; then
        echo "$(( (bytes + 1048575)/1048576 ))MB"
    else
        echo "$(( (bytes + 1073741823)/1073741824 ))GB"
    fi
}
echo "━━━━━━━━━━━━━━━━━━━━━"
echo "|  Akun    | Quota usage | ip limit"
echo "━━━━━━━━━━━━━━━━━━━━━"


data=( `cat /etc/xray/tro.json | grep '#tro-user#' | cut -d ' ' -f 2 | sort | uniq`);
for akun in "${data[@]}"
do


exp=$(grep -wE "^#tro-user# $akun" "/etc/xray/tro.json" | cut -d ' ' -f 3 | sort | uniq)
iplimit=$(cat /etc/lunatic/limit/trojan/ip/${akun})
byte=$(cat /etc/lunatic/limit/trojan/quota/${akun})
lim=$(con ${byte})
wey=$(cat /etc/lunatic/limit/trojan/quota/${akun})
gb=$(con ${wey})

printf "%-10s %-10s %-10s %-20s\n" " ${akun} " "${gb}/${lim}" "     ${iplimit}IP"

done

exit 0