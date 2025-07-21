ZSH_PLUGINS=(
  git
  zoxide
  autosuggestions
  syntax
	completions
  fzf
  starship
	ssh-agent
	pyenv
)

pbcopy() {wl-copy}
hiber() { systemctl suspend; hyprctl dispatch exec hyprlock }
