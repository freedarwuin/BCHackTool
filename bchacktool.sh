#!/bin/bash

#Colors
    cyan='\e[0;36m'
    lightcyan='\e[96m'
    lightgreen='\e[1;32m'
    white='\e[1;37m'
    red='\e[1;31m'
    yellow='\e[1;33m'
    blue='\e[1;34m'
    tp='\e[0m'
    green='\e[0;32m'

# variables
    blink='\e[5m'
    setdir=$PWD
    version='BCHackTool v3.1'

# help
if [[ $1 =~ ^(-h|--help|-y|--yardım) ]] ; then
    echo ""
    echo -e "Archivo predeterminado para su uso ${lightgreen}sudo bash bchacktool.sh$tp"
    echo "----------------------------------------------------------"
    echo -e $cyan"    Crear por           $white":" $red Freedarwuin$tp"
    echo -e $cyan"    Github              $white":" $red https://github.com/freedarwuin/BCHackTool$tp"
    echo -e $cyan"    Instagram           $white":" $red @$tp"
    echo -e $cyan"    Developer           $white":" $red https://$tp"
    exit 0
fi

[ $UID != 0 ] && { echo -e "${red}Por favor${tp} '${blue}sudo bash $0${tp}'${tp} Ejecútalo de nuevo como${red}" ; exit 1 ; }

if [[ $1 =~ ^(-v|--version) ]] ; then
    echo "$version"
elif [[ $1 =~ ^(-s|--sil) ]] ; then
    function yesorno {
        read -p "$foldx ¿Quieres eliminar los existentes? (y/n)?" CONT
        if [[ "$CONT" =~ ^(e|E|evet|EVET) ]]; then
            rm -rf ./$foldx
        else
            echo "aprobado..";
        fi
    }
    cd $setdir
    if [[ -d kalisources ]] ; then
        foldx=kalisources
        yesorno
    fi
    if [[ -d inshackle ]] ; then
        foldx="encadenada"
        yesorno
    fi
    if [[ -d kickthemout ]] ; then
        foldx="echarlos"
        yesorno
    fi
    if [[ -d zphisher ]] ; then
        foldx="zphisher"
        yesorno
    fi
    if [[ -d userrecon ]] ; then
        foldx="userrecon"
        yesorno
    fi
    if [[ -d instashell ]] ; then
        foldx="instashell"
        yesorno
    fi
    if [[ -d cupp ]] ; then
        foldx="cupp"
        yesorno
    fi
    if [[ -d SpamWa ]] ; then
        foldx="SpamWa"
        yesorno
    fi
    if [[ -d IP-Tracer ]] ; then
        foldx="IP-Tracer"
        yesorno
    fi
    if [[ -d OSIF ]] ; then
        foldx="OSIF"
        yesorno
    fi
    if [[ -d Cam-Hackers ]] ; then
        foldx="Cam-Hackers"
        yesorno
    fi
    if [[ -d TheFatRat ]] ; then
        foldx="TheFatRat"
        yesorno
    fi
    if [[ -d RequiredChan ]] ; then
        foldx="RequiredChan"
        yesorno
    fi
    if [[ -d RED_HAWK ]] ; then
        foldx="RED_HAWK"
        yesorno
    fi
    if [[ -d ghost ]] ; then
        foldx="ghost"
        yesorno
    fi
fi

