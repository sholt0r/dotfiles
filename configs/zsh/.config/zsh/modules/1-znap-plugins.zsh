ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=242'

plugin_enabled() {
  [[ " ${ZSH_PLUGINS[@]} " == *" $1 "* ]]
}

plugin_enabled zoxide           && znap eval zoxide 'zoxide init zsh --cmd cd'
plugin_enabled autosuggestions  && znap source zsh-users/zsh-autosuggestions
plugin_enabled syntax           && znap source zsh-users/zsh-syntax-highlighting
plugin_enabled completions			&& znap source zsh-users/zsh-completions
plugin_enabled fzf              && znap eval fzf 'fzf --ssh'
plugin_enabled starship         && znap eval starship 'starship init zsh --print-full-init'
plugin_enabled pyenv 						&& if [ -d ~/.pyenv ]; then eval "$(pyenv init - zsh)"; else; curl -fsSL https://pyenv.run | bash; fi
plugin_enabled pyenv 						&& eval "$(pyenv virtualenv-init -)"
