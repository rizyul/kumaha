#!/bin/bash
#Script By Julak Bantur
#Telegram : https://t.me/Cibut2d
################################
dateFromServer=$(curl -v --insecure --silent https://google.com/ 2>&1 | grep Date | sed -e 's/< Date: //')
biji=`date +"%Y-%m-%d" -d "$dateFromServer"`
##############################
julak="raw.githubusercontent.com/ppnhss/sc3"

BURIQ () {
    curl -sS https://raw.githubusercontent.com/ppnhss/hss/main/sc3 > /root/tmp
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
Name=$(curl -sS https://raw.githubusercontent.com/ppnhss/hss/main/sc3 | grep $MYIP | awk '{print $2}')
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
    IZIN=$(curl -sS https://raw.githubusercontent.com/ppnhss/hss/main/sc3 | awk '{print $4}' | grep $MYIP)
    if [ "$MYIP" = "$IZIN" ]; then
    Bloman
    else
    res="Permission Denied!"
    fi
    BURIQ
}
red='\e[1;31m'
green='\e[1;32m'
yellow='\033[0;33m'
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
red "Permission Denied!"
exit 0
fi

clear
echo ""
version=$(cat /home/ver)
ver=$( curl sS https://raw.githubusercontent.com/ppnhss/sc3/main/versi )
clear
# CEK UPDATE
Green_font_prefix="\033[32m" && Red_font_prefix="\033[31m" && Green_background_prefix="\033[42;37m" && Red_background_prefix="\033[41;37m" && Font_color_suffix="\033[0m"
Info1="${Green_font_prefix}($version)${Font_color_suffix}"
Info2="${Green_font_prefix}(LATEST VERSION)${Font_color_suffix}"
Error="Version ${Green_font_prefix}[$ver]${Font_color_suffix} available${Red_font_prefix}[Please Update]${Font_color_suffix}"
version=$(cat /home/ver)
new_version=$( curl sS https://raw.githubusercontent.com/ppnhss/sc3/main/versi | grep $version )
#Status Version
if [ $version = $new_version ]; then
sts="${Info2}"
else
sts="${Error}"
fi
clear
echo -e "\e[1;31mUpdate Available Now..\e[m"
echo -e ""
sleep 1
echo -e "\e[1;36mStart Update For New Version, Please Wait..\e[m"
sleep 2
clear
echo -e "\e[0;32mGetting New Version Script..\e[0m"
sleep 1
clear
echo -e "\033[1;93mNgopi Dulu Broow..!\e[0m"
sleep 5

rm -rf update
rm -rf menu-update
rm -rf menu
rm -rf m-bot
rm -rf m-ip
rm -rf menu-trial
rm -rf menu-vmess
rm -rf menu-vless
rm -rf menu-ssws
rm -rf running
rm -rf clearcache
rm -rf menu-trgo
rm -rf menu-trojan
rm -rf menu-ssh
rm -rf usernew
rm -rf trial
rm -rf renew
rm -rf hapus
rm -rf cek
rm -rf member
rm -rf delete
rm -rf autokill
rm -rf ceklim
rm -rf tendang
rm -rf menu-set
rm -rf menu-domain
rm -rf add-host
rm -rf port-change
rm -rf certv2ray
rm -rf menu-webmin
rm -rf speedtest
rm -rf about
rm -rf auto-reboot
rm -rf restart
rm -rf bw
rm -rf port-ssl
rm -rf port-ovpn
rm -rf xp
rm -rf acs-set
rm -rf sshws
rm -rf status
rm -rf menu-backup
rm -rf backup
rm -rf restore
rm -rf jam
rm -rf add-v2ray
rm -rf trialvmess
rm -rf renew-ws
rm -rf del-ws
rm -rf cek-ws
rm -rf add-ssws
rm -rf trialvless
rm -rf renew-vless
rm -rf del-vless
rm -rf cek-vless
rm -rf add-tr
rm -rf trialtrojan
rm -rf del-tr
rm -rf renew-tr
rm -rf cek-tr
rm -rf addtrgo
rm -rf trialtrojango
rm -rf deltrgo
rm -rf renewtrgo
rm -rf cektrgo
rm -rf m-sshovpn
rm -rf cf
rm -rf add-vmess
rm -rf menu-bckp
rm -rf add-ns
rm -rf issue
rm -rf add-wireguard
rm -rf add-tru
rm -rf add-vls
rm -rf add-vms
rm -rf menu-theme
rm -rf menu-l2tp
rm -rf sshlogin

cd /usr/bin
wget -O menu-update "https://raw.githubusercontent.com/HssPunya93/julakhss/main/JB4/menu-update.sh"
wget -O menu "https://${julak}/main/menu/menu3.sh"
wget -O m-bot "https://${julak}/main/menu/m-bot.sh"
wget -O m-ip "https://${julak}/main/menu/m-ip.sh"
wget -O menu-vmess "https://${julak}/main/menu/menu-vmess.sh"
wget -O menu-vless "https://${julak}/main/menu/menu-vless.sh"
wget -O running "https://${julak}/main/menu/running.sh"
wget -O clearcache "https://${julak}/main/menu/clearcache.sh"
wget -O menu-trojan "https://${julak}/main/menu/menu-trojan.sh"
wget -O menu-ssh "https://${julak}/main/menu/menu-ssh.sh"
wget -O menu-set "https://${julak}/main/menu/menu-set.sh"
wget -O menu-domain "https://${julak}/main/menu/menu-domain.sh"
wget -O add-host "https://${julak}/main/ssh/add-host.sh"
wget -O menu-port "https://${julak}/main/port/port-change.sh"
wget -O certv2ray "https://${julak}/main/xray/certv2ray.sh"
wget -O menu-webmin "https://${julak}/main/menu/menu-webmin.sh"
wget -O speedtest "https://${julak}/main/ssh/speedtest_cli.py"
wget -O about "https://${julak}/main/menu/about.sh"
wget -O auto-reboot "https://${julak}/main/menu/auto-reboot.sh"
wget -O restart "https://${julak}/main/menu/restart.sh"
wget -O bw "https://${julak}/main/menu/bw.sh"
wget -O port-ssl "https://${julak}/main/port/port-ssl.sh"
wget -O port-ovpn "https://${julak}/main/port/port-ovpn.sh"
wget -O xp "https://${julak}/main/ssh/xp.sh"
wget -O acs-set "https://${julak}/main/acs-set.sh"
wget -O sshws "https://${julak}/main/ssh/sshws.sh"
wget -O status "https://${julak}/main/status.sh"
wget -O menu-backup "https://${julak}/main/menu/menu-backup.sh"
wget -O jam "https://${julak}/main/jam.sh"
wget -O cf "https://${julak}/main/ssh/cf.sh"
wget -O menu-bckp "https://${julak}/main/menu/menu-bckp.sh"
wget -O add-ns "https://${julak}/main/ssh/add-ns.sh"
wget -O issue "https://${julak}/main/ssh/issue.net"
wget -O add-tru "https://${julak}/main/xray/add-tru.sh"
wget -O add-vls "https://${julak}/main/xray/add-vls.sh"
wget -O add-vms "https://${julak}/main/xray/add-vms.sh"
wget -O menu-theme "https://${julak}/main/menu/menu-theme.sh"
wget -O menu-l2tp "https://${julak}/main/ipsec/menu-l2tp.sh"
wget -O sshlogin "https://${julak}/main/ssh/cek.sh"

chmod +x menu-update
chmod +x m-ip
chmod +x menu
chmod +x m-bot
chmod +x menu-vmess
chmod +x menu-vless
chmod +x running
chmod +x clearcache
chmod +x menu-trojan
chmod +x menu-ssh
chmod +x menu-set
chmod +x menu-domain
chmod +x add-host
chmod +x menu-port
chmod +x certv2ray
chmod +x menu-webmin
chmod +x speedtest
chmod +x about
chmod +x auto-reboot
chmod +x restart
chmod +x bw
chmod +x port-ssl
chmod +x port-ovpn
chmod +x xp
chmod +x acs-set
chmod +x sshws
chmod +x status
chmod +x menu-backup
chmod +x jam
chmod +x cf
chmod +x menu-bckp
chmod +x add-ns
chmod +x issue
chmod +x add-tru
chmod +x add-vls
chmod +x add-vms
chmod +x menu-theme
chmod +x menu-l2tp
chmod +x sshlogin

clear
echo -e ""
echo -e "\e[0;32mDownloaded successfully!\e[0m"
echo ""
ver=$( curl sS https://raw.githubusercontent.com/ppnhss/sc3/main/versi )
sleep 1
echo -e "\e[0;32mPatching New Update, Please Wait...\e[0m"
echo ""
sleep 2
echo -e "\e[0;32mPatching... OK!\e[0m"
sleep 1
echo ""
echo -e "\e[0;32mSucces Update Script For New Version\e[0m"
cd
echo "$ver" > /home/ver
rm -f update.sh
clear
echo ""
echo -e "\033[0;34m----------------------------------------\033[0m"
echo -e "\E[44;1;39m            SCRIPT UPDATED              \E[0m"
echo -e "\033[0;34m----------------------------------------\033[0m"
echo ""
read -n 1 -s -r -p "Press any key to back on menu"
menu
;;
x)
clear
update
;;
y)
clear
menu
;;
*)
clear
echo -e "\e[1;31mPlease Enter Option 1-2 or x & y Only..,Try again, Thank You..\e[0m"
sleep 2
menu-update
;;
esac
