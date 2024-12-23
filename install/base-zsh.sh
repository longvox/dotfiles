#!/usr/bin/env bash
PATH_CURRENT=$(dirname "$(readlink -f "$BASH_SOURCE")")
source $PATH_CURRENT/utils/log.sh
source $PATH_CURRENT/utils/install.sh

tryInstall install zsh

# autojump - a faster way to navigate your filesystem
# BASEDIR=$(dirname "$0")
# if [ ! -d "/home/$USER/.autojump" ];
# then
#    log "Installing autojump!"
#    git clone git://github.com/wting/autojump.git
#    cd "/home/$USER/.autojump"
#    ./install.py
#    cd $BASEDIR
# else
#    silly "Installed autojump!"
# fi

if [ ! -d ~/.oh-my-zsh ];
then
   info "Installing oh-my-zsh!"
   sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
else
   silly "Installed oh my zsh!}"
fi
ZSH_CUSTOM="$HOME/.oh-my-zsh/custom"
if [ -d ${ZSH_CUSTOM}/plugins/zsh-syntax-highlighting ];
then
   silly "Installed zsh syntax highlighting!"
else
   info "Installing zsh syntax highlighting!"
   git clone https://github.com/zsh-users/zsh-syntax-highlighting.git \
      ${ZSH_CUSTOM}/plugins/zsh-syntax-highlighting
fi

if [ -d ${ZSH_CUSTOM}/plugins/zsh-autosuggestions ];
then
   silly "Installed zsh autosuggestions"
else
   info "Installing zsh autosuggestions!"
   git clone https://github.com/zsh-users/zsh-autosuggestions \
      ${ZSH_CUSTOM}/plugins/zsh-autosuggestions
fi

if [ -d ${ZSH_CUSTOM}/plugins/zsh-history-substring-search ];
then
   silly "Installed zsh history substring search!"
else
   info "Installing zsh history substring search!"
   git clone https://github.com/zsh-users/zsh-history-substring-search \
      ${ZSH_CUSTOM}/plugins/zsh-history-substring-search
fi


if [ -d ${ZSH_CUSTOM}/plugins/zsh-completions ];
then
   silly "Installed zsh completions!"
else
   info "Installing zsh completions!"
   git clone https://github.com/zsh-users/zsh-completions \
      ${ZSH_CUSTOM}/plugins/zsh-completions
fi

if [ -d ${ZSH_CUSTOM}/plugins/zsh-nvm ];
then
   silly "Installed zsh nvm!"
else
   info "Installing zsh nvm!"
   git clone https://github.com/lukechilds/zsh-nvm \
      ${ZSH_CUSTOM}/plugins/zsh-nvm
fi

if [ -d ${ZSH_CUSTOM}/plugins/zsh-vi-mode ];
then
   silly "Installed zsh vi mode!"
else
   info "Installing zsh vi mode!"
   git clone https://github.com/jeffreytse/zsh-vi-mode \
      ${ZSH_CUSTOM}/plugins/zsh-vi-mode
fi

if [ -d ${ZSH_CUSTOM}/plugins/zsh-ssh ];
then
   silly "Installed zsh ssh!"
else
   info "Installing zsh ssh!"
   git clone https://github.com/sunlei/zsh-ssh \
      ${ZSH_CUSTOM}/plugins/zsh-ssh
fi

if [ -d ${ZSH_CUSTOM}/plugins/nx-completion ];
then
   silly "Installed zsh nx-completion!"
else
   info "Installing zsh nx-completion!"
   git clone git@github.com:jscutlery/nx-completion.git \
      ${ZSH_CUSTOM}/plugins/nx-completion
fi

if [[ -d ${ZSH_CUSTOM}/themes/spaceship-prompt || -d ${ZSH_CUSTOM}/themes/spaceship.zsh-theme ]];
then
   silly "Installed spaceship zsh!"
else
   info "Installing spaceship zsh!"
   git clone https://github.com/denysdovhan/spaceship-prompt.git \
      "$ZSH_CUSTOM/themes/spaceship-prompt"
   ln -s "$ZSH_CUSTOM/themes/spaceship-prompt/spaceship.zsh-theme" "$ZSH_CUSTOM/themes/spaceship.zsh-theme"
fi

if [[ -d ~/.fzf ]];
then
   silly "Installed fzf zsh!"
else
   info "Installing fzf zsh!"
   git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
    ~/.fzf/install
fi

tryInstall install ruby`ruby -e 'puts RUBY_VERSION[/\d+\.\d+/]'`-dev
tryInstall installGem colorls
