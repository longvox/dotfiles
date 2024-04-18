export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
export GOPATH=$HOME/go
export GOROOT=$HOME/go
export GOBIN=$GOPATH/go
export PATH=$PATH:/usr/local/go/bin:$GOPATH/bin
export PATH="$HOME/.cargo/bin:$PATH"

export PATH=~/.npm-global/bin:$PATH

# >>> juliaup initialize >>>

# !! Contents within this block are managed by juliaup !!

path=('/home/longvh/.juliaup/bin' $path)
export PATH

# <<< juliaup initialize <<<

PATH="$PATH:/usr/local/bin/java/bin"

JAVA_HOME="/usr/lib/jvm/default-java"

export $(xargs < ~/.dotfiles/.env)
