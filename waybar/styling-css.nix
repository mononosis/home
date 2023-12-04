{ lib, config, pkgs, ... }: {

  programs.waybar.style = builtins.readFile ./styles.css;
}

