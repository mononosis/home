{ lib, config, pkgs, ... }:
{
  services.dunst.enable = true;
  services.dunst.settings = {
    global = {
      width = 600;
      height = 600;
      offset = "30x50";
      origin = "top-left";
      transparency = 11;
      frame_color = "#eceff1";
      #font = "Droid Sans 9";
    };

    urgency_normal = {
      #background = "#37474f";
      #foreground = "#eceff1";
      timeout = 10;
    };
  };
}