# spinner
spinlong ()
{
    bar="---------------------------"
    barlength=${#bar}
    i=0
    while ((i < 100)); do
        n=$((i*barlength / 100))
        printf "\e[00;32m\r[%-${barlength}s]\e[00m" "${bar:0:n}"
        ((i += RANDOM%5+2))
        sleep 0.02
    done
    echo -e "[${green}OK${tp}]"
}

function pressanykey {
    read -n 1 -r -s -p $'Presione cualquier tecla para continuar...\n'
}

function pressanykey3 {
    read -t 3 -n 1 -r -s -p $'Presione cualquier tecla para continuar...\n'
}

function ok {
    echo "ok" &> /dev/null
}

# banner
function banner {
    randomnumb=$((1 + RANDOM % 10))
    if [[ $randomnumb = "1" ]] ; then
        cat banners/banner1 
    elif [[ $randomnumb = "2" ]] ; then
        cat banners/banner2 
    elif [[ $randomnumb = "3" ]] ; then
        cat banners/banner3    
    elif [[ $randomnumb = "4" ]] ; then
        cat banners/banner4 
    elif [[ $randomnumb = "5" ]] ; then
        cat banners/banner5 
    elif [[ $randomnumb = "6" ]] ; then
        cat banners/banner6 
    elif [[ $randomnumb = "7" ]] ; then
        cat banners/banner7 
    elif [[ $randomnumb = "8" ]] ; then
        cat banners/banner8                    
    elif [[ $randomnumb = "9" ]] ; then
        cat banners/banner9 
    else
        cat banners/banner 
    fi
}

# detect ctrl+c exiting
trap ctrl_c INT
ctrl_c() {
echo -e "\n"
echo -e "[${blink}${yellow}*${tp}]$blue Gracias por elegir el programa BCHackTool {freedarwuin}:)$tp"
exit 0
}

## CHECK ##

# check internet 
function checkinternet {
  ping -c 1 google.com > /dev/null
  if [[ "$?" != 0 ]]
  then
    echo -e " Comprobando Internet...: ${red}NO SE PUDO CONECTAR$tp \n Este programa necesita una Internet activa"
    echo "Şimdi Salir"
    exit 1
  else
    echo "Comprobando Internet: CONECTADO"
    sleep 0.7
  fi
}
# check gali linaksss
checkkali=$(uname -r)
if [[ $checkkali = *kali* ]] ; then
    if [[ -d kalisources ]] ; then
        ok
    else
        echo "Se encontró el sistema operativo Kali Linux, descargando el actualizador automático."
        git clone https://github.com/freedarwuin/kalisources.git &> /dev/null
        spinlong
        cd kalisources &> /dev/null
        chmod +x kalisources &> /dev/null
        ./kalisources
    fi
fi

# SystemUpdate #
chmod +x SystemUpdate.sh
sudo bash SystemUpdate.sh

## -*-*- ##

# ruby check
checkruby=$(which ruby)
if [[ $checkruby = "" ]] ; then
    echo "Instalando Rubí..."
    apt install ruby -y &> /dev/null
    spinlong
fi

## check piton

#python
checkpython=$(which python)
if [[ $checkpython = "" ]] ; then
    echo "Instalando Python..."
    apt install -y python python-pip &> /dev/null
    spinlong
fi

#python2
checkpython2=$(which python2)
if [[ $checkpython2 = "" ]] ; then
    echo "Instalando Python2..."
    apt install -y python2 python2-pip &> /dev/null
    spinlong
fi

#python3
checkpython3=$(which python3)
if [[ $checkpython3 = "" ]] ; then
    echo "Instalando Python3..."
    apt install -y python3 python3-pip &> /dev/null
    spinlong
fi
#-# The real script real #-#
checkinternet
while :
do
clear
cd $setdir
banner
echo ""
echo -e "${blink}${lightgreen}  ---------------------------------------------------------$tp"
echo -e "${blink}${lightgreen}  |$tp ${cyan}Crear por           $white":" $red Freedarwuin$tp ${blink}${lightgreen}                        |$tp"
echo -e "${blink}${lightgreen}  |$tp ${cyan}Github              $white":" $red https://github.com/freedarwuin/BCHackTool$tp ${blink}${lightgreen}     |$tp"
echo -e "${blink}${lightgreen}  |$tp ${cyan}Instagram           $white":" $red @$tp ${blink}${lightgreen}                  |$tp"
echo -e "${blink}${lightgreen}  ---------------------------------------------------------$tp\n"
echo "  ~~~~~~~~~~~~~~~~~~~~~ BCHackTool ~~~~~~~~~~~~~~~~~~~~~~~~~" 
        echo ""
        echo " [1]  ✔ Inshackle             [2]  ✔ Kickthemout"
        echo " [3]  ✔ Zphisher              [4]  ✔ UserRecon"
        echo " [5]  ✔ Instashell            [6]  ✔ Cupp"
        echo " [7]  ✔ SpamWa                [8]  ✔ Ip-Tracer"
        echo " [9]  ✔ OSIF                  [10] ✔ CamHackers"
        echo " [11] ✔ TheFatRat             [12] ✔ RequiredChan" 
	      echo " [13] ✔ RED_HAWK              [14] ✔ Ghost"
        echo " [x]  ✔ Salir"
        echo ""
        echo -ne "❨${red}BCHackTool@Freedarwuin${tp}❩:(${blue}./BCHackTool${tp})\n↳[${blink}${lightcyan}*${tp}]➢ " ; read option
        
        case "$option" in 
            1)
            if [[ -d inshackle-bot ]] ; then
                ok
            else
                clear
                cat banners/bcbanner  
                echo -e $red "[0] Descargando Inshackle "
                git clone https://github.com/freedarwuin/inshackle-bot > /dev/null 2>&1
                spinlong
                echo -e $red "[1] Inshackle encadenado "
                cd inshackle-bot
                chmod +x inshackle.sh
                cd ..
                sleep 3
            fi
            clear
            cd inshackle-bot
            bash inshackle.sh
            cd ..
                ;;
            2) 
            if [[ -d kickthemout ]] ; then
                ok
            else 
                clear
                cat banners/bcbanner
                echo -e $red "[0] Descarga Kickthemout "
                git clone https://github.com/freedarwuin/kickthemout > /dev/null 2>&1
                spinlong
                cd kickthemout
                echo -e $red "[1] Instalación de componentes adicionales "
                {
                apt install nmap -y
                apt install python3 -y             
                apt install python3-pip -y             
                pip3 install -r requirements.txt              
                chmod +x kickthemout.py
                } &> /dev/null
                spinlong
                cd ..
                echo -e $red "[2] Kickthemout fundado "
                sleep 3
            fi
            clear
            cd kickthemout
            python3 kickthemout.py
            cd ..
                ;;
            3)
             if [[ -d zphisher ]] ; then
                ok
            else 
                clear
                cat banners/bcbanner  
                echo -e $red "[0] Descargando Zphisher "
                git clone https://github.com/freedarwuin/zphisher2 >  /dev/null 2>&1
                spinlong
                echo -e $red "[2] Zphisher fundado"
                sleep 3
            fi
            clear
            cd zphisher2
            bash zphisher.sh
            cd ..
                ;;
            4)
            if [[ -d userrecon ]] ; then
                ok
            else 
                clear
                cat banners/bcbanner  
                echo -e $red "[0] Descargando UserRecon "
                git clone https://github.com/freedarwuin/userrecon > /dev/null 2>&1
                spinlong
                cd userrecon
                chmod +x userrecon.sh
                echo -e $red "[1] UserRecon Kuruldu "
                cd ..
                sleep 3
            fi
            clear
            cd userrecon
            ./userrecon.sh
            cd ..
                ;;
            5)
            if [[ -d instashell ]] ; then
                ok
            else 
                clear
                cat banners/bcbanner   
                echo -e $red "[0] Descargando Instashell "
                git clone https://github.com/freedarwuin/instashell > /dev/null 2>&1
                spinlong
                cd instashell
                echo -e $red "[1] Instalación de componentes adicionales "
                {
                chmod +x instashell.sh
                chmod +x install.sh
                clear
                sudo ./install.sh
                clear
                service tor start
                } &> /dev/null
                spinlong
                echo -e $red "[2] Instashell establecido "
                cd ..
                sleep 3
            fi
            clear
            cd instashell
            ./instashell.sh
            cd ..
                ;;
	        6)
            if [[ -d cupp ]] ; then
                ok
            else 
                clear
                cat banners/bcbanner  
                echo -e $red "[0] Descargando Cupp "
                git clone https://github.com/freedarwuin/cupp > /dev/null 2>&1
                spinlong
                cd cupp
                echo -e $red "[1] Instalación de componentes adicionales "
                {
                chmod +x cup.py
                apt-get install -y python3
                } &> /dev/null
                spinlong
                echo -e $red "[2] Copa establecida "
                cd ..
                sleep 3
            fi
            clear
            cd cupp
            sudo python3 cupp.py -i
            cd ..
                ;;
	        7)
            if [[ -d SpamWa ]] ; then
                ok
            else 
                clear
                cat banners/bcbanner 
                echo -e $red "[0] Descargando SpamWa "
                git clone https://github.com/freedarwuin/SpamWa > /dev/null 2>&1
                spinlong
                cd SpamWa
                echo -e $red "[1] Instalación de componentes adicionales "
                {
                chmod +x spam.py
                pip3 install requests
                } &> /dev/null
                spinlong
                cd ..
                echo -e $red "[2] SpamWa establecido "
                sleep 3
            fi
            clear
            cd SpamWa
            sudo python3 spam.py
            cd ..
                ;;
		    8)
            if [[ -d IP-Tracer ]] ; then
                ok
            else 
                clear
                cat banners/bcbanner  
                echo -e $red "[0] Descargando IP-Tracer "
                git clone https://github.com/freedarwuin/IP-Tracer > /dev/null 2>&1
                spinlong
                cd IP-Tracer
                echo -e $red "[1] Instalación de componentes adicionales "
                {
                chmod +x install
                ./install
                } &> /dev/null
                spinlong
                cd ..
                echo -e $red "[2] IP-Tracer instalado "
                sleep 3
            fi
            clear
            cd Ip-Tracer
            ip-tracer start
            cd ..
                ;;
		    9)
            if [[ -d OSIF ]] ; then
                ok
            else 
                clear
                cat banners/bcbanner   
                echo -e $red "[0] Descargando OSIF "
                git clone https://github.com/freedarwuin/OSI > /dev/null 2>&1
                spinlong
                cd OSIF
                echo -e $red "[1] Instalación de componentes adicionales "
                {
                pip2 install -r requirements.txt
                } &> /dev/null
                spinlong
                cd ..
                echo -e $red "[2] OSIF establecido "
                sleep 3
            fi
            clear
            cd OSIF
            python2 osif.py
            cd ..
                ;;
		    10)
            if [[ -d Cam-Hackers ]] ; then
                ok
            else 
                clear
                cat banners/bcbanner   
                echo -e $red "[0] Descargando Cam-Hackers "
                git clone https://github.com/freedarwuin/Cam-Hackers > /dev/null 2>&1
                spinlong
                cd Cam-Hackers
                echo -e $red "[1] Instalación de componentes adicionales "
                {
                apt-get install -y python3-pip
                pip3 install requests
                } &> /dev/null
                spinlong
                cd ..
                echo -e $red "[2] Se fundan Cam-Hackers "
                sleep 3
            fi
            clear
            cd Cam-Hackers
            sudo python3 cam-hackers.py
            pressanykey
                ;;
		    11)
            if [[ -d TheFatRat ]] ; then
                ok
            else 
                clear
                cat banners/bcbanner   
                echo -e $red "[0] Descargando TheFatRat "
                git clone https://github.com/freedarwuin/TheFatRat > /dev/null 2>&1
                spinlong
                cd TheFatRat
                echo -e $red "[1] Instalación de componentes adicionales "
                {
                apt-get install -y default-jdk
                chmod +x setup.sh
				./setup.sh
                } #&> /dev/null
                spinlong
                cd ..
                echo -e $red "[2] TheFatRat fundado "
                sleep 3
            fi
            clear
            pwd
            cd TheFatRat
            pwd
            ./fatrat
            sleep 15
            cd ..
                ;;
            12)
            if [[ -d RequiredChan ]] ; then
                ok
            else 
                clear
                cat banners/bcbanner   
                echo -e $red "[0] Descarga requeridaChan "
                git clone https://github.com/freedarwuin/RequiredChan > /dev/null 2>&1
                spinlong
                cd RequiredChan
                echo -e $red "[1] RequiredChan Kuruldu "
                sleep 3
            fi
            clear
            cd RequiredChan
            chmod +x reqchan
            ./reqchan
            cd ..
                ;;
            13)
            if [[ -d RED_HAWK ]] ; then
                ok
            else
                clear
                cat banners/bcbanner
                echo -e $red "[0] Descargando RED_HAWK "
                git clone https://github.com/freedarwuin/RED_HAWK > /dev/null 2>&1
                spinlong
                cd RED_HAWK
                echo -e $red "[1] Instalación de componentes adicionales "
                {
                sudo apt-get -qq --assume-yes install php-curl
                sudo apt-get -qq --assume-yes install php-xml
                } &> /dev/null
                spinlong
                cd ..
                echo -e $red "[2] RED_HAWK Establecido "
                sleep 3
            fi
            clear
            cd RED_HAWK
            php rhawk.php
                ;;
            14)
            if [[ -d ghost ]] ; then
                ok
            else
                clear
                cat banners/bcbanner
                echo -e $red "[0] Descarga Ghost "
                git clone https://github.com/freedarwuin/Ghost > /dev/null 2>&1
                spinlong
                cd Ghost
                echo -e $red "[1] Instalación de componentes adicionales "
                {
                pip3 install git+https://github.com/freedarwuin/Ghost
                } &> /dev/null
                spinlong
                cd ..
                echo -e $red "[2] Ghost establecido "
                sleep 3
            fi
            clear
            cd Ghost
            ghost
             	;;
            x)
                clear
                cat banners/bcbanner
                echo " ¡¡Gracias por elegir el programa BCChackTool {Freedarwuin}!!"
                echo ""
                exit 0
                ;;
        esac
done
