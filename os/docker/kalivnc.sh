
php="$(ps -efw | grep php | grep -v grep | awk '{print $2}')"
ngrok="$(ps -efw | grep ngrok | grep -v grep | awk '{print $2}')"
kill -9 $php
kill -9 $ngrok
echo -e "$123\n$123\n" | sudo passwd
clear
clear
echo ""
echo -e "\e[31m[\e[32m*\e[31m]\e[93m Go to : \e[97m https://dashboard.ngrok.com/get-started/your-authtoken \e[m "
echo ""
echo -e "\e[31m[\e[32m*\e[31m]\e[93m Sign up & get ngrok authtoken \e[m "
echo ""
read -p $'\e[31m[\e[32m*\e[31m]\e[93m Paste Ngrok Authtoken: \e[96m [Ex. 2cEG2LcBt**********WK5Ntc ] : \e[0m' CRP
echo ""
./ngrok authtoken $CRP 
clear
echo ""
echo ""
echo ""
echo "==========================================================="
echo -e "\e[96mChoose Ngrok Region (for better connection).\e[0m"
echo "==========================================================="
echo -e "us - \e[93mUnited States \e[92m(Ohio)\e[0m"
echo -e "eu - \e[93mEurope \e[92m(Frankfurt)\e[0m"
echo -e "ap - \e[93mAsia/Pacific \e[92m(Singapore)\e[0m"
echo -e "au - \e[93mAustralia \e[92m(Sydney)\e[0m"
echo -e "sa - \e[93mSouth America \e[92m(Sao Paulo)\e[0m"
echo -e "jp - \e[93mJapan \e[92m(Tokyo)\e[0m"
echo -e "in - \e[93mIndia \e[92m(Mumbai)\e[0m"
echo ""
read -p "choose ngrok region: " CRP
./ngrok tcp --region $CRP 3388 &>/dev/null &
clear
echo ""
echo -e "\e[1;33m[\e[0m\e[1;77m~\e[0m\e[1;33m]\e[0m\e[1;32m Installing The Download Cloud Linux RDP Tool Kali Linux Desktop Environment  \e[0m"
echo ""
echo -e $'\e[1;91m\e[0m\e[1;91m\e[0m\e[1;96m\e[0m\e[1;91m   ---------------------------------------  \e[1;91m\e[0m'
echo -e $'\e[1;96m\e[0m\e[1;77m\e[0m\e[1;96m\e[0m\e[1;93m  !!          Download Kali Linux        !!\e[0m'
echo -e $'\e[1;91m\e[0m\e[1;91m\e[0m\e[1;96m\e[0m\e[1;91m   --------------------------------------- \e[1;91m\e[0m'
echo ""
echo -e ""
echo ""
sleep 1
docker pull danielguerra/ubuntu-xrdp
clear
echo -e "\e[93m RDP Address:\e[97m" 
  curl --silent --show-error http://127.0.0.1:4040/api/tunnels | sed -nE 's/.*public_url":"tcp:..([^"]*).*/\1/p' 
echo -e "\e[96m User: \e[97m ubuntu"
echo -e "\e[92m Password: \e[97m ubuntu"
docker run --rm -p 3388:3389 danielguerra/ubuntu-xrdp:kali 
