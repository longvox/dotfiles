tmux has -t default &> /dev/null

if [ $? != 0 ]; then
  tmux -2 new-session -s default -D -d
  tmux -2 new-session -s imlong -D -d
  tmux -2 new-session -s backend -D -d
  tmux -2 new-session -s frontend -D -d
fi



