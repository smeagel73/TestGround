# Benutzer auf Risiken hinweisen
clear
echo -e "\033[32m ################################################################################################################\033[0m"
echo -e "\033[32m #                                                                                                              #\033[0m"
echo -e "\033[32m # ######## ########  ######  ########     ######   ########   #######  ##     ## ##    ## ########            #\033[0m"
echo -e "\033[32m #    ##    ##       ##    ##    ##       ##    ##  ##     ## ##     ## ##     ## ###   ## ##     ##           #\033[0m"
echo -e "\033[32m #    ##    ##       ##          ##       ##        ##     ## ##     ## ##     ## ####  ## ##     ##           #\033[0m"
echo -e "\033[32m #    ##    ######    ######     ##       ##   #### ########  ##     ## ##     ## ## ## ## ##     ##           #\033[0m"
echo -e "\033[32m #    ##    ##             ##    ##       ##    ##  ##   ##   ##     ## ##     ## ##  #### ##     ##           #\033[0m"
echo -e "\033[32m #    ##    ##       ##    ##    ##       ##    ##  ##    ##  ##     ## ##     ## ##   ### ##     ##           #\033[0m"
echo -e "\033[32m #    ##    ########  ######     ##        ######   ##     ##  #######   #######  ##    ## ########            #\033[0m"
echo -e "\033[32m #                                                                                                              #\033[0m"
echo -e "\033[32m #      ##      ## #### ########  ########  ######   ##     ##    ###    ########  ########                    #\033[0m"
echo -e "\033[32m #      ##  ##  ##  ##  ##     ## ##       ##    ##  ##     ##   ## ##   ##     ## ##     ##                   #\033[0m"
echo -e "\033[32m #      ##  ##  ##  ##  ##     ## ##       ##        ##     ##  ##   ##  ##     ## ##     ##                   #\033[0m"
echo -e "\033[32m #      ##  ##  ##  ##  ########  ######   ##   #### ##     ## ##     ## ########  ##     ##                   #\033[0m"
echo -e "\033[32m #      ##  ##  ##  ##  ##   ##   ##       ##    ##  ##     ## ######### ##   ##   ##     ##                   #\033[0m"
echo -e "\033[32m #      ##  ##  ##  ##  ##    ##  ##       ##    ##  ##     ## ##     ## ##    ##  ##     ##                   #\033[0m"
echo -e "\033[32m #       ###  ###  #### ##     ## ########  ######    #######  ##     ## ##     ## ########                    #\033[0m"
echo -e "\033[32m #                                                                                                              #\033[0m"
echo -e "\033[32m #                                                                                                              #\033[0m"
echo -e "\033[32m #                                                  !!! ACHTUNG !!!                                             #\033[0m"
echo -e "\033[32m #                                                                                                              #\033[0m"
echo -e "\033[32m # Die Installation dieser Software nimmt eine Veraenderung der Router-Firmware vor.                            #\033[0m"
echo -e "\033[32m # Wenn Sie fortfahren, installieren Sie nicht vom Hersteller zertifizierte und herausgegebene                  #\033[0m"
echo -e "\033[32m # Software auf dem Geraet.                                                                                     #\033[0m"
echo -e "\033[32m # Dadurch verlieren Sie alle Ansprueche auf Support, Garantie und Gewaehrleistung fuer dieses Geraet           #\033[0m"
echo -e "\033[32m # Diese Software wird weder vom Hersteller des Geraetes entwickelt noch unterstuetzt.                          #\033[0m"
echo -e "\033[32m #                                                                                                              #\033[0m"
echo -e "\033[32m # (C)2019 by Thorsten Skotnica                                                                                 #\033[0m"
echo -e "\033[32m ################################################################################################################\033[0m"
 
echo -en "\nMoechten Sie fortfahren \"Yes\" or \"No\" (Ja oder Nein)? "
read x
  
