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

  homebrew = {
    enable = true;
    # Keep taps/casks documented here so a future fresh Mac can be restored
    # declaratively, but avoid adopting or conflicting with apps that are
    # already installed manually on this machine.
    taps = [
      "nikitabobko/tap"
      # "netbirdio/tap"
    ];
    onActivation = {
      autoUpdate = true;
      cleanup = "zap";
      upgrade = true;
    };
    casks = [
      # Re-enable these on a fresh Mac, or after you intentionally migrate the
      # app to Homebrew ownership:
      "nikitabobko/tap/aerospace"
      # "ghostty"
      # "chatgpt"
      # "docker-desktop"
      # "insomnia"
      # "netbirdio/tap/netbird-ui"
      # "windows-app"
      #
      "maccy"
    ];
  };

  system.primaryUser = username;
  system.stateVersion = 6;
}
