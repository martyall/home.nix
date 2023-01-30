{ config, pkgs, ... }:

{
  imports = 
    [ "${fetchTarball "https://github.com/msteen/nixos-vscode-server/tarball/master"}/modules/vscode-server/home.nix"
    ];

  home.username = "martyall";
  home.homeDirectory = "/home/martyall";

  home.packages = [
    pkgs.dig
    pkgs.docker-compose
    pkgs.git
    pkgs.htop
    pkgs.jq
    pkgs.netcat
    pkgs.nethogs
    pkgs.nix-output-monitor
    pkgs.nodejs
    pkgs.silver-searcher
    pkgs.tmate
    pkgs.tmux
    pkgs.unzip
    pkgs.vim
    pkgs.wget
    pkgs.xclip
  ];

  home.stateVersion = "22.05";

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

  programs.direnv.enable = true;
  programs.direnv.nix-direnv.enable = true;
  programs.direnv.enableZshIntegration = true;

  programs.zsh = {
    enable = true;
    shellAliases = {
      pbcopy ="xclip -selection clipboard";
      pbpaste = "xclip -selection clipboard -o";
    };
    oh-my-zsh = {
      enable = true;
      plugins = [ "git" ];
      theme = "robbyrussell";
    };
  };


  programs.git = {
    enable = true;
    userName = "martyall";
    userEmail = "martyall@protonmail.com";
  };

  services.vscode-server.enable = true;

}
