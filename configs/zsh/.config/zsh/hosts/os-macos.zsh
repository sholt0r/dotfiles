if [ -x /opt/homebrew/bin/zsh ]; then
  export SHELL="/opt/homebrew/bin/zsh"
else
  export SHELL="/bin/zsh"
fi

if type brew &>/dev/null; then
  FPATH=$(brew --prefix)/share/zsh-completions:$FPATH
  autoload -Uz compinit
  compinit
fi
