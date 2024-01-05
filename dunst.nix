{ lib, config, pkgs, ... }:
let
  # Use `mkLiteral` for string-like values that should show without
  # quotes, e.g.:
  # {
  #   foo = "abc"; => foo: "abc";
  #   bar = mkLiteral "abc"; => bar: abc;
  # };
  inherit (config.lib.formats.rasi) mkLiteral;
in
{
  services.dunst.enable = true;
  services.dunst.iconTheme = {
    name = "Papirus-Dark";
    package = pkgs.papirus-icon-theme;
    size = "22x22";
  };
  services.dunst.settings = {

    global = {
      width = 600;
      height = 600;
      offset = "130x50";
      origin = "top-right";
      transparency = 11;
      frame_color = "#fff";
      show_indicators = true;
      markup = "yes";
      dmenu = "${config.home.profileDirectory}/bin/rofi -dmenu -p dunst:";
      mouse_middle_click = "context";
      indicate_hidden = "yes";
      alignment = "center";
      word_wrap = "yes";
      shrink = "yes";
      follow = "mouse";
      browser = "brave";
      font = lib.mkDefault "Droid Sans 9";
      context = "mod1+space";
      close_all = "mod4+period";
      history = "ctrl+mod1+h";
    };

    #all_notifications = {
    #action_name = "no";
    #};

    urgency_normal = {
      #background = "#37474f";
      #foreground = "#eceff1";
      timeout = 10;
    };
  };
}
