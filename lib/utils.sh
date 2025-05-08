#!/usr/bin/env zsh

OSTYPE="$(uname -s | tr '[:upper:]' '[:lower:]')" 

detect_package_manager() {
  if [[ "$OSTYPE" == "darwin"* ]]; then
    echo "brew"
  elif command -v apt >/dev/null 2>&1; then
    echo "apt"
  elif command -v dnf >/dev/null 2>&1; then
    echo "dnf"
  elif command -v pacman >/dev/null 2>&1; then
    echo "pacman"
  elif command -v zypper >/dev/null 2>&1; then
    echo "zypper"
  else
    echo "unknown"
  fi
}

maybe_run() {
  if [[ "$DRY_RUN" == "true" ]]; then
    echo "[Dry Run] Would run: $*"
  else
    eval "$@"
  fi
}

install() {
  PKG_MANAGER=$(detect_package_manager)
  case "$PKG_MANAGER" in
    brew)   maybe_run brew install "$@" ;;
    apt)    maybe_run sudo apt install -y "$@" ;;
    dnf)    maybe_run sudo dnf install -y "$@" ;;
    pacman) maybe_run sudo pacman -S --noconfirm "$@" ;;
    zypper) maybe_run sudo zypper install -y  "$@" ;;
    *)
      echo "No supported installer found."
      exit 1
      ;;
  esac
}

debug() {
  [[ "$DEBUG" == true ]] && echo -e "\033[36m[DEBUG]\033[0m $*"
}
