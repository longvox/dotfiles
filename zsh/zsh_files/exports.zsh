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
export PATH="$PATH:/opt/nvim-linux64/bin"
export PATH="$PATH:~/.bun/bin"
export PATH="$HOME/.composer/vendor/bin:$PATH"
export PATH="$HOME/.config/composer/vendor/bin:$PATH"
export OLLAMA_ORIGINS='*'



# bun completions
[ -s "/home/longvh/.bun/_bun" ] && source "/home/longvh/.bun/_bun"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

# pnpm
export PNPM_HOME="/home/longvh/.local/share/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm ed
#
#
export DOCKER_HOST_IP=$(docker network inspect bridge | grep Gateway | grep -o -E '[0-9.]+')

