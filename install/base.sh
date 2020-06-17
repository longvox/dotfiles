echo "Update and Upgrade!"

sudo apt update
sudo apt upgrade
sudo apt dist-upgrade

echo "Installing base app!"
sudo apt install \
    software-properties-common \
    apt-transport-https \
    apt-transport-https \
    ca-certificates \
    gnupg-agent \
    curl \
    wget \
    git

echo "Installing python pip!"
sudo apt install python3-pip

echo "Install docker!"
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo apt-key fingerprint 0EBFCD88

sudo add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
   $(lsb_release -cs) \
   stable"

sudo apt-get install docker-ce docker-ce-cli containerd.io

sudo docker run hello-world

echo "Done install docker!"

echo "Installing node, npm, nvm, yarn!"
sudo apt install nodejs
sudo apt install npm

curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add -
echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list

sudo apt update && sudo apt install yarn

curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.35.3/install.sh | bash

echo "Done install node, npm, nvm, yarn!"

