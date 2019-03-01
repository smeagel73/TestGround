# Benutzer auf Risiken hinweisen
clear
echo -e "\033[1;34m"
echo -e "                             TestGround -- Mosquitto                               \n"
echo -e "\033[32m"
echo -e " ______________________________________________________________________________ "
echo -e "|                                                                              |"
echo -e "|                               !!! ACHTUNG !!!                                |"
echo -e "|                                                                              |"
echo -e "| Die Installation dieser Software nimmt eine Veraenderung der Router-Firmware |"
echo -e "| vor.                                                                         |"
echo -e "|                                                                              |"
echo -e "| Wenn Sie fortfahren, installieren Sie ein vom Hersteller bereitgestelltes    |"
echo -e "| Beta-Feature auf dem Geraet.                                                 |"
echo -e "|                                                                              |"
echo -e "| (C)2019 by TDT AG                                                            |"
echo -e "|                                                                              |"
echo -e " ¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯ \033[0m"
echo ""
echo -en "\nMoechten Sie fortfahren \"Yes\" or \"No\" (Ja oder Nein)? "
read x

case $x in
[YyJj]* ) echo "Installation wird fortgefuehrt" ;;
[Nn]* ) echo "Installation wird abgebrochen";rm WireGuard_x86.sh;exit ;;
esac


# Holt und installiert alle notwendigen Mosquitto Pakete
echo -e "\033[31m Download der benoetigten Pakete\033[0m"

wget https://raw.githubusercontent.com/smeagel73/TestGround/master/TestGround_Mosquitto_mips.tar.gz -O /root/TestGround_Mosquitto_mips.tar.gz &>/dev/null
tar -xvzf /root/TestGround_Mosquitto_mips.tar.gz
echo -e "\033[31m Download abgeschlossen\033[0m"
echo -e "\033[31m Installation der benoetigten Pakete\033[0m"
opkg install /root/*.ipk
#cp model_cbi_mosquitto.lua /usr/lib/lua/luci/model/cbi/mosquitto.lua
#cp controller_mosquitto.lua /usr/lib/lua/luci/controller/mosquitto.lua




echo -e "\033[31m Installation abgeschlossen\033[0m"
rm /root/TestGround_Mosquitto_mips.tar.gz

#Entfernt die installierten Pakete
echo -e "\033[31m Entfernen der nicht mehr benoetigten Dateien\033[0m"
rm /root/*.ipk
rm /root/*.lua


#echo -e "\033[31m Einrichten der Firewall Regeln\033[0m"
#uci show|grep firewall|grep "dest_port='1883'" && mosquitto_rule1=1 || mosquitto_rule1=0
#if [ "$mosquitto_rule1" = 0 ]
#then
#        echo "Die Firewall-Regel 1883 existiert noch nicht und wird angelegt"
#        uci add firewall rule
#        uci set firewall.@rule[-1].name='MQTT'
#        uci set firewall.@rule[-1].target='ACCEPT'
#        uci set firewall.@rule[-1].src='wan'
#        uci set firewall.@rule[-1].proto='tcp'
#        uci set firewall.@rule[-1].dest_port='1883'
#else
#        echo "Die Firewall-Regel existiert bereits"
#fi
#
#
#uci commit # uebernimmt die aenderungen
#reload_config # laedt die Config neu
#echo -e "\033[31m Firewall konfigurieren abgeschlossen\033[0m"


echo -e "\033[32m"
echo -e " ______________________________________________________________________________ "
echo -e "|                                                                              |"
echo -e "|     Die Installation von Mosquitto auf diesem System ist abgeschlossen.      |"
echo -e "|     Um MQTT von extern erreichbar zu machen - Firewall Regel erstellen.      |"      
echo -e "|                                                                              |"
echo -e " ¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯ \033[0m"
rm /root/TestGround_Mosquitto.sh
