{ config, pkgs, ... }:

{
  # Home Manager needs a bit of information about you and the
  # paths it should manage.
  home.username = "martin";
  home.homeDirectory = "/home/martin";

  home.packages = [
    pkgs.tmux
    pkgs.neovim
    pkgs.htop
    pkgs.nix-output-monitor
    pkgs.jq
    pkgs.nethogs
  ];

  # This value determines the Home Manager release that your
  # configuration is compatible with. This helps avoid breakage
  # when a new Home Manager release introduces backwards
  # incompatible changes.
  #
  # You can update Home Manager without changing this value. See
  # the Home Manager release notes for a list of state version
  # changes in each release.
  home.stateVersion = "22.05";

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

  programs.direnv.enable = true;
  programs.direnv.nix-direnv.enable = true;

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

}
