# Brady's dotfiles

This repo is a flake-based macOS setup built with:

- `nix-darwin` for system configuration
- `home-manager` for user shell and CLI tooling
- Homebrew integration for macOS apps that make sense to manage at the system layer

It is currently configured for:

- hostname: `Bradys-MacBook-Pro`
- user: `brady`
- architecture: `aarch64-darwin`

## What lives here

- [flake.nix](/Users/brady/dotfiles/flake.nix): top-level flake wiring and inputs
- [hosts/Bradys-MacBook-Pro/default.nix](/Users/brady/dotfiles/hosts/Bradys-MacBook-Pro/default.nix): macOS host config, including Homebrew casks
- [home/brady.nix](/Users/brady/dotfiles/home/brady.nix): user packages, Zsh setup, aliases, and tracked config files
- [starship.toml](/Users/brady/dotfiles/starship.toml): Starship prompt config
- [tmux.conf](/Users/brady/dotfiles/tmux.conf): tmux config
- [aerospace.toml](/Users/brady/dotfiles/aerospace.toml): AeroSpace config
- [television/config.toml](/Users/brady/dotfiles/television/config.toml): Television config
- [television/cable/editor-files.toml](/Users/brady/dotfiles/television/cable/editor-files.toml): Television file-search channel
- [television/cable/editor-dirs.toml](/Users/brady/dotfiles/television/cable/editor-dirs.toml): Television directory-search channel

## Current setup

This repo currently manages:

- Zsh with Starship prompt
- syntax highlighting
- `zoxide` for smarter `cd`
- Neovim with `vim` alias
- CLI tools like `git`, `azure-cli`, `eza`, `fd`, `bat`, `television`, `tmux`, `htop`, `wget`, `gawk`, `opencode`
- Nix-installed `python311` and `nodejs_24`
- optional version-manager tools like `pyenv`
- tracked configs for Starship, tmux, AeroSpace, and Television

## Bootstrap

On a fresh Mac, the first activation is:

```bash
sudo nix --extra-experimental-features 'nix-command flakes' run nix-darwin/nix-darwin-25.11#darwin-rebuild -- switch --flake .#Bradys-MacBook-Pro
```

After that:

```bash
sudo darwin-rebuild switch --flake ~/dotfiles#Bradys-MacBook-Pro
```

Or just:

```bash
rebuild
```

## Homebrew apps

Homebrew app management is configured in [hosts/Bradys-MacBook-Pro/default.nix](/Users/brady/dotfiles/hosts/Bradys-MacBook-Pro/default.nix).

Right now:

- `maccy` is actively managed
- several GUI apps are documented but commented out so they can be re-enabled later on a fresh Mac or after an intentional migration to Homebrew ownership

This is deliberate. On an existing machine, Homebrew may not recognize manually installed apps as cask-owned, which can lead to reinstall/conflict behavior during rebuilds.

## Useful commands

```bash
nix flake check
nix fmt
git status --short
```

## Notes for future me

- If a GUI app already exists in `/Applications`, check whether Homebrew recognizes it before uncommenting its cask.
- If publishing this repo publicly, review machine-specific paths and identifiers first.
- Keep tracked config files in this repo when possible so a fresh machine can be recreated with fewer manual steps.
