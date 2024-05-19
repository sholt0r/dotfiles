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
export XDG_DATA_HOME=~/.config/nvim-data/
export STARSHIP_CONFIG=~/.config/starship.toml

export GOROOT=/usr/local/bin/go
export PATH=$PATH:/usr/local/bin/go/bin:~/.local/bin

alias ls='ls -la'
