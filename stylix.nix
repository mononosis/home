{ lib, config, pkgs, ... }: {

  stylix.autoEnable = true;

  stylix.image = ./Wallpaper/wallhaven-rrw3mm.png;

  stylix.polarity = "dark";

  stylix.opacity = {
    terminal = 0.70;
    applications = 0.70;
    popups = 0.80;
    desktop = 0.80;
  };

  stylix.targets.rofi.enable = false;
  #stylix.cursor.size = 50;
  stylix.targets = {
    waybar.enableLeftBackColors = true;
    waybar.enableRightBackColors = true;
  };

  stylix.targets.hyprland.enable = true;

  stylix.targets.kitty.variant256Colors = true;

  stylix.targets.vim.enable = false;
  stylix.targets.dunst.enable = true;

  stylix.fonts.sizes.applications = 12;

  stylix.fonts.sizes.desktop = 10;
  stylix.fonts.sizes.popups = 12;
  #stylix.fonts.sizes.terminal = 20;

  stylix.fonts = {
    serif = {
      package = pkgs.dejavu_fonts;
      name = "DejaVu Serif";
    };

    sansSerif = {
      package = pkgs.dejavu_fonts;
      name = "DejaVu Sans";
    };

    monospace = {
      package = pkgs.dejavu_fonts;
      name = "DejaVu Sans Mono";
    };

    emoji = {
      package = pkgs.noto-fonts-emoji;
      name = "Noto Color Emoji";
    };
  };
}
