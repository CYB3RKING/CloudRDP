#!/bin/sh

php="$(ps -efw | grep php | grep -v grep | awk '{print $2}')"
ngrok="$(ps -efw | grep ngrok | grep -v grep | awk '{print $2}')"
kill -9 $php
kill -9 $ngrok
echo "Preparing...."
sudo mv ./ngrok /bin/ngrok; chmod 777 /bin/ngrok
read -p "INSERT authtoken ngrok: " key
ngrok authtoken $key
echo ""
echo "Installing Linux (Debian amd64)...."
wget -qO - https://download.sublimetext.com/sublimehq-pub.gpg | sudo apt-key add -
echo "deb https://download.sublimetext.com/ apt/stable/" | sudo tee /etc/apt/sources.list.d/sublime-text.list
sudo apt update -y > /dev/null 2>&1
sudo apt install apt-transport-https ufw fish apache2 php sublime-text xfce4 xarchiver wine firefox-esr mesa-utils git xfce4-goodies pv nmap nano apt-utils dialog terminator autocutsel dbus-x11 dbus neofetch perl p7zip unzip zip curl tar git python3 python3-pip net-tools openssl tigervnc-standalone-server tigervnc-xorg-extension -y
export HOME="$(pwd)"
export DISPLAY=":0"
cd $HOME 2> /dev/null
sudo mkdir ~/.vnc 2> /dev/null
if [ ! -d ~/.config ] 2> /dev/null; then
  sudo mkdir ~/.config 2> /dev/null
fi
if [ ! -d ~/.config/fish ] 2> /dev/null; then
  sudo mkdir ~/.config/fish 2> /dev/null
fi
echo "set fish_greeting" > ~/.config/fish/config.fish
chmod -R 777 ~/.config 2> /dev/null
sudo printf '#!/bin/bash\ndbus-launch &> /dev/null\nautocutsel -fork\nxfce4-session\n' > ~/.vnc/xstartup
wget -O startvps.sh "https://raw.githubusercontent.com/KhanhNguyen9872/Debian_VPS_Google_Shell/main/startvps.sh" 2> /dev/null
wget -O setupPS.sh "https://raw.githubusercontent.com/KhanhNguyen9872/Debian_VPS_Google_Shell/main/setupPS.sh" 2> /dev/null
wget -O apache2.conf "https://raw.githubusercontent.com/KhanhNguyen9872/Debian_VPS_Google_Shell/main/apache2.conf" 2> /dev/null
wget -O vscode.deb "https://github.com/KhanhNguyen9872/Debian_VPS_Google_Shell/blob/main/app/vscode_1.66.1_amd64.deb?raw=true" 2> /dev/null
chmod +x *
sudo mv ./startvps.sh /bin/startvps 2> /dev/null
sudo rm -rf ~/.bashrc 2> /dev/null
sudo mv ./setupPS.sh ~/.bashrc 2> /dev/null
sudo rm -f /bin/wine 2> /dev/null
sudo ln -s /etc/alternatives/wine64 /bin/wine 2> /dev/null
sudo mv ./apache2.conf /etc/apache2/apache2.conf 2> /dev/null
cat > "${HOME}/wine64_explorer.desktop" <<EOL
[Desktop Entry]
Version=1.0
Type=Application
Name=wine64 explorer
Comment=Run exe on Linux
Exec=/bin/wine64 explorer.exe
Icon=
Path=
Terminal=false
StartupNotify=false
EOL
sudo chmod 777 ${HOME}/wine64_explorer.desktop
sudo chmod 777 -R ~/.vnc 2> /dev/null
sudo chmod 777 ~/.bashrc 2> /dev/null
sudo chmod 777 /bin/startvps 2> /dev/null
sudo chmod 777 /bin/wine 2> /dev/null
sudo chmod 777 /etc/apache2/apache2.conf 2> /dev/null
dpkg -i vscode.deb
rm -rf ./vscode.deb 2> /dev/null
sudo apt update -y > /dev/null 2>&1
sudo apt autoremove -y
if [ ! -d /usr/share/themes/Windows-10-Dark-master ] 2> /dev/null; then
  cd /usr/share/themes/ 2> /dev/null
  wget -O Windows-10-Dark-master.zip "https://github.com/KhanhNguyen9872/Debian_VPS_Google_Shell/blob/main/app/Windows-10-Dark-master.zip?raw=true" 2> /dev/null
  unzip -qq Windows-10-Dark-master.zip 2> /dev/null
  rm -f Windows-10-Dark-master.zip 2> /dev/null
