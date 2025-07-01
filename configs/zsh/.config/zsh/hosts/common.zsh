ZSH_PLUGINS=(
  git
  zoxide
  autosuggestions
  syntax
  fzf
  starship
)

export EDITOR=nvim

bindkey -v

# TMUX Sessionizer
bindkey -s ^f "tmux-sessionizer\n"
bindkey -s '\eh' "tmux-sessionizer -s 0\n"
bindkey -s '\ej' "tmux-sessionizer -s 1\n"
bindkey -s '\ek' "tmux-sessionizer -s 2\n"
bindkey -s '\el' "tmux-sessionizer -s 3\n"
