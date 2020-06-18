# colors output
red=`tput setaf 1`
green=`tput setaf 2`
reset=`tput sgr0`

# add  apt-repository 
# lazygit
echo "${green}Add apt-repository!!!!${reset}"

# sudo add-apt-repository ppa:lazygit-team/release
sudo apt-get update

echo "${green}[Done] Add apt-repository${reset}" 
# ################################## 
sudo apt-get install curl wget
sudo apt-get install ranger caca-utils highlight atool w3m poppler-utils mediainfo

# Überzug is a command line util which allows to draw images on terminals by using child windows.
sudo pip3 install ueberzug

# ripgrep is a line-oriented search tool that recursively searches your current directory for a regex pattern.
sudo apt-get install ripgrep

# A code searching tool similar to ack, with a focus on speed.
sudo apt-get install silversearcher-ag

# A simple, fast and user-friendly alternative to 'find' 
sudo apt install fd-find

# install ndcu
sudo apt-get install -y ncdu

# lazygit: simple terminal UI for git commands
sudo apt-get install lazygit

# lazydocker: The lazier way to manage everything docker 
curl https://raw.githubusercontent.com/jesseduffield/lazydocker/master/scripts/install_update_linux.sh | bash
