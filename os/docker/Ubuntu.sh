
php="$(ps -efw | grep php | grep -v grep | awk '{print $2}')"
ngrok="$(ps -efw | grep ngrok | grep -v grep | awk '{print $2}')"
kill -9 $php
kill -9 $ngrok
echo ""
                           printf "\e[31m[\e[32m★\e[31m]\e[32m This Cloud Desktop VNC Server RDP \e[m "
                           echo ""
                           sudo apt install -y tightvncserver -y
			   sudo apt update -y 
			   echo -e
			   sudo apt install docker
                           echo ""
			   clear
			   echo ""
			   echo ""
	 clear
	 echo ""
			   echo ""
			   echo ""
			   echo -e
			   printf "\e[31m[\e[32m★\e[31m]\e[32m This Cloud Server is Ready \e[m "
			   echo""
			   echo -e
			   printf '\e[91m Start Server and Click Link :- \e[97m https://localhost:8080 \e[0m '
			   echo ""
			   echo -e
                           read -p $'\e[1;40m\e[31m[\e[32m*\e[31m]\e[32m Start VNC Server \e[1;91m (Y/N) : \e[0m' option
                           echo""
                           echo""
                           echo""

                           if [[ $option == *'Y'* ]]; then
                           docker run -p 8080:80 dorowu/ubuntu-desktop-lxde-vnc
                           fi
                           if [[ $option == *'y'* ]]; then
                           docker run -p 8080:80 dorowu/ubuntu-desktop-lxde-vnc
                           fi
			   echo -e " "
			   echo " "     
			   echo ""
			   echo
			   echo ""
			   echo -e
                           read -p $'\e[1;40m\e[31m[\e[32m*\e[31m]\e[32m Stop Server \e[1;91m (Y/N) : \e[0m' option
                           echo""
			   rm -rf RDP/ubuntu-desktop-lxde-vnc.sh
                           echo""
			   if [[ $option == *'Y'* ]]; then
                           exit
                           fi
                           if [[ $option == *'y'* ]]; then
                           exit
                           fi 