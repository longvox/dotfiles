alias reload="source ~/.zshrc"

alias v='NVIM_TUI_ENABLE_TRUE_COLOR=1 nvim'
alias vim='NVIM_TUI_ENABLE_TRUE_COLOR=1 nvim'

alias oops='sudo $(fc -ln -1)'
alias ccode="yarn prettier --write && yarn lint && yarn run typecheck"
alias "typescript-opps"="npx typac ini -i"

alias logstash="sudo /usr/share/logstash/bin/logstash"

alias gut='git'
alias shs='ssh'
alias 'git stauts'='git status'
alias 'git chekcout'='git checkout'

alias tmx="[ -z '${TMUX}' ] && (tmux attach -t default || tmux new -s default) || tmux"
alias xampp="sudo /opt/lampp/lampp"

alias robo3t="~/.robo3t/bin/robo3t"
alias buildOffice="scp -r /home/longvox/Work/office/global-care/gcapp officeGlobalCare:/home/ubuntu/app"

alias ls="colorls --sd -A"

alias sail='[ -f sail ] && sh sail || sh vendor/bin/sail'

# reboot / halt / poweroff
alias reboot='sudo /sbin/reboot'
alias poweroff='sudo /sbin/poweroff'
alias halt='sudo /sbin/halt'
alias shutdown='sudo /sbin/shutdown'

alias root='sudo -i'
alias su='sudo -i'

# install with apt-get
alias apt-get="sudo apt-get"
alias updatey="sudo apt-get --yes"

# update on one command
alias update='sudo apt-get update && sudo apt-get upgrade'

# Stop after sending count ECHO_REQUEST packets #
alias ping='ping -c 5'
# Do not wait interval 1 second, go fast #
alias fastping='ping -c 100 -s.2'

alias aws-local='aws --endpoint-url=http://localhost:4566'

alias docker-compose='docker compose'
