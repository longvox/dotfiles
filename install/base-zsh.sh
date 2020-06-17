# autojump - a faster way to navigate your filesystem
BASEDIR=$(dirname "$0")

echo "Installing autojump!"
git clone git://github.com/wting/autojump.git
cd autojump
./install.py

cd $BASEDIR

echo "Installing oh-my-zsh!"
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

ZSH_CUSTOM="~/.oh-my-zsh/custom"

if [ -d ${ZSH_CUSTOM}/plugins/zsh-syntax-highlighting ];
then
    echo "Installed zsh syntax highlighting!"
else
    echo "Installing zsh syntax highlighting!"
    git clone https://github.com/zsh-users/zsh-syntax-highlighting.git \
        ${ZSH_CUSTOM}/plugins/zsh-syntax-highlighting
fi

if [ -d ${ZSH_CUSTOM}/plugins/zsh-autosuggestions ];
then
    echo "Installed zsh autosuggestions"
else
    echo "Installing zsh autosuggestions!"
    git clone https://github.com/zsh-users/zsh-autosuggestions \
        ${ZSH_CUSTOM}/plugins/zsh-autosuggestions
fi

if [ -d ${ZSH_CUSTOM}/plugins/zsh-history-substring-search ];
then
   echo "Installed zsh history substring search!" 
else
    echo "Installing zsh history substring search!"
    git clone https://github.com/zsh-users/zsh-history-substring-search \
        ${ZSH_CUSTOM}/plugins/zsh-history-substring-search
fi


if [ -d ${ZSH_CUSTOM}/plugins/zsh-completions ];
then
   echo "Installed zsh completions!" 
else
    echo "Installing zsh completions!"
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
