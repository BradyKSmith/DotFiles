# nix-darwin blank starter

This repository is a minimal flake-based macOS setup with:

- `nix-darwin` for system configuration
- `home-manager` for user-level packages and shell setup
- `zsh` enabled, but no extra tools or shell customizations yet

It is currently configured for:

- hostname: `Bradys-MacBook-Pro`
- user: `brady`
- architecture: `aarch64-darwin`

## Why `darwin-rebuild` was missing

That command usually is not on your `PATH` until after the first successful `switch`.
For the first activation, run it through `nix run` from this repository.

## First bootstrap

From `/Users/brady/dotfiles`:

```bash
sudo nix --extra-experimental-features 'nix-command flakes' run nix-darwin/nix-darwin-25.11#darwin-rebuild -- switch --flake .#Bradys-MacBook-Pro
```

If your shell still does not see the command afterward, open a new terminal window.

## Daily usage

After the first switch succeeds:

```bash
sudo darwin-rebuild switch --flake ~/dotfiles#Bradys-MacBook-Pro
```

Or use the alias from Home Manager:

```bash
rebuild
```

## What this gives you

- a working flake-based macOS configuration
- `zsh` managed through Nix
- an intentionally blank starting point so you can add tools gradually

## Common next edits

- Add machine-wide packages in `hosts/Bradys-MacBook-Pro/default.nix`
- Add user packages and shell config in `home/brady.nix`

## Useful commands

```bash
nix fmt
nix flake check
```

`nix flake check` will need network access the first time because the inputs must be fetched.
