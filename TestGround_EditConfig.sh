#!/bin/sh

#Pruefen ob testground.config vorhanden ist und einlesen
file="/permdata/testground.config"
if [ -f "$file" ]
then
        source /permdata/testground.config
else
    echo -e "\033[33mAchtung - $file nicht gefunden. Bitte Konfigurationsdatei anlegen/downloaden.#\033[0m"
    echo -e "\033[33mMoechten Sie die Beispielkonfiguration herunterladen (y/j)? - Abbruch mit (q)#\033[0m"
        read x
        case $x in
        [YyJj]* ) echo "Beispielkonfiguration wird heruntergeladen";wget https://www.dropbox.com/s/aykeadnusm8syx9/testground.config?dl=1 -O /permdata/testground.config &>/dev/null ;;
        [Qq]* ) echo "Installation wird abgebrochen" ;exit ;;
        esac
fi



choice=""
 
while [ "$choice" != "q" ]
do
clear
echo
echo -e "\033[32mEingabe waehlen!\033[0m"
echo
echo -e "\033[33m   Informationen:\033[0m"
echo "1) Werte anzeigen"
echo
echo -e "\033[33m   Mail Einstellungen:\033[0m"
echo "2) mailfrom aendern"
echo "3) mailto aendern"
echo "4) smtp_server aendern"
echo "5) smtp_port aendern"
echo "6) user aendern"
echo "7) password aendern"
echo
echo -e "\033[33m   Pushover Einstellungen:\033[0m"
echo "8) apikey aendern"
echo "9) userkey aendern"
echo "10) device aendern"
echo
echo "a) LEER"
echo "q) Quit"
echo



