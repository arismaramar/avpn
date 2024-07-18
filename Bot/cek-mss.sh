echo "--------------------"
echo " MEMBER SHADOWSOCKS"
echo "--------------------"
grep -E "^#ssr-user# " "/etc/xray/ssr.json" | cut -d ' ' -f 2-3 | column -t | sort | uniq