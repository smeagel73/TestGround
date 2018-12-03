#!/bin/sh

##################################################################################################################
#														 #
#	######## ########  ######  ########     ######   ########   #######  ##     ## ##    ## ########  	 #
#	   ##    ##       ##    ##    ##       ##    ##  ##     ## ##     ## ##     ## ###   ## ##     ## 	 #
#	   ##    ##       ##          ##       ##        ##     ## ##     ## ##     ## ####  ## ##     ## 	 #
#	   ##    ######    ######     ##       ##   #### ########  ##     ## ##     ## ## ## ## ##     ## 	 #
#	   ##    ##             ##    ##       ##    ##  ##   ##   ##     ## ##     ## ##  #### ##     ## 	 #
#	   ##    ##       ##    ##    ##       ##    ##  ##    ##  ##     ## ##     ## ##   ### ##     ## 	 #
#	   ##    ########  ######     ##        ######   ##     ##  #######   #######  ##    ## ########  	 #
#														 #
#	         ########  ##     ##  ######  ##     ##  #######  ##     ## ######## ########             	 #
#	         ##     ## ##     ## ##    ## ##     ## ##     ## ##     ## ##       ##     ##            	 #
#	         ##     ## ##     ## ##       ##     ## ##     ## ##     ## ##       ##     ##            	 #
#	         ########  ##     ##  ######  ######### ##     ## ##     ## ######   ########             	 #
#	         ##        ##     ##       ## ##     ## ##     ##  ##   ##  ##       ##   ##              	 #
#	         ##        ##     ## ##    ## ##     ## ##     ##   ## ##   ##       ##    ##             	 #
#	         ##         #######   ######  ##     ##  #######     ###    ######## ##     ##            	 #
#                                                                                                                #
#                                                                                                              	 #
#                                                  !!! ACHTUNG !!!                                               #
#                                                                                                                #
# Die Installation dieser Software nimmt eine Veraenderung der Router-Firmware vor.                              #
# Wenn Sie fortfahren, installieren Sie nicht vom Hersteller zertifizierte und herausgegebene                    #
# Software auf dem Geraet.                                                                                       #
# Dadurch verlieren Sie alle Ansprueche auf Support, Garantie und Gewaehrleistung fuer dieses Geraet             #
# Diese Software wird weder vom Hersteller des Geraetes entwickelt noch unterstuetzt.				 #
#                                                                                                              	 #
# (C)2018 by Thorsten Skotnica											 #
##################################################################################################################

# Pruefen ob das Konfigurations-File exisitiert und einlesen.
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

# Pruefen ob die benoetigten Einstellungen im Konfig-File gesetzt sind
if [ "$apikey" = "" ] ;then echo -e "Bitte Einstellungen \033[31mpushover_apikey in der /permdata/testground.config\033[0m ueberpruefen - Abbruch" ;read -p "Beliebige Taste druecken zum fortfahren..." ;exit ;fi

# Pruefen ob die benoetigten Einstellungen im Konfig-File gesetzt sind
if [ "$userkey" = "" ] ;then echo -e "Bitte Einstellungen \033[31mpushover_userkey in der /permdata/testground.config\033[0m ueberpruefen - Abbruch" ;read -p "Beliebige Taste druecken zum fortfahren..." ;exit ;fi

# Pruefen ob die benoetigten Einstellungen im Konfig-File gesetzt sind
if [ "$device" = "" ] ;then echo -e "Bitte Einstellungen \033[31mpushover_device in der /permdata/testground.config\033[0m ueberpruefen - Abbruch" ;read -p "Beliebige Taste druecken zum fortfahren..." ;exit ;fi


VERSION="1.0"
PROGNAME="$(basename $0)"

. /lib/functions.sh
. /usr/share/libubox/jshn.sh

log() {
logger -p daemon.debug -t "Skript" "$1"
}



