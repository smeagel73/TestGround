#!/bin/sh

# Benutzer auf Risiken hinweisen
clear
choice=""

while [ "$choice" != "q" ]
do
clear
echo
echo
echo -e "\033[34m #################################################################################################################\033[0m"
echo -e "\033[34m #                                                                                                             	 #\033[0m"
echo -e "\033[34m #	######## ########  ######  ########     ######   ########   #######  ##     ## ##    ## ########	 #\033[0m"
echo -e "\033[34m #	   ##    ##       ##    ##    ##       ##    ##  ##     ## ##     ## ##     ## ###   ## ##     ##	 #\033[0m"
echo -e "\033[34m #	   ##    ##       ##          ##       ##        ##     ## ##     ## ##     ## ####  ## ##     ##	 #\033[0m"
echo -e "\033[34m #	   ##    ######    ######     ##       ##   #### ########  ##     ## ##     ## ## ## ## ##     ##	 #\033[0m"
echo -e "\033[34m #	   ##    ##             ##    ##       ##    ##  ##   ##   ##     ## ##     ## ##  #### ##     ##	 #\033[0m"
echo -e "\033[34m #	   ##    ##       ##    ##    ##       ##    ##  ##    ##  ##     ## ##     ## ##   ### ##     ##	 #\033[0m"
echo -e "\033[34m #	   ##    ########  ######     ##        ######   ##     ##  #######   #######  ##    ## ########	 #\033[0m"
echo -e "\033[34m #														 #\033[0m"
echo -e "\033[34m #					##     ## ######## ##    ## ##     ##					 #\033[0m"                          
echo -e "\033[34m #					###   ### ##       ###   ## ##     ##					 #\033[0m"                 
echo -e "\033[34m #					#### #### ##       ####  ## ##     ##					 #\033[0m"                    
echo -e "\033[34m #					## ### ## ######   ## ## ## ##     ##                                    #\033[0m"                 
echo -e "\033[34m #					##     ## ##       ##  #### ##     ##                                    #\033[0m"                 
echo -e "\033[34m #					##     ## ##       ##   ### ##     ##                                    #\033[0m"                 
echo -e "\033[34m #					##     ## ######## ##    ##  #######					 #\033[0m"
echo -e "\033[34m #                                                                                                               #\033[0m"
echo -e "\033[34m #                                                                                                               #\033[0m"
echo -e "\033[34m #                                                  !!! ACHTUNG !!!                                              #\033[0m"
echo -e "\033[34m #                                                                                                               #\033[0m"
echo -e "\033[34m # Die Installation dieser Software nimmt eine Veraenderung der Router-Firmware vor.                             #\033[0m"
echo -e "\033[34m # Wenn Sie fortfahren, installieren Sie nicht vom Hersteller zertifizierte und herausgegebene                   #\033[0m"
echo -e "\033[34m # Software auf dem Geraet.                                                                                      #\033[0m"
echo -e "\033[34m # Dadurch verlieren Sie alle Ansprueche auf Support, Garantie und Gewaehrleistung fuer dieses Geraet            #\033[0m"
echo -e "\033[34m # Diese Software wird weder vom Hersteller des Geraetes entwickelt noch unterstuetzt.                           #\033[0m"
echo -e "\033[34m #                                                                                                               #\033[0m"
echo -e "\033[34m # (C)2018 by Thorsten Skotnica                                                                                  #\033[0m"
echo -e "\033[34m #################################################################################################################\033[0m"
echo
echo
        echo
        echo -e "\033[32mEingabe waehlen!\033[0m"
        echo
        echo "1) TestGround - Asterisk 15 MIPS (VR2020-Serie)"
        echo "2) TestGround - Asterisk 15 x86 (G3000-Serie)"
        echo "3) TestGround - SMSTOOLS - MIPS (VR2020-Serie)"
        echo "4) TestGround - SMSTOOLS - x86 (G3000-Serie)"
	echo "5) TestGround - Pushover"
        echo "6) TestGround - Firewall (Ports oeffnen)"
	echo "7) Testground - Firmwarecheck"
	echo
        echo "a) Aktuelles TestGround-Skript herunterladen"
	echo "c) TestGround-Konfiguration bearbeiten"
	echo "q) Quit"
        echo

        read choice

        case $choice in
            '1')
		wget https://www.dropbox.com/s/ly3tjdjng9utj62/TestGround_Asterisk15_mips.sh?dl=1 -O /root/TestGround_Asterisk15_mips.sh &>/dev/null && chmod +x /root/TestGround_Asterisk15_mips.sh &>/dev/null && /root/TestGround_Asterisk15_mips.sh
		#wget https://www.dropbox.com/s/mb9k8z50u46y2rs/TechDemo_Asterisk15_mips.sh?dl=1 -O /root/TechDemo_Asterisk15_mips.sh &>/dev/null && chmod +x /root/TechDemo_Asterisk15_mips.sh &>/dev/null && /root/TechDemo_Asterisk15_mips.sh
                ;;
            '2')
		wget https://www.dropbox.com/s/8lwr1ex3qjcrgps/TechDemo_Asterisk15_x86.sh?dl=1 -O /root/TechDemo_Asterisk15_x86.sh &>/dev/null && chmod +x /root/TechDemo_Asterisk15_x86.sh &>/dev/null && /root/TechDemo_Asterisk15_x86.sh
		;;
            '3')
		#wget https://www.dropbox.com/s/9h68uae60xbv7xp/TechDemo_SMSTOOLS_mips.sh?dl=1 -O /root/TechDemo_SMSTOOLS_mips.sh &>/dev/null && chmod +x /root/TechDemo_SMSTOOLS_mips.sh &>/dev/null && /root/TechDemo_SMSTOOLS_mips.sh
		wget https://www.dropbox.com/s/1gfevmofx1nocux/TestGround_SMSTOOLS_mips.sh?dl=1 -O /root/TestGround_SMSTOOLS_mips.sh &>/dev/null && chmod +x /root/TestGround_SMSTOOLS_mips.sh &>/dev/null && /root/TestGround_SMSTOOLS_mips.sh
                ;;
            '4')
		#wget https://www.dropbox.com/s/il8if0uxeii39f8/TechDemo_SMSTOOLS_x86.sh?dl=1 -O /root/TechDemo_SMSTOOLS_x86.sh  &>/dev/null && chmod +x /root/TechDemo_SMSTOOLS_x86.sh  &>/dev/null && /root/TechDemo_SMSTOOLS_x86.sh
		wget https://www.dropbox.com/s/6kf7abi5znkvtxx/TestGround_SMSTOOLS_x86.sh?dl=1 -O /root/TestGround_SMSTOOLS_x86.sh  &>/dev/null && chmod +x /root/TestGround_SMSTOOLS_x86.sh  &>/dev/null && /root/TestGround_SMSTOOLS_x86.sh
                ;;
            '5')
		wget https://raw.githubusercontent.com/smeagel73/TestGround/master/TestGround_Pushover.sh -O /root/TestGround_Pushover.sh &>/dev/null && chmod +x /root/TestGround_Pushover.sh &>/dev/null && /root/TestGround_Pushover.sh
		#wget https://www.dropbox.com/s/bfjt2x717725i1m/TechDemo_Firmwarecheck.sh?dl=1 -O /root/TechDemo_Firmwarecheck.sh &>/dev/null && chmod +x /root/TechDemo_Firmwarecheck.sh &>/dev/null && /root/TechDemo_Firmwarecheck.sh
		#wget https://www.dropbox.com/s/0ozzpz509hw4jaq/TestGround_Firmwarecheck.sh?dl=1 -O /root/TestGround_Firmwarecheck.sh &>/dev/null && chmod +x /root/TestGround_Firmwarecheck.sh &>/dev/null && /root/TestGround_Firmwarecheck.sh
                ;;
            '6')
		#wget https://www.dropbox.com/s/vzqcbecn22aal4n/TechDemo_Firewall.sh?dl=1 -O /root/TechDemo_Firewall.sh &>/dev/null && chmod +x /root/TechDemo_Firewall.sh &>/dev/null && /root/TechDemo_Firewall.sh
		wget https://www.dropbox.com/s/w98llq3yq51jokk/TestGround_Firewall.sh?dl=1 -O /root/TestGround_Firewall.sh &>/dev/null && chmod +x /root/TestGround_Firewall.sh &>/dev/null && /root/TestGround_Firewall.sh
		;;
            '7')
		file="/root/TestGround_Firmwarecheck.sh"
		if [ -f "$file" ]
		then
			echo -e "\033[33mFile lokal vorhanden. Moechten Sie die vorhanden Version nutzen (v)? Oder ggf. eine neuer Verion herunterladen (d)? Abbrechen mit (q)\033[0m"
		        read x
	                case $x in
	                [Vv]* ) /root/TestGround_Firmwarecheck.sh ;;
	                [Dd]* ) wget https://www.dropbox.com/s/0ozzpz509hw4jaq/TestGround_Firmwarecheck.sh?dl=1 -O /root/TestGround_Firmwarecheck.sh &>/dev/null && chmod +x /root/TestGround_Firmwarecheck.sh &>/dev/null && /root/TestGround_Firmwarecheck.sh ;;
	                esac
		else
		        wget https://www.dropbox.com/s/0ozzpz509hw4jaq/TestGround_Firmwarecheck.sh?dl=1 -O /root/TestGround_Firmwarecheck.sh &>/dev/null && chmod +x /root/TestGround_Firmwarecheck.sh &>/dev/null && /root/TestGround_Firmwarecheck.sh
		fi
		;;
	    'a')
		wget https://raw.githubusercontent.com/smeagel73/TestGround/master/TESTGROUND.sh -O /root/TESTGROUND.sh &>/dev/null && chmod +x /root/TESTGROUND.sh &>/dev/null
		#wget https://www.dropbox.com/s/zcw6uvm4acdref5/TESTGROUND.sh?dl=1 -O /root/TESTGROUND.sh &>/dev/null && chmod +x /root/TESTGROUND.sh &>/dev/null
		echo -e "\033[32mBitte das Script mit (q) beenden und neu starten\033[0m"
		read -p "Beliebige Taste druecken zum fortfahren..."
		;;
            'c')
		wget https://raw.githubusercontent.com/smeagel73/TestGround/master/TestGround_EditConfig.sh -O /root/TestGround_EditConfig.sh &>/dev/null && chmod +x /root/TestGround_EditConfig.sh &>/dev/nulln && /root/TestGround_EditConfig.sh
                ;;
            'q') clear;;
            *)   echo "menu item is not available; try again!";;
        esac
done

