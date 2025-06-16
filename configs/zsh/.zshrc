# Config debug messaging
export DEBUG=false

# Load shared env vars and flags
[[ -f "$HOME/.config/zsh/env.zsh" ]] && source "$HOME/.config/zsh/env.zsh"
[[ -f "$HOME/.secret.zsh" ]] && source "$HOME/.secret.zsh"

# Load default OS config
OS_TYPE="$(uname -s | tr '[:upper:]' '[:lower:]')" 
case "$OS_TYPE" in
  darwin) source ~/.config/zsh/hosts/os-macos.zsh ;;
  linux)  source ~/.config/zsh/hosts/os-linux.zsh ;;
esac

# Load common config
source "$HOME/.config/zsh/hosts/common.zsh"

# Load host-specific config
HOST="$(hostname -s)"
HOST_CONFIG="$HOME/.config/zsh/hosts/${HOST}.zsh"
[[ -f "$HOST_CONFIG" ]] && source "$HOST_CONFIG"

# Load all enabled modules
for f in "$HOME/.config/zsh/modules/"[0-9]*.zsh(N); do
  source "$f"
done

# Debug Info
[[ "$DEBUG" == true ]] && {
  echo "[DEBUG] Host: $HOST"
  echo "[DEBUG] OS: $OS_TYPE"
  echo "[DEBUG] Plugins: ${ZSH_PLUGINS[*]}"
  type znap &>/dev/null && znap list
}

PATH=~/.console-ninja/.bin:$PATH

eval "$(pyenv init - zsh)"
eval "$(pyenv virtualenv-init -)"