print_usage () {
    cat <<EOT
Usage:  ${PROGNAME} -u <user key> -a <api key> [<options>] -t "Titel" -m "Nachricht"
Supported options:
    -h              Hilfe anzeigen
    -v              Version anzeigen
    -u  <user key>  user key (nicht die E-Mail Adresse) - Kann im Programm hinterlegt werden
    -a  <api key>   application's API token - Kann im Programm hinterlegt werden
    -m  <message>   Nachricht, welche gesendet wird. Muss in Anfuehrungszeichen eingegeben werden
    -d  <device>    Device an welches die Nachricht gesendet wird - Kann im Programm hinterlegt werden
    -t  <title>     Titel der Nachricht. Muss in Anfuehrungszeichen eingegeben werden
    -p  <priority>  Prioritaet der Nachricht (Wert von -2 bis 2 moeglich
                    2 entspricht der hoechsten und -2 der niedrigsten Prioritaet
    -e		    Die Konfig-Datei testground.config editieren um user key, api key und device fest zu hinterlegen	
EOT
}


COMMAND_PARAM=":vhelp:m:t:d:u:a:"
 
# falls nicht Uebergeben wurden mit exit beenden
if ( ! getopts "${COMMAND_PARAM}" opt); then
    #echo "Usage: `basename $0` options -t Titel der Nachricht / use -h for help";
    print_usage
    echo -e "\033[33m    Beispiel -t \"Testtitel\" -m \"Nachricht von Max Mustermann\" -d \"TESTHANDY\"\033[0m"
    exit 1;
fi
 
# Parameter auswerten
 
while getopts "${COMMAND_PARAM}"  opt; do
  case $opt in
    l)
	lvar="1"
	>&2
	;;
    m)
	mvar="$OPTARG"
	>&2
     	;;
    t)
	tvar="$OPTARG"
	>&2
	;;  
    p)
        pvar="$OPTARG"
        >&2
	;;
    u)
        uvar="$OPTARG"
        >&2
	;;
    a)
        avar="$OPTARG"
        >&2
	;;
    d)
        dvar="$OPTARG"
        >&2
      	;;
    v)
	echo "${PROGNAME} ${VERSION}"
	exit
	>&2
      	;;

    h)
        print_usage
	exit
	>&2
      	;;
    e)
        nano /permdata/testground.config
        exit
        >&2       
        ;;
    \?)
      	echo "Invalid option: -$OPTARG" >&2
      	exit 1
      	;;
    :)
      	echo 'Option '-$OPTARG' requires an argument. '${PROGNAME}' -h fuer Hilfe' >&2
      	exit 1
      	;;
  esac
done

# Standardwert setzen falls keine Option mitgegeben wurde aber der Wert benoetigt wird
if [ -z "$tvar" ] ;then echo "Titel -t MUSS gesetzt werden. Hilfe mit -h" ; exit ;fi
if [ -z "$mvar" ] ;then mvar=$tvar ;fi
if [ -z "$pvar" ] ;then pvar="0" ;fi
if [ "$pvar" -gt 1 ] || [ "$pvar" -lt -2 ] ;then echo "Es werden nur Werte zwischen -2 und 1 unterstuetzt. Hilfe mit -h" ; exit ;fi
if [ -z "$lvar" ] ;then : ;else log "Pushover-Nachricht: Titel:$tvar, Nachricht:$mvar, Prioritaet:$pvar, an Device:$dvar" ;fi
if [ -z "$dvar" ] ;then dvar=$device ;fi
if [ -z "$uvar" ] ;then uvar=$userkey ;fi
if [ -z "$avar" ] ;then avar=$apikey ;fi
if [ -z "$pvar" ] ;then pvar="0" ;fi
if [ -z "$uvar" ] ;then echo "Kein userkey gesetzt. Hilfe mit -h" ; exit ;fi
if [ -z "$avar" ] ;then echo "Kein apikey gesetzt. Hilfe mit -h" ; exit ;fi


# Senden der Nachricht via Pushover


if [ -z "$dvar" ]
then
	curl -s -k \-F "token=$avar" \-F "user=$uvar" \-F "message=$mvar" \-F "title=$tvar" \-F "priority=$pvar" \https://api.pushover.net/1/messages.json &>/dev/null
else
        curl -s -k \-F "token=$avar" \-F "user=$uvar" \-F "message=$mvar" \-F "title=$tvar" \-F "priority=$pvar" \-F "device=$device" \https://api.pushover.net/1/messages.json &>/dev/null
fi

