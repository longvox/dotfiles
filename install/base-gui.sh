red=`tput setaf 1`
green=`tput setaf 2`
reset=`tput sgr0`

if [[ $(whoami) == "imlong" ]];
then
    echo "${green}Install GUI application!${reset}"

    echo "${green}Installing gnome  tweak tool!${reset}"
    sudo apt install gnome-tweak-tool -y

    sudo apt install gufw -y

    sudo apt install gdebi-core 

    echo "${green}Installing kazam!${reset}"
    sudo apt-get install kazam

    echo "${green}Install flameshot!${reset}"
    sudo apt-get install flameshot

    echo "${green}Installing vlc!${reset}"
    sudo apt-get install vlc -y
    
    echo "${green}Installing skype!${reset}"
    wget https://repo.skype.com/latest/skypeforlinux-64.deb
    sudo dpkg -i skypeforlinux-64.deb
    sudo apt-get install -f

    echo "${green}Installing mailspring!${reset}"
    sudo snap install mailspring

    sudo apt-get install ubuntu-restricted-extras
    
    echo "${green}Installing google chrome!${reset}"
    wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
    sudo gdebi google-chrome-stable_current_amd64.deb
    
    echo "${green}Installing firefox${reset}"
    sudo apt install firefox

    echo "${green}Installing spotify!${reset}"
    sudo snap install spotify
    
    echo "${green}Installing onlyoffice!${reset}"
    sudo snap install onlyoffice-desktopeditors

    echo "${green}Installing postman!${reset}"
    sudo snap install postman

    echo "${green}Installing zoom-client!${reset}"
    sudo snap install zoom-client

    echo "${green}Installing caprine!${reset}"
    sudo snap install caprine
else
    echo "${red}Not available GUI!${reset}"
fi
