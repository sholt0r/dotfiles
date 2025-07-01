source "$HOME/.dotfiles/lib/utils.sh"

debug "ZSH: Loading functions."

ls()  { eza --icons --group-directories-first "$@"; }
vi()  { nvim "$@"; }
vim() { nvim "$@"; }
z()   { __zoxide_z "$@"; }
zi()  { __zoxide_zi "$@"; }
dc()  { docker compose "$@"; }
[[ -x wl-copy ]] && pbcopy() {wl-copy}
[[ -x hyprctl ]] && hiber() { systemctl suspend; hyprctl dispatch exec hyprlock }
