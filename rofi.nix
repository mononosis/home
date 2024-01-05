{ lib, config, pkgs, ... }:
{

  programs.rofi = {
    enable = true;
    theme =
      let
        # Use `mkLiteral` for string-like values that should show without
        # quotes, e.g.:
        # {
        #   foo = "abc"; => foo: "abc";
        #   bar = mkLiteral "abc"; => bar: abc;
        # };
        inherit (config.lib.formats.rasi) mkLiteral;
      in
      lib.mkDefault {
        "entry" = {
          placeholder = "Enter text here";
        };

        prompt = {
          placeholder = "Enter text here";
        };

        "@theme" = "lb";


        element = {
          orientation = "vertical";
          children = [ "element-text" "element-icon" ];
          background-color = "#fff";
          #spacing = mkLiteral "5 px";
        };

        "*" = {
          background-color = mkLiteral "#000000";
          foreground-color = mkLiteral "rgba ( 250, 251, 252, 100 % )";
          border-color = mkLiteral "#34C9F4";
          width = 512;
          padding-left = mkLiteral "5px";
        };

        "#inputbar" = {
          children = map mkLiteral [ "prompt" "entry" ];
        };

        "#textbox-prompt-colon" = {
          expand = false;
          str = " ==: ";
          margin = mkLiteral "0px 0.3em 0em 0em";
          text-color = mkLiteral "@foreground-color";
        };
      };
  };
}
