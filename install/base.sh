red=`tput setaf 1`
green=`tput setaf 2`
reset=`tput sgr0`

echo "${green}Update and Upgrade!${reset}"

sudo apt update
sudo apt upgrade
sudo apt dist-upgrade

echo "${green}Installing base app!${reset}"
sudo apt install \
   software-properties-common \
   apt-transport-https \
   ca-certificates \
   gnupg-agent \
   build-essential \
   libssl-dev \
   libffi-dev \
   libxml2-dev \
   libxslt1-dev \
   zlib1g-dev \
   curl \
   wget \
   git \
   ruby \
   htop

echo "${green}Installing python pip!${reset}"
sudo apt install \
   python-dev \
   python3-dev \
   python3-pip

echo "${green}Install docker!${reset}"
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo apt-key fingerprint 0EBFCD88

sudo add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
   $(lsb_release -cs) \
   stable"

sudo apt-get install docker-ce docker-ce-cli containerd.io

sudo docker run hello-world

echo "${green}Done install docker!${reset}"

echo "${green}Installing node, npm, nvm, yarn!${reset}"
sudo apt install nodejs
sudo apt install npm

curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add -
echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list

sudo apt update && sudo apt install yarn

curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.35.3/install.sh | bash

echo "${green}Done install node, npm, nvm, yarn!${reset}"

echo "${green}Installing vim!${reset}"
sudo add-apt-repository ppa:jonathonf/vim
sudo apt install vim

echo "${green}Installing neovim!${reset}"
curl -LO https://github.com/neovim/neovim/releases/download/stable/nvim.appimage
chmod u+x nvim.appimage
./nvim.appimage