fi
cd $HOME 2> /dev/null
clear

red='\033[1;31m'
green='\033[1;32m'
yellow='\033[1;33m'
blue='\033[1;34m'
light_cyan='\033[1;96m'
reset='\033[0m'
orange='\33[38;5;208m'

cd ~/ 2> /dev/null
unset DBUS_LAUNCH
export HOME="$(pwd)"
export DISPLAY=":0"
sudo kill -9 $(pgrep ngrok) &> /dev/null 2> /dev/null
while [[ $server == "" ]] 2> /dev/null || [ -z $server ] 2> /dev/null; do
    printf "${blue} Select your region:\n${yellow} 1. United States (Ohio)\n 2. Europe (Frankfurt)\n 3. Asia/Pacific (Singapore)\n 4. Australia (Sydney)\n 5. South America (Sao Paulo)\n 6. Japan (Tokyo)\n 7. India (Mumbai)\n 8. Exit\n\n${green}"
    read -p "Region: " server
    if [[ $server -eq 1 ]] 2> /dev/null; then
        khanhregion="us"
    else
        if [[ $server -eq 2 ]] 2> /dev/null; then
            khanhregion="eu"
        else
            if [[ $server -eq 3 ]] 2> /dev/null; then
                khanhregion="ap"
            else
                if [[ $server -eq 4 ]] 2> /dev/null; then
                    khanhregion="au"
                else
                    if [[ $server -eq 5 ]] 2> /dev/null; then
                        khanhregion="sa"
                    else
                        if [[ $server -eq 6 ]] 2> /dev/null; then
                            khanhregion="jp"
                        else
                            if [[ $server -eq 7 ]] 2> /dev/null; then
                                khanhregion="in"
                            else
                                if [[ $server == "K" ]] 2> /dev/null || [[ $server == "k" ]] 2> /dev/null; then
                                    exit 0
                                else
                                    unset server
                                fi
                            fi
                        fi
                    fi
                fi
            fi
        fi
    fi
done
nohup sudo ngrok tcp --region ap 127.0.0.1:5900 &> /dev/null &
vncserver -kill :0 &> /dev/null 2> /dev/null
sudo rm -rf /tmp/* 2> /dev/null
vncserver :0
sudo /sbin/sysctl -w net.ipv4.tcp_keepalive_time=10000 net.ipv4.tcp_keepalive_intvl=5000 net.ipv4.tcp_keepalive_probes=100
khanhall="$(service  --status-all 2> /dev/null | grep '\-' | awk '{print $4}')"
while IFS= read -r line; do
    nohup sudo service "$line" start &> /dev/null 2> /dev/null &
done < <(printf '%s\n' "$khanhall")
clear
printf "\nYour IP Here: "
curl --silent --show-error http://127.0.0.1:4040/api/tunnels | sed -nE 's/.*public_url":"tcp:..([^"]*).*/\1/p'
export PS1='\[\e]0;\u@\h: \w\a\]${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
printf "\n\n"
### This line by kmille36
seq 1 9999999999999 | while read i; do echo -en "\r Running .     $i s /9999999999999 s";sleep 0.1;echo -en "\r Running ..    $i s /9999999999999 s";sleep 0.1;echo -en "\r Running ...   $i s /9999999999999 s";sleep 0.1;echo -en "\r Running ....  $i s /9999999999999 s";sleep 0.1;echo -en "\r Running ..... $i s /9999999999999 s";sleep 0.1;echo -en "\r Running     . $i s /9999999999999 s";sleep 0.1;echo -en "\r Running  .... $i s /9999999999999 s";sleep 0.1;echo -en "\r Running   ... $i s /9999999999999 s";sleep 0.1;echo -en "\r Running    .. $i s /9999999999999 s";sleep 0.1;echo -en "\r Running     . $i s /9999999999999 s";sleep 0.1; done
