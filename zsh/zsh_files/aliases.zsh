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



