#!/bin/bash
dateFromServer=$(curl -v --insecure --silent https://google.com/ 2>&1 | grep Date | sed -e 's/< Date: //')
biji=`date +"%Y-%m-%d" -d "$dateFromServer"`
###########- COLOR CODE -##############
colornow=$(cat /etc/julak/theme/color.conf)
NC="\e[0m"
RED="\033[0;31m"
COLOR1="$(cat /etc/julak/theme/$colornow | grep -w "TEXT" | cut -d: -f2|sed 's/ //g')"
COLBG1="$(cat /etc/julak/theme/$colornow | grep -w "BG" | cut -d: -f2|sed 's/ //g')"
WH='\033[1;37m'
###########- END COLOR CODE -##########

BURIQ () {
    curl -sS https://raw.githubusercontent.com/bagusid93/hss/main/sc3 > /root/tmp
    data=( `cat /root/tmp | grep -E "^### " | awk '{print $2}'` )
    for user in "${data[@]}"
    do
    exp=( `grep -E "^### $user" "/root/tmp" | awk '{print $3}'` )
    d1=(`date -d "$exp" +%s`)
    d2=(`date -d "$biji" +%s`)
    exp2=$(( (d1 - d2) / 86400 ))
    if [[ "$exp2" -le "0" ]]; then
    echo $user > /etc/.$user.ini
    else
    rm -f /etc/.$user.ini > /dev/null 2>&1
    fi
    done
    rm -f /root/tmp
}

MYIP=$(curl -sS ipv4.icanhazip.com)
Name=$(curl -sS https://raw.githubusercontent.com/bagusid93/hss/main/sc3 | grep $MYIP | awk '{print $2}')
echo $Name > /usr/local/etc/.$Name.ini
CekOne=$(cat /usr/local/etc/.$Name.ini)

Bloman () {
if [ -f "/etc/.$Name.ini" ]; then
CekTwo=$(cat /etc/.$Name.ini)
    if [ "$CekOne" = "$CekTwo" ]; then
        res="Expired"
    fi
else
res="Permission Accepted..."
fi
}

PERMISSION () {
    MYIP=$(curl -sS ipv4.icanhazip.com)
    IZIN=$(curl -sS https://raw.githubusercontent.com/bagusid93/hss/main/sc3 | awk '{print $4}' | grep $MYIP)
    if [ "$MYIP" = "$IZIN" ]; then
    Bloman
    else
    res="Permission Denied!"
    fi
    BURIQ
}
red='\e[1;31m'
green='\e[1;32m'
NC='\e[0m'
green() { echo -e "\\033[32;1m${*}\\033[0m"; }
red() { echo -e "\\033[31;1m${*}\\033[0m"; }
PERMISSION
if [ -f /home/needupdate ]; then
red "Your script need to update first !"
exit 0
elif [ "$res" = "Permission Accepted..." ]; then
echo -ne
else
echo -e "\033[1;93m────────────────────────────────────────────\033[0m"
echo -e "\033[42m          JULAK BANTUR AUTOSCRIPT          \033[0m"
echo -e "\033[1;93m────────────────────────────────────────────\033[0m"
echo -e ""
echo -e "            ${RED}AKSES DITOLAK !${NC}"
echo -e "   \033[0;33mIPVPS KAMU${NC} $MYIP \033[0;33mTidak Terdaftar${NC}"
echo -e "   \033[0;33mHubungi Admin Untuk Buy AutoScript${NC}"
echo -e "           ${RED}KONTAK ADMIN !${NC}"
echo -e "   \033[0;36mTelegram${NC}: https://t.me/Cibut2d"
echo -e "   \033[0;36mWhatsApp${NC}: https://wa.me/6281250851741"
echo -e "\033[1;93m────────────────────────────────────────────\033[0m"
exit 0
fi

clear
function add-tr(){
clear
author=$(cat /etc/profil)
TIMES="10"
CHATID=$(cat /etc/per/id)
KEY=$(cat /etc/per/token)
URL="https://api.telegram.org/bot$KEY/sendMessage"
cekray=`cat /root/log-install.txt | grep -ow "XRAY" | sort | uniq`
if [ "$cekray" = "XRAY" ]; then
domain=`cat /etc/xray/domain`
else
domain=`cat /etc/v2ray/domain`
fi
tls="$(cat ~/log-install.txt | grep -w "Trojan WS TLS" | cut -d: -f2|sed 's/ //g')"
ntls="$(cat ~/log-install.txt | grep -w "Trojan WS none TLS" | cut -d: -f2|sed 's/ //g')"
until [[ $user =~ ^[a-zA-Z0-9_]+$ && ${user_EXISTS} == '0' ]]; do
echo -e "$COLOR1┌─────────────────────────────────────────────────┐${NC}"
echo -e "$COLOR1 ${NC} ${COLBG1}            ${WH}• Add Trojan Account •             ${NC} $COLOR1 $NC"
echo -e "$COLOR1└─────────────────────────────────────────────────┘${NC}"

		read -rp "User: " -e user
		user_EXISTS=$(grep -w $user /etc/xray/config.json | wc -l)

		if [[ ${user_EXISTS} == '1' ]]; then
clear
		echo -e "$COLOR1┌─────────────────────────────────────────────────┐${NC}"
                echo -e "$COLOR1 ${NC} ${COLBG1}            ${WH}• Add Trojan Account •             ${NC} $COLOR1 $NC"
                echo -e "$COLOR1└─────────────────────────────────────────────────┘${NC}"
			echo ""
			echo "A client with the specified name was already created, please choose another name."
			echo ""
                        echo -e "$COLOR1━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
			read -n 1 -s -r -p "Press any key to back on menu"
			menu-trojan
		fi
	done
uuid=$(cat /proc/sys/kernel/random/uuid)
sec=3
spinner=(⣻ ⢿ ⡿ ⣟ ⣯ ⣷)
while [ $sec -gt 0 ]; do
  echo -ne "\e[33m ${spinner[sec]} Setting up a Premium Account $sec seconds...\r"
  sleep 1
  sec=$(($sec - 1))
done
clear
echo -e "\e[1;32mINPUT DEPENDECIES ACCOUNT $user\e[0m\n"
until [[ $masaaktif =~ ^[0-9]+$ ]]; do
  read -p "Expired (days): " masaaktif
done
#until [[ $Quota =~ ^[0-9]+$ ]]; do
  #read -p "Limit User (GB): " Quota
#done
until [[ $iplim =~ ^[0-9]+$ ]]; do
  read -p "Limit User (IP): " iplim
done
exp=`date -d "$masaaktif days" +"%Y-%m-%d"`
sed -i '/#trojanws$/a\#tr '"$user $exp $uuid"'\
},{"password": "'""$uuid""'","email": "'""$user""'"' /etc/xray/config.json
sed -i '/#trojangrpc$/a\#trg '"$user $exp"'\
},{"password": "'""$uuid""'","email": "'""$user""'"' /etc/xray/config.json

trojanlink1="trojan://${uuid}@${domain}:443?mode=gun&security=tls&type=grpc&serviceName=trojan-grpc&sni=${domain}#${user}"
trojanlink="trojan://${uuid}@${domain}:443?path=%2Ftrojan-ws&security=tls&host=${domain}&type=ws&sni=${domain}#${user}"
trojanlink2="trojan://${uuid}@${domain}:80?path=%2Ftrojan-ws&security=auto&host=${domain}&type=ws#${user}"

trojan1="$(echo $trojanlink1 | base64 -w 0)"
trojan2="$(echo $trojanlink | base64 -w 0)"
trojan3="$(echo $trojanlink2 | base64 -w 0)"
systemctl restart xray > /dev/null 2>&1
if [ ! -e /etc/trojan ]; then
  mkdir -p /etc/trojan
fi

if [ -z ${Quota} ]; then
  Quota="0"
fi
if [ -z ${iplim} ]; then
  iplim="0"
fi
c=$(echo "${Quota}" | sed 's/[^0-9]*//g')
d=$((${c} * 1024 * 1024 * 1024))

if [[ ${c} != "0" ]]; then
  echo "${d}" >/etc/trojan/${user}
  echo "${iplim}" >/etc/trojan/${user}IP
fi
DATADB=$(cat /etc/trojan/.trojan.db | grep "^###" | grep -w "${user}" | awk '{print $2}')
if [[ "${DATADB}" != '' ]]; then
  sed -i "/\b${user}\b/d" /etc/trojan/.trojan.db
fi
echo "### ${user} ${exp} ${uuid} ${iplim}" >>/etc/trojan/.trojan.db

TEXT="
<code>──────────────────────</code>
<code>    Xray TROJAN Account</code>
<code>──────────────────────</code>
<code>Remarks      : </code> <code>${user}</code>
<code>Domain        : </code> <code>${domain}</code>
<code>Port TLS      : </code> <code>443</code>
<code>Port None TLS : </code> <code>443</code>
<code>Port GRPC     : </code> <code>443</code>
<code>User ID       : </code> <code>${uuid}</code>
<code>AlterId       : 0</code>
<code>Security      : auto</code>
<code>Network       : WS or gRPC</code>
<code>Path WS       : </code> <code>/trojan-ws</code>
<code>ServiceName   : </code> <code>trojan-grpc</code>
<code>──────────────────────</code>
<code>Link TLS    :</code> 
<code>${trojan2}</code>
<code>──────────────────────</code>
<code>Link GRPC    :</code> 
<code>${trojan1}</code>
<code>──────────────────────</code>
<code>Expired On : $exp</code>
<code>──────────────────────</code>
"

curl -s --max-time $TIMES -d "chat_id=$CHATID&disable_web_page_preview=1&text=$TEXT&parse_mode=html" $URL >/dev/null

clear
clear
clear
clear
echo -e "$COLOR1──────────────────${NC}" | tee -a /etc/xray/log-create-${user}.log
echo -e "$COLOR1 ${NC}${COLBG1}${WH}• XRAY TROJAN •  ${NC} $COLOR1 $NC" | tee -a /etc/xray/log-create-${user}.log
echo -e "$COLOR1───────────────────${NC}" | tee -a /etc/xray/log-create-${user}.log
echo -e "$COLOR1 ${NC} ${WH}Remarks        ${COLOR1}: ${WH}${user}" | tee -a /etc/xray/log-create-${user}.log
echo -e "$COLOR1 ${NC} ${WH}Host           ${COLOR1}: ${WH}${domain}" | tee -a /etc/xray/log-create-${user}.log
echo -e "$COLOR1 ${NC} ${WH}Port TLS       ${COLOR1}: ${WH}443" | tee -a /etc/xray/log-create-${user}.log
echo -e "$COLOR1 ${NC} ${WH}Port none TLS  ${COLOR1}: ${WH}80" | tee -a /etc/xray/log-create-${user}.log
echo -e "$COLOR1 ${NC} ${WH}Port gRPC      ${COLOR1}: ${WH}443" | tee -a /etc/xray/log-create-${user}.log
echo -e "$COLOR1 ${NC} ${WH}Key            ${COLOR1}: ${WH}${uuid}" | tee -a /etc/xray/log-create-${user}.log
echo -e "$COLOR1 ${NC} ${WH}Path WS        ${COLOR1}: ${WH}/trojan-ws" | tee -a /etc/xray/log-create-${user}.log
echo -e "$COLOR1 ${NC} ${WH}ServiceName    ${COLOR1}: ${WH}trojan-grpc" | tee -a /etc/xray/log-create-${user}.log
echo -e "$COLOR1───────────────────${NC}" | tee -a /etc/xray/log-create-${user}.log
echo -e "$COLOR1 ${NC} ${WH}Link TLS ${COLOR1}: ${WH}${trojanlink}" | tee -a /etc/xray/log-create-${user}.log
echo -e "$COLOR1───────────────────${NC}" | tee -a /etc/xray/log-create-${user}.log
echo -e "$COLOR1 ${NC} ${WH}Link None TLS ${COLOR1}: ${WH}${trojanlink2}" | tee -a /etc/xray/log-create-${user}.log
echo -e "$COLOR1───────────────────${NC}" | tee -a /etc/xray/log-create-${user}.log
echo -e "$COLOR1 ${NC} ${WH}Link gRPC ${COLOR1}: ${WH}${trojanlink1}" | tee -a /etc/xray/log-create-${user}.log
echo -e "$COLOR1───────────────────${NC}" | tee -a /etc/xray/log-create-${user}.log
echo -e "$COLOR1 ${NC} ${WH}Expired On ${COLOR1}: ${WH}$exp"            | tee -a /etc/xray/log-create-${user}.log
echo -e "$COLOR1───────────────────${NC}" | tee -a /etc/xray/log-create-${user}.log
echo -e "$COLOR1┌────────────────────┐${NC}" | tee -a /etc/xray/log-create-${user}.log
echo -e "$COLOR1 ${NC}${WH}• $author •  ${NC}                 $COLOR1 $NC"
echo -e "$COLOR1└────────────────────┘${NC}" | tee -a /etc/xray/log-create-${user}.log
echo "" | tee -a /etc/xray/log-create-${user}.log
read -n 1 -s -r -p "Press any key to back on menu"
menu-trojan
}
function trial-trojan(){
clear
author=$(cat /etc/profil)
domain=$(cat /etc/xray/domain)
TIMES="10"
CHATID=$(cat /etc/per/id)
KEY=$(cat /etc/per/token)
URL="https://api.telegram.org/bot$KEY/sendMessage"
tls="$(cat ~/log-install.txt | grep -w "Trojan WS TLS" | cut -d: -f2|sed 's/ //g')"
ntls="$(cat ~/log-install.txt | grep -w "Trojan WS none TLS" | cut -d: -f2|sed 's/ //g')"
user=trial`</dev/urandom tr -dc X-Z-0-9 | head -c4`
uuid=$(cat /proc/sys/kernel/random/uuid)
masaaktif=10
exp=`date -d "$masaaktif days" +"%Y-%m-%d"`
sed -i '/#trojanws$/a\#tr '"$user $exp $uuid"'\
},{"password": "'""$uuid""'","email": "'""$user""'"' /etc/xray/config.json
sed -i '/#trojangrpc$/a\#trg '"$user $exp"'\
},{"password": "'""$uuid""'","email": "'""$user""'"' /etc/xray/config.json

trojanlink1="trojan://${uuid}@${domain}:443?mode=gun&security=tls&type=grpc&serviceName=trojan-grpc&sni=${domain}#${user}"
trojanlink="trojan://${uuid}@${domain}:443?path=%2Ftrojan-ws&security=tls&host=${domain}&type=ws&sni=${domain}#${user}"
trojanlink2="trojan://${uuid}@${domain}:80?path=%2Ftrojan-ws&security=auto&host=${domain}&type=ws#${user}"

trojan1="$(echo $trojanlink1 | base64 -w 0)"
trojan2="$(echo $trojanlink | base64 -w 0)"
trojan3="$(echo $trojanlink2 | base64 -w 0)"

TEXT="
<code>──────────────────────</code>
<code>    TROJAN Account</code>
<code>──────────────────────</code>
<code>Remarks       : </code> <code>${user}</code>
<code>Domain        : </code> <code>${domain}</code>
<code>Port TLS      : </code> <code>443</code>
<code>Port None TLS : </code> <code>80</code>
<code>Port GRPC     : </code> <code>443</code>
<code>User ID       : </code> <code>${uuid}</code>
<code>AlterId       : 0</code>
<code>Security      : auto</code>
<code>Network       : WS or gRPC</code>
<code>Path WS       : </code> <code>/trojan-ws</code>
<code>ServiceName   : </code> <code>trojan-grpc</code>
<code>──────────────────────</code>
<code>Link TLS    :</code> 
<code>${trojan2}</code>
<code>──────────────────────</code>
<code>Link GRPC    :</code> 
<code>${trojan1}</code>
<code>──────────────────────</code>
<code>Expired On : $exp</code>
<code>──────────────────────</code>
"

curl -s --max-time $TIMES -d "chat_id=$CHATID&disable_web_page_preview=1&text=$TEXT&parse_mode=html" $URL >/dev/null

clear
clear
clear
clear
clear
systemctl restart xray > /dev/null 2>&1
echo -e "$COLOR1──────────────────${NC}" | tee -a /etc/xray/log-create-${user}.log
echo -e "$COLOR1 ${NC}${COLBG1}${WH}• XRAY TROJAN •  ${NC} $COLOR1 $NC" | tee -a /etc/xray/log-create-${user}.log
echo -e "$COLOR1───────────────────${NC}" | tee -a /etc/xray/log-create-${user}.log
echo -e "$COLOR1 ${NC} ${WH}Remarks        ${COLOR1}: ${WH}${user}" | tee -a /etc/xray/log-create-${user}.log
echo -e "$COLOR1 ${NC} ${WH}Host           ${COLOR1}: ${WH}${domain}" | tee -a /etc/xray/log-create-${user}.log
echo -e "$COLOR1 ${NC} ${WH}Port TLS       ${COLOR1}: ${WH}443" | tee -a /etc/xray/log-create-${user}.log
echo -e "$COLOR1 ${NC} ${WH}Port none TLS  ${COLOR1}: ${WH}80" | tee -a /etc/xray/log-create-${user}.log
echo -e "$COLOR1 ${NC} ${WH}Port gRPC      ${COLOR1}: ${WH}443" | tee -a /etc/xray/log-create-${user}.log
echo -e "$COLOR1 ${NC} ${WH}Key            ${COLOR1}: ${WH}${uuid}" | tee -a /etc/xray/log-create-${user}.log
echo -e "$COLOR1 ${NC} ${WH}Path WS        ${COLOR1}: ${WH}/trojan-ws" | tee -a /etc/xray/log-create-${user}.log
echo -e "$COLOR1 ${NC} ${WH}ServiceName    ${COLOR1}: ${WH}trojan-grpc" | tee -a /etc/xray/log-create-${user}.log
echo -e "$COLOR1───────────────────${NC}" | tee -a /etc/xray/log-create-${user}.log
echo -e "$COLOR1 ${NC} ${WH}Link TLS ${COLOR1}: ${WH}${trojanlink}" | tee -a /etc/xray/log-create-${user}.log
echo -e "$COLOR1───────────────────${NC}" | tee -a /etc/xray/log-create-${user}.log
echo -e "$COLOR1 ${NC} ${WH}Link None TLS ${COLOR1}: ${WH}${trojanlink2}" | tee -a /etc/xray/log-create-${user}.log
echo -e "$COLOR1───────────────────${NC}" | tee -a /etc/xray/log-create-${user}.log
echo -e "$COLOR1 ${NC} ${WH}Link gRPC ${COLOR1}: ${WH}${trojanlink1}" | tee -a /etc/xray/log-create-${user}.log
echo -e "$COLOR1───────────────────${NC}" | tee -a /etc/xray/log-create-${user}.log
echo -e "$COLOR1 ${NC} ${WH}Expired On ${COLOR1}: ${WH}$exp"            | tee -a /etc/xray/log-create-${user}.log
echo -e "$COLOR1───────────────────${NC}" | tee -a /etc/xray/log-create-${user}.log
echo -e "$COLOR1┌────────────────────┐${NC}" | tee -a /etc/xray/log-create-${user}.log
echo -e "$COLOR1 ${NC}${WH}• $author •  ${NC}                 $COLOR1 $NC"
echo -e "$COLOR1└────────────────────┘${NC}" | tee -a /etc/xray/log-create-${user}.log
echo "" | tee -a /etc/xray/log-create-${user}.log
read -n 1 -s -r -p "Press any key to back on menu"
menu-trojan
}
function renew-tr(){
clear
TIMES="10"
CHATID=$(cat /etc/per/id)
KEY=$(cat /etc/per/token)
URL="https://api.telegram.org/bot$KEY/sendMessage"
domain=$(cat /etc/xray/domain)
NUMBER_OF_CLIENTS=$(grep -c -E "^#tr " "/etc/xray/config.json")
	if [[ ${NUMBER_OF_CLIENTS} == '0' ]]; then
		clear
        echo -e "$COLOR1━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
        echo -e "$COLOR1 ${NC} ${COLBG1}  ⇱ Renew Trojan ⇲   ${NC} $COLOR1 $NC"
        echo -e "$COLOR1━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
		echo ""
		echo "You have no existing clients!"
		echo ""
		echo -e "$COLOR1━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
        echo ""
        read -n 1 -s -r -p "Press any key to back on menu"
        menu-trojan
	fi
 	echo -e "$COLOR1━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
        echo -e "$COLOR1 ${NC} ${COLBG1}   ⇱ Renew Trojan ⇲   ${NC} $COLOR1 $NC"
        echo -e "$COLOR1━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
	echo "Select the existing client you want to renew"
	echo " Press CTRL+C to return"
	echo -e "$COLOR1━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
	grep -E "^#tr " "/etc/xray/config.json" | cut -d ' ' -f 2-3 | nl -s ') '
	until [[ ${CLIENT_NUMBER} -ge 1 && ${CLIENT_NUMBER} -le ${NUMBER_OF_CLIENTS} ]]; do
		if [[ ${CLIENT_NUMBER} == '1' ]]; then
			read -rp "Select one client [1]: " CLIENT_NUMBER
		else
			read -rp "Select one client [1-${NUMBER_OF_CLIENTS}]: " CLIENT_NUMBER
		fi
	done
read -p "Expired (days): " masaaktif
user=$(grep -E "^#tr " "/etc/xray/config.json" | cut -d ' ' -f 2 | sed -n "${CLIENT_NUMBER}"p)
exp=$(grep -E "^#tr " "/etc/xray/config.json" | cut -d ' ' -f 3 | sed -n "${CLIENT_NUMBER}"p)
now=$(date +%Y-%m-%d)
d1=$(date -d "$exp" +%s)
d2=$(date -d "$now" +%s)
exp2=$(( (d1 - d2) / 86400 ))
exp3=$(($exp2 + $masaaktif))
exp4=`date -d "$exp3 days" +"%Y-%m-%d"`
sed -i "s/#tr $user $exp/#tr $user $exp4/g" /etc/xray/config.json
sed -i "s/#trg $user $exp/#trg $user $exp4/g" /etc/xray/config.json
sed -i "s/### $user $exp/### $user $exp4/g" /etc/trojan/.trojan.db
clear
TEXT="
<code>◇━━━━━━━━━━━━━━◇</code>
<b>   XRAY TROJAN RENEW</b>
<code>◇━━━━━━━━━━━━━━◇</code>
<b>DOMAIN   :</b> <code>${domain} </code>
<b>USERNAME :</b> <code>$user </code>
<b>EXPIRED  :</b> <code>$exp4 </code>
<code>◇━━━━━━━━━━━━━━◇</code>
"

curl -s --max-time $TIMES -d "chat_id=$CHATID&disable_web_page_preview=1&text=$TEXT&parse_mode=html" $URL >/dev/null


systemctl restart xray > /dev/null 2>&1
    echo -e "$COLOR1━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
    echo " Trojan Account Was Successfully Renewed"
    echo -e "$COLOR1━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
    echo ""
    echo " Client Name : $user"
    echo " Expired On  : $exp4"
    echo ""
    echo -e "$COLOR1━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
    echo ""
    read -n 1 -s -r -p "Press any key to back on menu"
    menu-trojan
}
function del-tr(){
clear
NUMBER_OF_CLIENTS=$(grep -c -E "^#tr " "/etc/xray/config.json")
	if [[ ${NUMBER_OF_CLIENTS} == '0' ]]; then
		echo -e "$COLOR1━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
                echo -e "$COLOR1 ${NC} ${COLBG1}   ⇱ Delete Trojan Account ⇲     ${NC} $COLOR1 $NC"
      		echo -e "$COLOR1━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
		echo ""
		echo "You have no existing clients!"
		echo ""
		echo -e "$COLOR1━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
		read -n 1 -s -r -p "Press any key to back on menu"
        menu-trojan
	fi

	clear
        echo -e "$COLOR1━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
        echo -e "$COLOR1 ${NC} ${COLBG1}   ⇱ Delete Trojan Account ⇲     ${NC} $COLOR1 $NC"
      	echo -e "$COLOR1━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
	echo " Select the existing client you want to remove"
	echo " Press CTRL+C to return"
	echo -e "$COLOR1━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
	echo "     No  Expired   User"
	grep -E "^#tr " "/etc/xray/config.json" | cut -d ' ' -f 2-3 | nl -s ') '
	until [[ ${CLIENT_NUMBER} -ge 1 && ${CLIENT_NUMBER} -le ${NUMBER_OF_CLIENTS} ]]; do
		if [[ ${CLIENT_NUMBER} == '1' ]]; then
			read -rp "Select one client [1]: " CLIENT_NUMBER
		else
			read -rp "Select one client [1-${NUMBER_OF_CLIENTS}]: " CLIENT_NUMBER
		fi
	done
user=$(grep -E "^#tr " "/etc/xray/config.json" | cut -d ' ' -f 2 | sed -n "${CLIENT_NUMBER}"p)
exp=$(grep -E "^#tr " "/etc/xray/config.json" | cut -d ' ' -f 3 | sed -n "${CLIENT_NUMBER}"p)
sed -i "/^#tr $user $exp/,/^},{/d" /etc/xray/config.json
sed -i "/^#trg $user $exp/,/^},{/d" /etc/xray/config.json
sed -i "/^### $user $exp/,/^},{/d" /etc/trojan/.trojan.db
clear
systemctl restart xray > /dev/null 2>&1
    echo -e "$COLOR1━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
    echo " TrojanAccount Deleted Successfully"
    echo -e "$COLOR1━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
    echo " Client Name : $user"
    echo " Expired On  : $exp"
    echo -e "$COLOR1━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
    echo ""
    read -n 1 -s -r -p "Press any key to back on menu"
    menu-trojan
}

function cek-tr(){
clear
TIMES="10"
CHATID=$(cat /etc/per/id)
KEY=$(cat /etc/per/token)
URL="https://api.telegram.org/bot$KEY/sendMessage"
domain=$(cat /etc/xray/domain)
#systemctl restart xray
#sleep 1
author=$(cat /etc/profil)
echo -n > /tmp/other.txt
data=( `cat /etc/xray/config.json | grep '^#tr' | cut -d ' ' -f 2 | sort | uniq`);
echo -e "$COLOR1┌─────────────────────────────────────────────────┐${NC}"
echo -e "$COLOR1 ${NC} ${COLBG1}   ${WH}• TROJAN ONLINE NOW •   ${NC} $COLOR1 $NC"
echo -e "$COLOR1└─────────────────────────────────────────────────┘${NC}"
echo -e "$COLOR1┌─────────────────────────────────────────────────┐${NC}"

for akun in "${data[@]}"
do
if [[ -z "$akun" ]]; then
akun="tidakada"
fi

echo -n > /tmp/iptrojan.txt
data2=( `cat /var/log/xray/access.log | tail -n 500 | cut -d " " -f 3 | sed 's/tcp://g' | cut -d ":" -f 1 | sort | uniq`);
for ip in "${data2[@]}"
do

jum=$(cat /var/log/xray/access.log | grep -w "$akun" | tail -n 500 | cut -d " " -f 3 | sed 's/tcp://g' | cut -d ":" -f 1 | grep -w "$ip" | sort | uniq)
if [[ "$jum" = "$ip" ]]; then
echo "$jum" >> /tmp/iptrojan.txt
else
echo "$ip" >> /tmp/other.txt
fi
jum2=$(cat /tmp/iptrojan.txt)
sed -i "/$jum2/d" /tmp/other.txt > /dev/null 2>&1
done

jum=$(cat /tmp/iptrojan.txt)
if [[ -z "$jum" ]]; then
echo > /dev/null
else
jum2=$(cat /tmp/iptrojan.txt | wc -l)
echo -e "$COLOR1${NC} USERNAME : \033[0;33m$akun";
echo -e "$COLOR1${NC} IP LOGIN : \033[0;33m$jum2";
echo -e ""

TEXT="
<code>◇━━━━━━━━━━━━━━◇</code>
<b>  ⚠️ XRAY TROJAN NOTIF ⚠️</b>
<b>      User Login</b>
<code>◇━━━━━━━━━━━━━━◇</code>
<b>DOMAIN :</b> <code>${domain} </code>
<b>USERNAME :</b> <code>$akun </code>
<b>TOTAL IP :</b> <code>${jum2} </code>
<code>◇━━━━━━━━━━━━━━◇</code>
"
curl -s --max-time $TIMES -d "chat_id=$CHATID&disable_web_page_preview=1&text=$TEXT&parse_mode=html" $URL >/dev/null

fi
rm -rf /tmp/iptrojan.txt
done

rm -rf /tmp/other.txt
echo -e "$COLOR1└─────────────────────────────────────────────────┘${NC}"
echo -e "$COLOR1┌────────────────────── ${WH}BY${NC} ${COLOR1}───────────────────────┐${NC}"
echo -e "$COLOR1 ${NC}               ${WH}• $author •${NC}                 $COLOR1 $NC"
echo -e "$COLOR1└─────────────────────────────────────────────────┘${NC}"
echo ""
read -n 1 -s -r -p "   Press any key to back on menu"
menu-trojan
}
function list-trojan(){
clear
tls="$(cat ~/log-install.txt | grep -w "Trojan WS TLS" | cut -d: -f2|sed 's/ //g')"

ntls="$(cat ~/log-install.txt | grep -w "Trojan WS none TLS" | cut -d: -f2|sed 's/ //g')"


NUMBER_OF_CLIENTS=$(grep -c -E "^#tr " "/etc/xray/config.json")
        if [[ ${NUMBER_OF_CLIENTS} == '0' ]]; then
                echo -e "$COLOR1━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
                echo -e "$COLOR1 ${NC} ${COLBG1}   ⇱ Check Trojan Config ⇲   ${NC} $COLOR1 $NC"
                echo -e "$COLOR1━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
                echo ""
		echo "You have no existing clients!"
		echo ""
		echo -e "$COLOR1━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
                read -n 1 -s -r -p "Press any key to back on menu"
        menu-trojan
	fi

	echo -e "$COLOR1━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
        echo -e "$COLOR1 ${NC} ${COLBG1}   ⇱ Check Trojan Config ⇲    ${NC} $COLOR1 $NC"
        echo -e "$COLOR1━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
        echo " Select the existing client to view the config"
        echo " Press CTRL+C to return"
        echo -e "$COLOR1━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
        echo "     No  Expired   User"
        grep -E "^#tr " "/etc/xray/config.json" | cut -d ' ' -f 2-3 | nl -s ') '
        until [[ ${CLIENT_NUMBER} -ge 1 && ${CLIENT_NUMBER} -le ${NUMBER_OF_CLIENTS} ]]; do
                if [[ ${CLIENT_NUMBER} == '1' ]]; then
                        read -rp "Select one client [1]: " CLIENT_NUMBER
                else
                        read -rp "Select one client [1-${NUMBER_OF_CLIENTS}]: " CLIENT_NUMBER
                fi
        done
clear
author=$(cat /etc/profil)

user=$(grep -E "^#tr " "/etc/xray/config.json" | cut -d ' ' -f 2 | sed -n "${CLIENT_NUMBER}"p)
domain=$(cat /etc/xray/domain)
uuid=$(grep -E "^#tr " "/etc/xray/config.json" | cut -d ' ' -f 4 | sed -n "${CLIENT_NUMBER}"p)
exp=$(grep -E "^#tr " "/etc/xray/config.json" | cut -d ' ' -f 3 | sed -n "${CLIENT_NUMBER}"p)
hariini=`date -d "0 days" +"%Y-%m-%d"`

trojanlink1="trojan://${uuid}@${domain}:443?mode=gun&security=tls&type=grpc&serviceName=trojan-grpc&sni=${domain}#${user}"
trojanlink="trojan://${uuid}@${domain}:443?path=%2Ftrojan-ws&security=tls&host=${domain}&type=ws&sni=${domain}#${user}"
trojanlink2="trojan://${uuid}@${domain}:80?path=%2Ftrojan-ws&security=auto&host=${domain}&type=ws#${user}"

clear
clear
clear
clear
echo -e "$COLOR1──────────────────${NC}" | tee -a /etc/xray/log-create-${user}.log
echo -e "$COLOR1 ${NC}${COLBG1}${WH}• XRAY TROJAN •  ${NC} $COLOR1 $NC" | tee -a /etc/xray/log-create-${user}.log
echo -e "$COLOR1───────────────────${NC}" | tee -a /etc/xray/log-create-${user}.log
echo -e "$COLOR1 ${NC} ${WH}Remarks        ${COLOR1}: ${WH}${user}" | tee -a /etc/xray/log-create-${user}.log
echo -e "$COLOR1 ${NC} ${WH}Host           ${COLOR1}: ${WH}${domain}" | tee -a /etc/xray/log-create-${user}.log
echo -e "$COLOR1 ${NC} ${WH}Port TLS       ${COLOR1}: ${WH}443" | tee -a /etc/xray/log-create-${user}.log
echo -e "$COLOR1 ${NC} ${WH}Port none TLS  ${COLOR1}: ${WH}80" | tee -a /etc/xray/log-create-${user}.log
echo -e "$COLOR1 ${NC} ${WH}Port gRPC      ${COLOR1}: ${WH}443" | tee -a /etc/xray/log-create-${user}.log
echo -e "$COLOR1 ${NC} ${WH}Key            ${COLOR1}: ${WH}${uuid}" | tee -a /etc/xray/log-create-${user}.log
echo -e "$COLOR1 ${NC} ${WH}Path WS        ${COLOR1}: ${WH}/trojan-ws" | tee -a /etc/xray/log-create-${user}.log
echo -e "$COLOR1 ${NC} ${WH}ServiceName    ${COLOR1}: ${WH}trojan-grpc" | tee -a /etc/xray/log-create-${user}.log
echo -e "$COLOR1───────────────────${NC}" | tee -a /etc/xray/log-create-${user}.log
echo -e "$COLOR1 ${NC} ${WH}Link TLS ${COLOR1}: ${WH}${trojanlink}" | tee -a /etc/xray/log-create-${user}.log
echo -e "$COLOR1───────────────────${NC}" | tee -a /etc/xray/log-create-${user}.log
echo -e "$COLOR1 ${NC} ${WH}Link None TLS ${COLOR1}: ${WH}${trojanlink2}" | tee -a /etc/xray/log-create-${user}.log
echo -e "$COLOR1───────────────────${NC}" | tee -a /etc/xray/log-create-${user}.log
echo -e "$COLOR1 ${NC} ${WH}Link gRPC ${COLOR1}: ${WH}${trojanlink1}" | tee -a /etc/xray/log-create-${user}.log
echo -e "$COLOR1───────────────────${NC}" | tee -a /etc/xray/log-create-${user}.log
echo -e "$COLOR1 ${NC} ${WH}Expired On ${COLOR1}: ${WH}$exp"            | tee -a /etc/xray/log-create-${user}.log
echo -e "$COLOR1───────────────────${NC}" | tee -a /etc/xray/log-create-${user}.log
echo -e "$COLOR1┌────────────────────┐${NC}" | tee -a /etc/xray/log-create-${user}.log
echo -e "$COLOR1 ${NC}${WH}• $author •  ${NC}                 $COLOR1 $NC"
echo -e "$COLOR1└────────────────────┘${NC}" | tee -a /etc/xray/log-create-${user}.log
echo "" | tee -a /etc/xray/log-create-${user}.log
read -n 1 -s -r -p "Press any key to back on menu"
menu-trojan
}
clear
author=$(cat /etc/profil)
echo -e "$COLOR1┌─────────────────────────────────────────────────┐${NC}"
echo -e "$COLOR1 ${NC} ${COLBG1}              ${WH}• MENU PANEL TROJAN •                $COLOR1 $NC"
echo -e "$COLOR1└─────────────────────────────────────────────────┘${NC}"
echo -e " $COLOR1┌───────────────────────────────────────────────┐${NC}"
echo -e " $COLOR1 $NC   ${WH}[${COLOR1}01${WH}]${NC} ${COLOR1}• ${WH}ADD TROJAN${NC}     ${WH}[${COLOR1}05${WH}]${NC} ${COLOR1}• ${WH}CEK CONFIG${NC}   $COLOR1 $NC"
echo -e " $COLOR1 $NC                                              ${NC} $COLOR1 $NC"
echo -e " $COLOR1 $NC   ${WH}[${COLOR1}02${WH}]${NC} ${COLOR1}• ${WH}RENEW TROJAN${NC}   ${WH}[${COLOR1}06${WH}]${NC} ${COLOR1}• ${WH}TRIAL TROJAN${NC}     $COLOR1 $NC"
echo -e " $COLOR1 $NC                                              ${NC} $COLOR1 $NC"
echo -e " $COLOR1 $NC   ${WH}[${COLOR1}03${WH}]${NC} ${COLOR1}• ${WH}DELETE TROJAN${NC}  ${WH}[${COLOR1}07${WH}]${NC} ${COLOR1}• ${WH}UUID TROJAN${NC}     $COLOR1 $NC"
echo -e " $COLOR1 $NC                                              ${NC} $COLOR1 $NC"
echo -e " $COLOR1 $NC   ${WH}[${COLOR1}04${WH}]${NC} ${COLOR1}• ${WH}USER ONLINE${NC}                              $COLOR1 $NC"
echo -e " $COLOR1 $NC                                              ${NC} $COLOR1 $NC"
echo -e " $COLOR1 $NC   ${WH}[${COLOR1}00${WH}]${NC} ${COLOR1}• ${WH}GO BACK${NC}                                  $COLOR1 $NC"
echo -e " $COLOR1└───────────────────────────────────────────────┘${NC}"
echo -e "$COLOR1┌────────────────────── ${WH}BY${NC} ${COLOR1}───────────────────────┐${NC}"
echo -e "$COLOR1 ${NC} ${COLBG1}              ${WH}• $author •                 $COLOR1 $NC"
echo -e "$COLOR1└─────────────────────────────────────────────────┘${NC}"
echo -e ""
echo -ne " ${WH}Select menu ${COLOR1}: ${WH}"; read opt
case $opt in
01 | 1) clear ; add-tr ;;
02 | 2) clear ; renew-trojan ;;
03 | 3) clear ; del-tr ;;
04 | 4) clear ; cek-tr ;;
05 | 5) clear ; list-trojan ;;
06 | 6) clear ; trial-trojan ;;
07 | 7) clear ; add-tru ;;
00 | 0) clear ; menu ;;
x) exit ;;
*) echo "SALAH TEKAN SAYANG" ; sleep 1 ; menu-trojan ;;
esac
