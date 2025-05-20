export XDG_CONFIG_HOME="$HOME/.config"
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_DATA_HOME="$HOME/.local/share"
export GIT_CONFIG_GLOBAL="$XDG_CONFIG_HOME/git/config"

# Homdir
[[ -d "$HOME/.local/bin" ]] && PATH="$HOME/.local/bin:$PATH"
[[ -d "$HOME/.cargo/bin" ]] && PATH="$HOME/.cargo/bin:$PATH"
[[ -d "$HOME/.var/app" ]] && PATH="$HOME/.var/app:$PATH"
[[ -d "$HOME/.local/share/nvim/mason/bin" ]] && PATH="$HOME/.local/share/nvim/mason/bin:$PATH"
[[ -d "$HOME/go/bin" ]] && PATH="$HOME/go/bin:$PATH"
[[ -d "$HOME/.rustup/toolchains/stable-aarch64-apple-darwin/bin" ]] && PATH="$HOME/.rustup/toolchains/stable-aarch64-apple-darwin/bin:$PATH"

# Homebrew
[[ -d "/opt/homebrew/Caskroom/miniconda/base/bin" ]] && PATH="/opt/homebrew/Caskroom/miniconda/base/bin:$PATH"
[[ -d "/opt/homebrew/Caskroom/miniconda/base/condabin" ]] && PATH="/opt/homebrew/Caskroom/miniconda/base/condabin:$PATH"
[[ -d "/opt/homebrew/bin" ]] && PATH="/opt/homebrew/bin:$PATH"

# Other
[[ -d "/var/lib/flatpak/app" ]] && PATH="/var/lib/flatpak/app:$PATH"
[[ -d "/var/lib/snapd/snap/bin" ]] && PATH="/var/lib/snapd/snap/bin:$PATH"
[[ -d "/usr/local/bin" ]] && PATH="/usr/local/bin:$PATH"
[[ -d "/usr/bin" ]] && PATH="/usr/bin:$PATH"
[[ -d "/bin" ]] && PATH="/bin:$PATH"
[[ -d "/usr/sbin" ]] && PATH="/usr/sbin:$PATH"
[[ -d "/sbin" ]] && PATH="/sbin:$PATH"
