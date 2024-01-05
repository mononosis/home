{ lib, config, pkgs, ... }:

{

  imports = [
    ./neovim
    ./wayland.nix
    ./rofi.nix
    ./oh-myzsh.nix
    ./stylix.nix
    ./dunst.nix
    ./waybar
  ];


  _module.args.wallpaperPath = ./Wallpaper/another-world.jpg;



  home.username = "nixos";
  home.homeDirectory = "/home/nixos";


  programs.kitty.enable = true;
  #programs.kitty.settings = {
  #background_opacity = "0.55";
  #foreground_opacity = "0.0";
  #};



  qt.platformTheme = "qtct";

  gtk = {
    enable = true;

    theme = lib.mkForce {
      package = pkgs.gnome.gnome-themes-extra;
      name = "Adwaita-dark"; # Using the dark variant of Adwaita
    };

    iconTheme = {
      package = pkgs.papirus-icon-theme;
      name = "Papirus-Dark"; # If you prefer dark icons, or just use "Papirus"
    };

    font = lib.mkForce {
      package = pkgs.dejavu_fonts;
      name = "DejaVu Sans";
      size = 12;
    };

    cursorTheme = {
      package = pkgs.vanilla-dmz;
      name = "Vanilla-DMZ";
      size = 32;
    };
  };

  home.stateVersion = "22.11";

  programs.qutebrowser = {
    enable = true; # Ensure qutebrowser is enabled

    keyBindings = {
      insert = {
        "<Ctrl-o>" = "mode-leave ;; fake-key <Esc>";
        # Add any other custom keybindings here
      };
      normal = {
        "<Shift-j>" = "";
        # Add any other custom keybindings here
      };
      # You can also define keybindings for other modes like insert, hint, etc.
    };
  };


  home.packages = with pkgs; [

    nix-index

    docker-compose
    htop
    git
    jq
    openssh
    papirus-icon-theme

    grim
    slurp


    rnix-lsp
    keepassxc
    pywal
    nerdfonts
    hyprpicker
    wl-clipboard
    xclip

    (pkgs.writeShellScriptBin "copy-region" ''
      grim -g "$(slurp)" - | wl-copy
    '')
    (pkgs.writeShellScriptBin "milli-to-time" ''
      date -d @$(($1 / 1000)) '+%Y-%m-%d %H:%M:%S'
    '')

    libnotify
    swww
  ];

  home.activation.copyLab = lib.hm.dag.entryAfter [ "writeBoundary" ] ''
    echo ${config.home.profileDirectory}
    echo ${pkgs.papirus-icon-theme}
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