case $x in
[YyJj]* ) echo "Installation wird fortgefuehrt" ;;
[Nn]* ) echo "Installation wird abgebrochen";rm TestGround_WireGuard_mips.sh;exit ;;
esac
   
   
# Holt und installiert alle notwendigen WireGuard Pakete
echo -e "\033[31m Download der benoetigten Pakete\033[0m"
wget https://raw.githubusercontent.com/smeagel73/TestGround/master/TestGround_WireGuard_MIPS.tar.gz -O /root/TestGround_WireGuard_MIPS.tar.gz &>/dev/null
tar -xvzf /root/TestGround_WireGuard_MIPS.tar.gz
echo -e "\033[31m Download abgeschlossen\033[0m"
echo -e "\033[31m Installation der benoetigten Pakete\033[0m"
opkg install /root/*.ipk
echo -e "\033[31m Installation abgeschlossen\033[0m"
rm /root/TestGround_WireGuard_MIPS.tar.gz
  
#Entfernt die installierten Pakete
echo -e "\033[31m Entfernen der nicht mehr benoetigten Dateien\033[0m"
rm /root/*.ipk
   
  
echo -e "\033[31m Einrichten der Firewall Regeln\033[0m"
uci show|grep firewall|grep "dest_port='51820'" && wireguard_rule1=1 || wireguard_rule1=0
if [ "$wireguard_rule1" = 0 ]
then
        echo "Die Firewall-Regel 51820 existiert noch nicht und wird angelegt"
        uci add firewall rule
        uci set firewall.@rule[-1].name='WireGuard1'
        uci set firewall.@rule[-1].target='ACCEPT'
        uci set firewall.@rule[-1].src='wan'
        uci set firewall.@rule[-1].proto='udp'
        uci set firewall.@rule[-1].dest_port='51820'
else
        echo "Die Firewall-Regel existiert bereits"
fi

   
uci commit # uebernimmt die aenderungen
reload_config # laedt die Config neu
echo -e "\033[31m Firewall konfigurieren abgeschlossen\033[0m"
 
 
clear
echo -e "\033[32m ################################################################################################################\033[0m"
echo -e "\033[32m #                                                                                                              #\033[0m"
echo -e "\033[32m # ######## ########  ######  ########     ######   ########   #######  ##     ## ##    ## ########             #\033[0m"
echo -e "\033[32m #    ##    ##       ##    ##    ##       ##    ##  ##     ## ##     ## ##     ## ###   ## ##     ##            #\033[0m"
echo -e "\033[32m #    ##    ##       ##          ##       ##        ##     ## ##     ## ##     ## ####  ## ##     ##            #\033[0m"
echo -e "\033[32m #    ##    ######    ######     ##       ##   #### ########  ##     ## ##     ## ## ## ## ##     ##            #\033[0m"
echo -e "\033[32m #    ##    ##             ##    ##       ##    ##  ##   ##   ##     ## ##     ## ##  #### ##     ##            #\033[0m"
echo -e "\033[32m #    ##    ##       ##    ##    ##       ##    ##  ##    ##  ##     ## ##     ## ##   ### ##     ##            #\033[0m"
echo -e "\033[32m #    ##    ########  ######     ##        ######   ##     ##  #######   #######  ##    ## ########             #\033[0m"
echo -e "\033[32m #                                                                                                              #\033[0m"
echo -e "\033[32m #      ##      ## #### ########  ########  ######   ##     ##    ###    ########  ########                     #\033[0m"
echo -e "\033[32m #      ##  ##  ##  ##  ##     ## ##       ##    ##  ##     ##   ## ##   ##     ## ##     ##                    #\033[0m"
echo -e "\033[32m #      ##  ##  ##  ##  ##     ## ##       ##        ##     ##  ##   ##  ##     ## ##     ##                    #\033[0m"
echo -e "\033[32m #      ##  ##  ##  ##  ########  ######   ##   #### ##     ## ##     ## ########  ##     ##                    #\033[0m"
echo -e "\033[32m #      ##  ##  ##  ##  ##   ##   ##       ##    ##  ##     ## ######### ##   ##   ##     ##                    #\033[0m"
echo -e "\033[32m #      ##  ##  ##  ##  ##    ##  ##       ##    ##  ##     ## ##     ## ##    ##  ##     ##                    #\033[0m"
echo -e "\033[32m #       ###  ###  #### ##     ## ########  ######    #######  ##     ## ##     ## ########                     #\033[0m"
echo -e "\033[32m #                                                                                                              #\033[0m"
echo -e "\033[32m #                                                                                                              #\033[0m"
echo -e "\033[32m #                                                                                                              #\033[0m"
echo -e "\033[32m #                                                                                                              #\033[0m"
echo -e "\033[32m #                                                  !!! ACHTUNG !!!                                             #\033[0m"
echo -e "\033[32m #                                                                                                              #\033[0m"
echo -e "\033[32m #                       Die Installation von WireGuard auf diesem System ist abgeschlossen.                    #\033[0m"
echo -e "\033[32m #                                                                                                              #\033[0m"
echo -e "\033[32m #                                                                                                              #\033[0m"
echo -e "\033[32m # Wir moechten an dieser Stelle nochmals auf folgende Punkte hinweisen:                                        #\033[0m"
echo -e "\033[32m # - Die Installation von WireGuard nimmt Aenderungen an der Geraete-Firmware vor.                              #\033[0m"
echo -e "\033[32m # - Durch die Aenderungen entfallen alle Ansprueche auf Support, Garantie und Gewaehrleistung                  #\033[0m"
echo -e "\033[32m # - Diese Software wird weder vom Hersteller des Geraetes entwickelt noch unterstuetzt.                        #\033[0m"
echo -e "\033[32m #                                                                                                              #\033[0m"
echo -e "\033[32m # (C) 2019 by Thorsten Skotnica                                                                                #\033[0m"
echo -e "\033[32m ################################################################################################################\033[0m"

rm /root/TestGround_WireGuard_mips.sh

