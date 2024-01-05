{ lib, config, pkgs, ... }: 
{
  programs.waybar.enable = true;
  programs.waybar.systemd.target = "sway-session.target";
  programs.waybar.style = builtins.readFile ./styles.css;

  imports = [
    ./settings.nix
  ];
}