read choice
case $choice in
	'1')
		clear
		echo
		echo
		echo -e "\033[33mInhalt Abschnitt Mail Einstellungen#\033[0m"
		echo mailfrom= $mailfrom
		echo mailto= $mailto
		echo smtp_server= $smtp_server
		echo smtp_port= $smtp_port
		echo user= $user
		echo password= $password
		echo
                echo -e "\033[33mInhalt Abschnitt Pushover Einstellungen#\033[0m"
		echo apikey= $apikey
		echo userkey= $userkey
		echo device= $device
		echo
		read -p "[ENTER] druecken zum fortfahren..."
		;;
	'2')
		echo -e "\033[33mNeuer Wert fuer mailfrom - (q) fuer Abbruch (c) um Wert zu loeschen\033[0m"
                echo -e "\033[33mAktueller Wert fuer mailfrom: \033[32m$mailfrom\033[0m\033[0m"
		read mailfrom_n
		if [ "$mailfrom_n" = "" ] 
		then 
			echo "Keine Eingabe - es wird keine Aenderung vorgenommen"
	                read -p "[ENTER] druecken zum fortfahren..."
		elif [ "$mailfrom_n" = "c" ] 
		then
			echo -e "\033[33mWert fuer mailfrom geloescht\033[0m"
			mailfrom=""
			sed -i "s~mailfrom=.*~mailfrom=${mailfrom}~" /permdata/testground.config
	                read -p "[ENTER] druecken zum fortfahren..."
                elif [ "$mailfrom_n" = "q" ]
                then
                        echo -e "\033[33mAbbruch\033[0m"
                        read -p "[ENTER] druecken zum fortfahren..."
		else 
			mailfrom=$mailfrom_n
			sed -i "s~mailfrom=.*~mailfrom=${mailfrom}~" /permdata/testground.config
			echo -e "\033[33m$mailfrom wurde geschrieben\033[0m"
	                read -p "[ENTER] druecken zum fortfahren..."
		fi
		;;
        '3')
                echo -e "\033[33mNeuer Wert fuer mailto - (q) fuer Abbruch (c) um Wert zu loeschen\033[0m"
                echo -e "\033[33mAktueller Wert fuer mailto: \033[32m$mailto\033[0m\033[0m"
                read mailto_n
                if [ "$mailto_n" = "" ]
                then
                        echo "Keine Eingabe - es wird keine Aenderung vorgenommen"
                        read -p "[ENTER] druecken zum fortfahren..."
                elif [ "$mailto_n" = "c" ]
                then
                        echo -e "\033[33mWert fuer mailfrom geloescht\033[0m"
                        mailto=""
                        sed -i "s~mailto=.*~mailto=${mailto}~" /permdata/testground.config
                        read -p "[ENTER] druecken zum fortfahren..."
                elif [ "$mailto_n" = "q" ]
                then
                        echo -e "\033[33mAbbruch\033[0m"
                        read -p "[ENTER] druecken zum fortfahren..."
                else
                        mailto=$mailto_n
                        sed -i "s~mailto=.*~mailto=${mailto}~" /permdata/testground.config
                        echo -e "\033[33m$mailto wurde geschrieben\033[0m"
                        read -p "[ENTER] druecken zum fortfahren..."
                fi
                ;;
        '4')
                echo -e "\033[33mNeuer Wert fuer smtp_server - (q) fuer Abbruch (c) um Wert zu loeschen\033[0m"
                echo -e "\033[33mAktueller Wert fuer smtp_server: \033[32m$smtp_server\033[0m\033[0m"
                read smtp_server_n
                if [ "$smtp_server_n" = "" ]
                then
                        echo "Keine Eingabe - es wird keine Aenderung vorgenommen"
                        read -p "[ENTER] druecken zum fortfahren..."
                elif [ "$smtp_server_n" = "c" ]
                then
                        echo -e "\033[33mWert fuer mailfrom geloescht\033[0m"
                        smtp_server=""
                        sed -i "s~smtp_server=.*~smtp_server=${smtp_server}~" /permdata/testground.config
                        read -p "[ENTER] druecken zum fortfahren..."
                elif [ "$smtp_server_n" = "q" ]
                then
                        echo -e "\033[33mAbbruch\033[0m"
                        read -p "[ENTER] druecken zum fortfahren..."
                else
                        smtp_server=$smtp_server_n
                        sed -i "s~smtp_server=.*~smtp_server=${smtp_server}~" /permdata/testground.config
                        echo -e "\033[33m$smtp_server wurde geschrieben\033[0m"
                        read -p "[ENTER] druecken zum fortfahren..."
                fi
                ;;
        '5')
                echo -e "\033[33mNeuer Wert fuer smtp_port - (q) fuer Abbruch (c) um Wert zu loeschen\033[0m"
                echo -e "\033[33mAktueller Wert fuer smtp_port: \033[32m$smtp_port\033[0m\033[0m"
                read change
                if [ "$change" = "" ]
                then
                        echo "Keine Eingabe - es wird keine Aenderung vorgenommen"
                        read -p "[ENTER] druecken zum fortfahren..."
                elif [ "$change" = "c" ]
                then
                        echo -e "\033[33mWert fuer mailfrom geloescht\033[0m"
                        smtp_port=""
                        sed -i "s~smtp_port=.*~smtp_port=${smtp_port}~" /permdata/testground.config
                        read -p "[ENTER] druecken zum fortfahren..."
                elif [ "$change" = "q" ]
                then
                        echo -e "\033[33mAbbruch\033[0m"
                        read -p "[ENTER] druecken zum fortfahren..."
                else
                        smtp_port=$change
                        sed -i "s~smtp_port=.*~smtp_port=${smtp_port}~" /permdata/testground.config
                        echo -e "\033[33m$smtp_port wurde geschrieben\033[0m"
                        read -p "[ENTER] druecken zum fortfahren..."
                fi
                ;;
        '6')
                echo -e "\033[33mNeuer Wert fuer user - (q) fuer Abbruch (c) um Wert zu loeschen\033[0m"
                echo -e "\033[33mAktueller Wert fuer user: \033[32m$user\033[0m\033[0m"
                read change
                if [ "$change" = "" ]
                then
                        echo "Keine Eingabe - es wird keine Aenderung vorgenommen"
                        read -p "[ENTER] druecken zum fortfahren..."
                elif [ "$change" = "c" ]
                then
                        echo -e "\033[33mWert fuer user geloescht\033[0m"
                        user=""
                        sed -i "s~user=.*~user=${user}~" /permdata/testground.config
                        read -p "[ENTER] druecken zum fortfahren..."
                elif [ "$change" = "q" ]
                then
                        echo -e "\033[33mAbbruch\033[0m"
                        read -p "[ENTER] druecken zum fortfahren..."
                else
                        user=$change
                        sed -i "s~user=.*~user=${user}~" /permdata/testground.config
                        echo -e "\033[33m$user wurde geschrieben\033[0m"
                        read -p "[ENTER] druecken zum fortfahren..."
                fi
                ;;
        '7')
                echo -e "\033[33mNeuer Wert fuer password - (q) fuer Abbruch (c) um Wert zu loeschen\033[0m"
                echo -e "\033[33mAktueller Wert fuer password: \033[32m$password\033[0m\033[0m"
                read change
                if [ "$change" = "" ]
                then
                        echo "Keine Eingabe - es wird keine Aenderung vorgenommen"
                        read -p "[ENTER] druecken zum fortfahren..."
                elif [ "$change" = "c" ]
                then
                        echo -e "\033[33mWert fuer user geloescht\033[0m"
                        password=""
                        sed -i "s~password=.*~password=${password}~" /permdata/testground.config
                        read -p "[ENTER] druecken zum fortfahren..."
                elif [ "$change" = "q" ]
                then
                        echo -e "\033[33mAbbruch\033[0m"
                        read -p "[ENTER] druecken zum fortfahren..."
                else
                        password=$change
                        sed -i "s~password=.*~password=${password}~" /permdata/testground.config
                        echo -e "\033[33m$passwort wurde geschrieben\033[0m"
                        read -p "[ENTER] druecken zum fortfahren..."
                fi
                ;;
        '8')
                echo -e "\033[33mNeuer Wert fuer apikey - (q) fuer Abbruch (c) um Wert zu loeschen\033[0m"
                echo -e "\033[33mAktueller Wert fuer apikey: \033[32m$apikey\033[0m\033[0m"
                read change
                if [ "$change" = "" ]
                then
                        echo "Keine Eingabe - es wird keine Aenderung vorgenommen"
                        read -p "[ENTER] druecken zum fortfahren..."
                elif [ "$change" = "c" ]
                then
                        echo -e "\033[33mWert fuer apikey geloescht\033[0m"
                        apikey=""
                        sed -i "s~apikey=.*~apikey=${apikey}~" /permdata/testground.config
                        read -p "[ENTER] druecken zum fortfahren..."
                elif [ "$change" = "q" ]
                then
                        echo -e "\033[33mAbbruch\033[0m"
                        read -p "[ENTER] druecken zum fortfahren..."
                else
                        apikey=$change
                        sed -i "s~apikey=.*~apikey=${apikey}~" /permdata/testground.config
                        echo -e "\033[33m$passwort wurde geschrieben\033[0m"
                        read -p "[ENTER] druecken zum fortfahren..."
                fi
                ;;
        '9')
                echo -e "\033[33mNeuer Wert fuer userkey - (q) fuer Abbruch (c) um Wert zu loeschen\033[0m"
                echo -e "\033[33mAktueller Wert fuer userkey: \033[32m$userkey\033[0m\033[0m"
                read change
                if [ "$change" = "" ]
                then
                        echo "Keine Eingabe - es wird keine Aenderung vorgenommen"
                        read -p "[ENTER] druecken zum fortfahren..."
                elif [ "$change" = "c" ]
                then
                        echo -e "\033[33mWert fuer userkey geloescht\033[0m"
                        userkey=""
                        sed -i "s~userkey=.*~userkey=${userkey}~" /permdata/testground.config
                        read -p "[ENTER] druecken zum fortfahren..."
                elif [ "$change" = "q" ]
                then
                        echo -e "\033[33mAbbruch\033[0m"
                        read -p "[ENTER] druecken zum fortfahren..."
                else
                        userkey=$change
                        sed -i "s~userkey=.*~userkey=${userkey}~" /permdata/testground.config
                        echo -e "\033[33m$userkey wurde geschrieben\033[0m"
                        read -p "[ENTER] druecken zum fortfahren..."
                fi
                ;;
        '10')
                echo -e "\033[33mNeuer Wert fuer device - (q) fuer Abbruch (c) um Wert zu loeschen\033[0m"
                echo -e "\033[33mAktueller Wert fuer device: \033[32m$device\033[0m\033[0m"
                read change
                if [ "$change" = "" ]
                then
                        echo "Keine Eingabe - es wird keine Aenderung vorgenommen"
                        read -p "[ENTER] druecken zum fortfahren..."
                elif [ "$change" = "c" ]
                then
                        echo -e "\033[33mWert fuer device geloescht\033[0m"
                        device=""
                        sed -i "s~device=.*~device=${device}~" /permdata/testground.config
                        read -p "[ENTER] druecken zum fortfahren..."
                elif [ "$change" = "q" ]
                then
                        echo -e "\033[33mAbbruch\033[0m"
                        read -p "[ENTER] druecken zum fortfahren..."
                else
                        device=$change
                        sed -i "s~device=.*~device=${device}~" /permdata/testground.config
                        echo -e "\033[33m$device wurde geschrieben\033[0m"
                        read -p "[ENTER] druecken zum fortfahren..."
                fi
                ;;

esac
done
