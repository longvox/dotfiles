# User configuration
# export MANPATH="/usr/local/man:$MANPATH"
export LANG=en_US.UTF-8

export ZSH="/home/$(whoami)/.oh-my-zsh"

export PATH=$HOME/bin:/usr/local/bin:$PATH

export PATH=$PATH:/usr/local/ruby/bin

export PATH="$PATH:/opt/scripts/killport"

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/home/$(whoami)/anaconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/home/$(whoami)/anaconda3/etc/profile.d/conda.sh" ]; then
        . "/home/$(whoami)/anaconda3/etc/profile.d/conda.sh"
    else
        export PATH="/home/$(whoami)/anaconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

# source $(dirname $(gem which colorls))/tab_complete.sh
export JAVA_HOME=$(dirname $(dirname $(readlink -f  /usr/bin/java)))

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="~/.sdkman"
[[ -s "~/.sdkman/bin/sdkman-init.sh" ]] && source "~/.sdkman/bin/sdkman-init.sh"

[[ -s "~/.autojump/etc/profile.d/autojump.sh" ]] && source "~/.autojump/etc/profile.d/autojump.sh"

autoload -U compinit && compinit -u

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/home/imlong/google-cloud-sdk/path.zsh.inc' ]; then
  . '/home/imlong/google-cloud-sdk/path.zsh.inc';
fi

# The next line enables shell command completion for gcloud.
if [ -f '/home/imlong/google-cloud-sdk/completion.zsh.inc' ]; then
  . '/home/imlong/google-cloud-sdk/completion.zsh.inc';
fi

#determines search program for fzf
if type ag &> /dev/null; then
    export FZF_DEFAULT_COMMAND='ag -p ~/.gitignore -g ""'
fi
#refer rg over ag
if type rg &> /dev/null; then
    export FZF_DEFAULT_COMMAND='rg --files --hidden'
fi

