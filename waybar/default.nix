{ lib, config, pkgs, ... }: 
{
  programs.waybar.enable = true;
  programs.waybar.systemd.target = "sway-session.target";

  imports = [
    ./styling-css.nix
    ./settings.nix
  ];
}
