source "$HOME/.dotfiles/lib/utils.sh"

debug "ZSH: Loading functions."

ls()  { eza --icons --group-directories-first "$@"; }
vi()  { nvim "$@"; }
vim() { nvim "$@"; }
z()   { __zoxide_z "$@"; }
zi()  { __zoxide_zi "$@"; }
dc()  { docker compose "$@"; }
