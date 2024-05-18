HISTFILE=~/.histfile
HISTSIZE=100000
SAVEHIST=100000
setopt autocd
bindkey -v
zstyle :compinstall filename '~/.zshrc'

autoload -Uz compinit
compinit

eval "$(starship init zsh)"

export BROWSER=wslview
export XDG_CONFIG_HOME=~/.config/
export STARSHIP_CONFIG=~/.config/starship.toml
