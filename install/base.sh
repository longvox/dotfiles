sudo apt-get update
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

sudo snap install universal-ctags*.snap --dangerous

# simple terminal UI for git commands
sudo add-apt-repository ppa:lazygit-team/release
sudo apt-get update
sudo apt-get install lazygit

# A simple terminal UI for both docker and docker-compose, written in Go with the gocui library.
curl https://raw.githubusercontent.com/jesseduffield/lazydocker/master/scripts/install_update_linux.sh | bash 

# install ndcu
sudo apt-get install -y ncdu


