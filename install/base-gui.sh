red=`tput setaf 1`
green=`tput setaf 2`
reset=`tput sgr0`

if [[ $(whoami) == "administrator" || $(whoami) == "imlong" ]];
then
    echo "${green}Install GUI application!${reset}"

    echo "${green}Installing gnome  tweak tool!${reset}"
    dpkg -s gnome-tweak-tool &> /dev/null || sudo apt install gnome-tweak-tool -y

    echo "${green}Installing Gufw Firewall!${reset}"
    dpkg -s gufw &> /dev/null || sudo apt install gufw -y

    dpkg -s gdebi-core &> /dev/null || sudo apt install gdebi-core -y

    dpkg -s ubuntu-restricted-extras &> /dev/null || sudo apt-get install -y ubuntu-restricted-extras

    echo "${green}Installing kazam!${reset}"
    dpkg -s kazam &> /dev/null || sudo apt-get install kazam -y

    echo "${green}Install flameshot!${reset}"
    dpkg -s flameshot &> /dev/null || sudo apt-get install -y flameshot

    echo "${green}Installing vlc!${reset}"
    dpkg -s vlc &> /dev/null || sudo apt-get install vlc -y

    echo "${green}Installing skype!${reset}"
    wget https://repo.skype.com/latest/skypeforlinux-64.deb
    sudo dpkg -i skypeforlinux-64.deb
    sudo apt-get install -f

    echo "${green}Installing mailspring!${reset}"
    sudo snap install mailspring

    echo "${green}Installing google chrome!${reset}"
    wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
    sudo gdebi google-chrome-stable_current_amd64.deb

    echo "${green}Installing firefox${reset}"
    dpkg -s firefox &> /dev/null || sudo apt install -y firefox

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

    echo "${green}Installing alacritty!${reset}"
    sudo add-apt-repository ppa:mmstick76/alacritty
    dpkg -s alacritty &> /dev/null || sudo apt install alacritty
else
    echo "${red}Not available GUI!${reset}"
fi
