# Setup fzf
# ---------
if [[ ! "$PATH" == *"${HOME}/.dotfiles/dot/.fzf/bin"* ]]; then
  PATH="${PATH:+${PATH}:}${HOME}/.dotfiles/dot/.fzf/bin"
fi
