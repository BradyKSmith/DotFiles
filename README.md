# Brady's dotfiles

This repo is a flake-based macOS setup built with:

- `home-manager` for user shell and CLI tooling

It is currently configured for:

- user: `brady`
- architecture: `aarch64-darwin`

## What lives here

- [flake.nix](/Users/brady/dotfiles/flake.nix): top-level flake wiring and inputs
- [home/brady.nix](/Users/brady/dotfiles/home/brady.nix): user packages, Zsh setup, aliases, and tracked config files
- [apps.md](/Users/brady/dotfiles/apps.md): tracked macOS apps and install notes
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
nix --extra-experimental-features 'nix-command flakes' run home-manager/release-25.11 -- switch --flake .#brady
```

After that:

```bash
home-manager switch --flake ~/dotfiles#brady
```

Or just:

```bash
rebuild
```

## macOS apps

Track macOS apps and install notes in [apps.md](/Users/brady/dotfiles/apps.md).

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
