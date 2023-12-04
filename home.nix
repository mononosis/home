{ lib, config, pkgs, ... }:

let
  stylix = pkgs.fetchFromGitHub {
    owner = "danth";
    repo = "stylix";
    rev = "master";
    sha256 = "sha256-Jrizp/nITbul2HBIraQRDw5lyJnzTsj0K9wZUFYX2gg=";
  };
in
{

  imports = [
    ./neovim.nix
    ./wayland.nix
    ./rofi.nix
    ./oh-myzsh.nix
    stylix.homeManagerModules.stylix
  ];


  #stylix.image = pkgs.fetchurl {
  #url = "https://w.wallhaven.cc/full/4o/wallhaven-4o3xmp.jpg";
  #sha256 = "sha256-fWTMp4fIQ70moOIcsxXh/5FUKBtFrXA6B+Nk/ZyptLI=";
  #};

  #stylix.polarity = "dark";

  #stylix.opacity = {
  #terminal = 0.70;
  #applications = 0.70;
  #popups = 0.50;
  #desktop = 0.80;
  #};

  #stylix.targets = {
  #waybar.enableLeftBackColors = true;
  #waybar.enableRightBackColors = true;
  #};


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
      echo ${stylix}
      echo "Hello, ${config.home.username}!"
    '')

    waybar
    dunst
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
