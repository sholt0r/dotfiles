export XDG_CACHE_HOME="$HOME/.cache"
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"

export GPG_TPM2_PKCS11_MODULE="$(p11-kit list-modules 2>/dev/null | grep -A1 'module: tpm2_pkcs11' | tail -n1 | sed 's/.*path: //g')"

# Export
[[ -d "/etc/ssl" ]] && export OPENSSL_DIR="/etc/ssl"
[[ -d "$HOME/.pyenv" ]] && export PYENV_ROOT="$HOME/.pyenv"
[[ -d "$XDG_CONFIG_HOME/git" ]] && export GIT_CONFIG_GLOBAL="$XDG_CONFIG_HOME/git/config"
[[ -d "$XDG_CONFIG_HOME/systemd/user/ssh-agent.service" ]] && export SSH_AUTH_SOCK="$XDG_RUNTIME_DIR/ssh-agent.socket"

# Path
## Homedir
[[ -d "$HOME/go/bin" ]] && PATH="$HOME/go/bin:$PATH"
[[ -d "$HOME/.var/app" ]] && PATH="$HOME/.var/app:$PATH"
[[ -d "$PYENV_ROOT/bin" ]] && PATH="$PYENV_ROOT/bin:$PATH"
[[ -d "$HOME/.cargo/bin" ]] && PATH="$HOME/.cargo/bin:$PATH"
[[ -d "$HOME/.local/bin" ]] && PATH="$HOME/.local/bin:$PATH"
[[ -d "$HOME/.local/scripts" ]] && PATH="$HOME/.local/scripts:$PATH"
[[ -d "$HOME/.local/share/nvim/mason/bin" ]] && PATH="$HOME/.local/share/nvim/mason/bin:$PATH"
[[ -d "$HOME/.rustup/toolchains/stable-aarch64-apple-darwin/bin" ]] && PATH="$HOME/.rustup/toolchains/stable-aarch64-apple-darwin/bin:$PATH"
[[ -d "$HOME/.pyenv/versions/3.13.3/bin/" ]] && PATH="$HOME/.pyenv/versions/3.13.3/bin/:$PATH"

## Homebrew
[[ -d "/opt/homebrew/bin" ]] && PATH="/opt/homebrew/bin:$PATH"
[[ -d "/home/linuxbrew/.linuxbrew/bin" ]] && PATH="/home/linuxbrew/.linuxbrew/bin:$PATH"
[[ -d "/opt/homebrew/Caskroom/miniconda/base/bin" ]] && PATH="/opt/homebrew/Caskroom/miniconda/base/bin:$PATH"
[[ -d "/opt/homebrew/Caskroom/miniconda/base/condabin" ]] && PATH="/opt/homebrew/Caskroom/miniconda/base/condabin:$PATH"

## Other
[[ -d "/bin" ]] && PATH="/bin:$PATH"
[[ -d "/sbin" ]] && PATH="/sbin:$PATH"
[[ -d "/usr/bin" ]] && PATH="/usr/bin:$PATH"
[[ -d "/usr/sbin" ]] && PATH="/usr/sbin:$PATH"
[[ -d "/usr/local/bin" ]] && PATH="/usr/local/bin:$PATH"
[[ -d "/var/lib/flatpak/app" ]] && PATH="/var/lib/flatpak/app:$PATH"
[[ -d "/var/lib/snapd/snap/bin" ]] && PATH="/var/lib/snapd/snap/bin:$PATH"
