# Core aliases
alias reload="source ~/.zshrc"
alias v='nvim'
alias vim='nvim'

# Git fixes
alias gut='git'
alias 'git stauts'='git status'
alias 'git chekcout'='git checkout'

# System commands
alias reboot='sudo /sbin/reboot'
alias poweroff='sudo /sbin/poweroff'
alias halt='sudo /sbin/halt'
alias shutdown='sudo /sbin/shutdown'
alias root='sudo -i'
alias su='sudo -i'

# Package management
alias apt-get="sudo apt-get"
alias updatey="sudo apt-get --yes"
alias update='sudo apt-get update && sudo apt-get upgrade'

# Development tools
alias tmx="[ -z '${TMUX}' ] && (tmux attach -t default || tmux new -s default) || tmux"
alias sail='[ -f sail ] && sh sail || sh vendor/bin/sail'
alias ccode="yarn prettier --write && yarn lint && yarn run typecheck"
alias "typescript-opps"="npx typac ini -i"

# Docker/AWS
alias docker-compose='docker compose'
alias aws-local='aws --endpoint-url=http://localhost:4566'

# Network tools
alias ping='ping -c 5'
alias fastping='ping -c 100 -s.2'

# Services
alias logstash="sudo /usr/share/logstash/bin/logstash"
alias xampp="sudo /opt/lampp/lampp"
alias robo3t="~/.robo3t/bin/robo3t"

# File operations
alias cp='cp -iv'                           # Confirm copy
alias mv='mv -iv'                           # Confirm move
alias rm='rm -iv'                           # Confirm remove
alias mkdir='mkdir -pv'                     # Create parent dirs
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias tree='eza --tree --icons'            # Tree view (eza is exa fork)
alias size='du -sh'                         # Directory size
alias df='df -h'                            # Human readable sizes

# Development
alias ip='curl ipinfo.io/ip'               # Public IP
alias ports='netstat -tulanp'              # Open ports

# System
alias mem='free -h'                         # Memory usage
alias cpu='htop'                            # CPU usage
alias temp='sensors'                        # System temperature
alias updates='sudo apt update && apt list --upgradable'
alias clean='sudo apt autoremove && sudo apt clean'
alias sysinfo='neofetch'                   # System information
alias speed='speedtest-cli'                # Internet speed test

# Productivity
alias weather='curl wttr.in'               # Weather info
alias calc='bc -l'                         # Calculator
alias calendar='cal -3'                    # 3-month calendar
alias timer='termdown'                     # Countdown timer

