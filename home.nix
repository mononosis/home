{ lib, config, pkgs, ... }:

{

  imports = [
    ./neovim.nix
    ./wayland.nix
    ./rofi.nix
    ./oh-myzsh.nix
    ./stylix.nix
    ./dunst.nix
    ./waybar
  ];



  home.username = "nixos";
  home.homeDirectory = "/home/nixos";


  programs.kitty.enable = true;
  #programs.kitty.settings = {
  #background_opacity = "0.55";
  #foreground_opacity = "0.0";
  #};

  qt.platformTheme = "qtct";

  home.stateVersion = "22.11";

  home.packages = with pkgs; [

    docker-compose
    htop
    git
    jq
    openssh
    rnix-lsp
    keepassxc
    pywal
    nerdfonts

    (pkgs.writeShellScriptBin "my-custom-hello" ''
      echo "Hello, ${config.home.username}!"
    '')

    libnotify
    swww
  ];

  home.activation.copyLab = lib.hm.dag.entryAfter [ "writeBoundary" ] ''
    if [ ! -d "$HOME/Lab" ]; then
      export PATH=${pkgs.git}/bin:${pkgs.openssh}/bin:$PATH
      #/run/current-system/sw/bin/git clone git@github.com:mononosis/Lab.git
      git clone git@github.com:mononosis/Lab.git
    fi
  '';

  home.sessionVariables = {
    TERM = "xterm-256color";
    EDITOR = "vim";
  };

  programs.home-manager.enable = true;
}
