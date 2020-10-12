# colors output
red=`tput setaf 1`
green=`tput setaf 2`
reset=`tput sgr0`

set -eE

# add  apt-repository
# lazygit
echo "${green}Add apt-repository!!!!${reset}"

sudo add-apt-repository ppa:lazygit-team/release -y
sudo apt-get update -y

echo "${green}[Done] Add apt-repository${reset}"
# ##################################
sudo apt-get install curl wget -y
sudo apt-get install -y \
    ranger \
    caca-utils \
    highlight \
    atool \
    w3m \
    poppler-utils \
    mediainfo

# Überzug is a command line util which allows to draw images on terminals by using child windows.
sudo pip3 install ueberzug
sudo pip3 install neovim-remote
sudo pip3 install ueberzug

# ripgrep is a line-oriented search tool that recursively searches your current directory for a regex pattern.
{
    sudo apt install -y ripgrep
} || {
    echo "${red}Install rigrep error failed!${reset}"
}

# A code searching tool similar to ack, with a focus on speed
{
    sudo apt install -y silversearcher-ag
} || {
    echo "${red}Intall siliversearcher-ag failed!${reset}"
}

# A simple, fast and user-friendly alternative to 'find'
{
    sudo apt install -y fd-find
} || {
    echo "${red}Install fd-find failed!${reset}"
}

# install ndcu
{
    sudo apt install -y ncdu
} || {
    echo "${red}Install ncdu failed!${reset}"
}

# lazygit: simple terminal UI for git commands
{
    sudo apt install -y lazygit
} || {
    echo "${red}Install lazagit failed!${reset}"
}
# lazydocker: The lazier way to manage everything docker
curl https://raw.githubusercontent.com/jesseduffield/lazydocker/master/scripts/install_update_linux.sh | bash
