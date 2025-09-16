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
hiber() { hyprctl dispatch exec hyprlock & sleep 1s && systemctl suspend }
sd() {ssh dauntless}

source /usr/share/nvm/init-nvm.sh
