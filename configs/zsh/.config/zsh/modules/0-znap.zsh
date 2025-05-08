source "$HOME/.dotfiles/lib/utils.sh"

export ZNAP_DIR="$XDG_DATA_HOME/znap"

if [[ ! -f "$ZNAP_DIR/znap.zsh" ]]; then
  git clone --depth 1 https://github.com/marlonrichert/zsh-snap "$ZNAP_DIR"
fi

source "$ZNAP_DIR/znap.zsh"

debug "ZSH: Loaded znap"
