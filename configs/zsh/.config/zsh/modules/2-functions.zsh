source "$HOME/.dotfiles/lib/utils.sh"

debug "ZSH: Loading functions."

ls()  { eza --icons --group-directories-first -l "$@"; }
vi()  { nvim "$@"; }
vim() { nvim "$@"; }
z()   { __zoxide_z "$@"; }
zi()  { __zoxide_zi "$@"; }
dc()  { docker compose "$@"; }
tfrvm()	{ terraform state rm proxmox_vm_qemu.vm\[\"$@\"\]; }
tfrci()	{ terraform state rm null_resource.cloud-init\[\"$@\"\]; }
