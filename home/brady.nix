{ pkgs, username, ... }:
{
  home.username = username;
  home.homeDirectory = "/Users/${username}";
  home.stateVersion = "25.11";

  home.packages = with pkgs; [
    azure-cli
    bat
    coreutils
    eza
    fd
    gawk
    git
    htop
    nodejs_24
    pyenv
    python311
    starship
    television
    tmux
    wget
    zoxide
  ];

  xdg.configFile."starship.toml".source = ../starship.toml;
  xdg.configFile."television/config.toml".source = ../television/config.toml;
  xdg.configFile."television/cable/editor-files.toml".source = ../television/cable/editor-files.toml;
  xdg.configFile."television/cable/editor-dirs.toml".source = ../television/cable/editor-dirs.toml;
  home.file.".tmux.conf".source = ../tmux.conf;

  programs.home-manager.enable = true;

  programs.neovim = {
    enable = true;
    vimAlias = true;
  };

  programs.zsh = {
    enable = true;
    syntaxHighlighting.enable = true;
    initContent = ''
      eval "$(${pkgs.starship}/bin/starship init zsh)"
      eval "$(${pkgs.zoxide}/bin/zoxide init zsh)"

      export EDITOR_LAUNCHER="''${EDITOR_LAUNCHER:-cursor}"

      _editor_open() {
        if command -v "$EDITOR_LAUNCHER" >/dev/null 2>&1; then
          "$EDITOR_LAUNCHER" "$@"
        elif [[ "$EDITOR_LAUNCHER" = "cursor" ]]; then
          open -a "Cursor" "$@"
        elif [[ "$EDITOR_LAUNCHER" = "zed" ]]; then
          open -a "Zed" "$@"
        else
          echo "Editor launcher '$EDITOR_LAUNCHER' was not found." >&2
          return 1
        fi
      }

      tvf() {
        local selection
        selection="$(tv --select-1 editor-files)"
        if [[ -n "$selection" ]]; then
          _editor_open "$selection"
        fi
      }

      tvd() {
        local selection
        selection="$(tv --select-1 editor-dirs)"
        if [[ -n "$selection" ]]; then
          _editor_open "$selection"
        fi
      }
    '';
    shellAliases = {
      rebuild = "sudo darwin-rebuild switch --flake ~/dotfiles#Bradys-MacBook-Pro";
      vim = "nvim";
      cd = "z";
      hda = "cd ~/Documents/hdaDevelopment";
      ls = "eza";
      l = "eza --git-ignore";
      ll = "eza --all --header --long";
      llm = "eza --all --header --long --sort=modified";
      la = "eza -lbhHigUmuSa";
      lx = "eza -lbhHigUmuSa@";
      lt = "eza --tree";
      tree = "eza --tree";
    };
  };
}
