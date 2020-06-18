red=`tput setaf 1`
green=`tput setaf 2`
reset=`tput sgr0`

# autojump - a faster way to navigate your filesystem
BASEDIR=$(dirname "$0")
if [ ! -d "${BASEDIR}/autojump" ];
then
   echo "Installing autojump!"
   git clone git://github.com/wting/autojump.git
   cd autojump
   ./install.py
   cd $BASEDIR
else
   echo "${green}Installed autojump!${reset}"
fi

if [ ! -d ~/.oh-my-zsh ];
then
   echo "${green}Installing oh-my-zsh!${reset}"
   sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
else
   echo "${red}Installed oh my zsh!${reset}"
fi   

ZSH_CUSTOM="$HOME/.oh-my-zsh/custom"

if [ -d ${ZSH_CUSTOM}/plugins/zsh-syntax-highlighting ];
then
   echo "${red}Installed zsh syntax highlighting!${reset}"
else
   echo "${greeen}Installing zsh syntax highlighting!${reset}"
   git clone https://github.com/zsh-users/zsh-syntax-highlighting.git \
      ${ZSH_CUSTOM}/plugins/zsh-syntax-highlighting
fi

if [ -d ${ZSH_CUSTOM}/plugins/zsh-autosuggestions ];
then
   echo "${red}Installed zsh autosuggestions${reset}"
else
   echo "${green}Installing zsh autosuggestions!${reset}"
   git clone https://github.com/zsh-users/zsh-autosuggestions \
      ${ZSH_CUSTOM}/plugins/zsh-autosuggestions
fi

if [ -d ${ZSH_CUSTOM}/plugins/zsh-history-substring-search ];
then
   echo "${red}Installed zsh history substring search!${reset}" 
else
   echo "${green}Installing zsh history substring search!${reset}"
   git clone https://github.com/zsh-users/zsh-history-substring-search \
        ${ZSH_CUSTOM}/plugins/zsh-history-substring-search
fi


if [ -d ${ZSH_CUSTOM}/plugins/zsh-completions ];
then
   echo "${red}Installed zsh completions!${reset}" 
else
    echo "${green}Installing zsh completions!${reset}"
    git clone https://github.com/zsh-users/zsh-completions \
        ${ZSH_CUSTOM}/plugins/zsh-completions
fi

# echo "Installing ruby!"
# sudo apt-get install ruby`ruby -e 'puts RUBY_VERSION[/\d+\.\d+/]'`-dev

# echo "Installing rubygems-update"
# gem install rubygems-update

# echo "Run update rubygems"
# update_rubygems

# echo "Update gem system"
# gem update --system

# echo "Installing colorls!"
# gem install colorls
