{ config, pkgs, ... }:

{
  # Home Manager needs a bit of information about you and the
  # paths it should manage.
  home.username = "martin";
  home.homeDirectory = "/home/martin";

  home.packages = [
    pkgs.cbc
    pkgs.cvc4
    pkgs.docker-compose
    pkgs.git
    pkgs.htop
    pkgs.jq
    pkgs.m4
    pkgs.neovim
    pkgs.nethogs
    pkgs.netcat
    pkgs.nix-output-monitor
    pkgs.pdftk
    # pkgs.python3
    # pkgs.rustup
    pkgs.silver-searcher
    pkgs.tree
    pkgs.tmate
    pkgs.tmux
    pkgs.tmuxinator
    pkgs.which
    pkgs.vscode
    pkgs.xclip
    pkgs.yarn
    pkgs.nodejs
    pkgs.stack
  ];

  # This value determines the Home Manager release that your
  # configuration is compatible with. This helps avoid breakage
  # when a new Home Manager release introduces backwards
  # incompatible changes.
  #
  # You can update Home Manager without changing this value. See
  # the Home Manager release notes for a list of state version
  # changes in each release.
  home.stateVersion = "23.05";

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
  nixpkgs.config.allowUnfree = true;

  programs.tmux = {
    enable = true;
    keyMode = "vi";
    tmuxinator.enable = true;
    extraConfig = ''
      set-option -g mouse on
      set-option -g default-shell ''${SHELL}
    '';
  };

  programs.zsh = {
    enable = true;
    shellAliases = {
      pbcopy ="xclip -selection clipboard";
      pbpaste = "xclip -selection clipboard -o";
      ls = "ls -l --color";
    };
    initExtra = ''
      source $HOME/.nix-profile/etc/profile.d/hm-session-vars.sh
      . /home/martin/.ghcup/env
      PATH=/home/martin/.cargo/bin:$PATH
      PATH=/home/martin/.foundry/bin:$PATH
    '';
    oh-my-zsh = {
      enable = true;
      plugins = [ "git" ];
      theme = "robbyrussell";
    };
  };

  programs.go.enable = true;

  programs.git = {
    enable = true;
    userName = "martyall";
    userEmail = "martyall@protonmail.com";
  };

  programs.vscode = {
    enable = true;
    extensions = with pkgs.vscode-extensions; [
      dracula-theme.theme-dracula
      vscodevim.vim
      yzhang.markdown-all-in-one
    ];
  };

  programs.direnv = {
      enable = true;
      enableZshIntegration = true; # see note on other shells below
      nix-direnv.enable = true;
  };

}
