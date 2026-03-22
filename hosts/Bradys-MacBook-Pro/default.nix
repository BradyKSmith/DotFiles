{ pkgs, system, username, ... }:
{
  nix.enable = false;

  nix.settings = {
    experimental-features = [
      "nix-command"
      "flakes"
    ];
    trusted-users = [ username ];
  };

  nixpkgs.hostPlatform = system;
  nixpkgs.config.allowUnfree = true;

  users.users.${username}.home = "/Users/${username}";

  environment.systemPackages = [ pkgs.zsh ];

  programs.zsh.enable = true;

  system.primaryUser = username;
  system.stateVersion = 6;
}
