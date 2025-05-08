# My Dotfiles

These dotfiles are for my personal setup. This is just a reference for myself when setting up a new machine.

## Structure

- `bootstrap` – main install and setup logic
- `bootstraps/` – OS or environment-specific setup scripts
- `configs/` – actual config files (zsh, neovim, etc.)
- `lib/` – utility functions shared between bootstrap scripts

## Install

```bash
git clone https://github.com/sholt0r/dotfiles.git ~/.dotfiles
cd ~/.dotfiles
./bootstrap/install.sh
```

## Notes

- Scripts are idempotent, so re-running should be safe.
- Host- and OS-specific overrides live in `bootstraps/`.
- `.zshrc` loads shared modules depending on env vars.
- Everything is symlinked into place.

## Debugging

Set `BOOTSTRAP_DEBUG=true` before running install for verbose output:

```bash
BOOTSTRAP_DEBUG=true ./bootstrap/install.sh
```

## Don't forget

- Git config is local-only; user/email must be set manually
- SSH and GPG keys are not stored here
- Bootstrap may not work perfectly every time
- Create a host specific config as required
