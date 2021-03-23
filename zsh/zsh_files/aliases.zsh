alias reload="source ~/.zshrc"

alias build7k='ssh office7k "~/pull-7000.sh"'
alias build8k='ssh office "~/pull-8000.sh"'
alias build9k='ssh office "~/pull-9000.sh"'

alias v='NVIM_TUI_ENABLE_TRUE_COLOR=1 nvim'
alias vim='NVIM_TUI_ENABLE_TRUE_COLOR=1 nvim'
alias vimsv="vim scp://root@office:22//root/"
alias vimsvbs="vim scp://root@office:22//root/backend-search/"

alias oops='sudo $(fc -ln -1)'
alias ccode="yarn prettier --write && yarn lint && yarn run typecheck"
alias "typescript-opps"="npx typac ini -i"

alias logstash="sudo /usr/share/logstash/bin/logstash"

alias gut='git'
alias shs='ssh'
alias 'git stauts'='git status'
alias 'git chekcout'='git checkout'

alias evrasa="conda activate rasa"

alias tmx="[ -z '${TMUX}' ] && (tmux attach -t default || tmux new -s default) || tmux"
alias tmximlong="tmux attach -t imlong -d"
alias tmxbackend="tmux attach -t backend -d"
alias tmxvibot="tmux attach -t vibot -d"
alias tmxenbot="tmux attach -t enbot -d"
alias tmxnovo="tmux attach -t novo -d"
alias tmxelastic="tmux attach -t elactic -d"

alias ngrok="~/.ngrok"
alias robo3t="~/.robo3t/bin/robo3t"

alias ls="colorls --sd -A"

zle -N fancy-ctrl-z
bindkey '^Z' fancy-ctrl-z

