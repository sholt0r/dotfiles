HISTFILE=~/.local/.zsh_histfile
HISTSIZE=100000
SAVEHIST=100000
setopt autocd
bindkey -v
zstyle :compinstall filename '~/.zshrc'

autoload -Uz compinit
compinit

eval "$(starship init zsh)"

export XDG_CONFIG_HOME=~/.config/
export XDG_DATA_HOME=~/.local/data/

export GIT_CONFIG_GLOBAL=~/.config/git_global_config
export PATH=$PATH:~/.local/bin

alias ls='eza'
