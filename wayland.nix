{ lib, config, pkgs, ... }:

{

  config.wayland.windowManager.hyprland.enable = true;

  config.wayland.windowManager.hyprland.extraConfig = ''
    monitor=,preferred,auto,auto

    decoration {
    
        rounding = 10
        #blur = yes
        #blur_size = 3
        #blur_passes = 1
        #blur_new_optimizations = on
    
        drop_shadow = yes
        shadow_range = 4
        shadow_render_power = 3
        col.shadow = rgba(1a1a1aee)
    }

    general {
        # See https://wiki.hyprland.org/Configuring/Variables/ for more
    
        gaps_in = 5
        gaps_out = 20
        border_size = 4
        col.active_border = rgba(33ccffee) rgba(00ff99ee) 45deg
        col.inactive_border = rgba(595959aa)
    
        layout = dwindle
    }

    exec-once = waybar & dunst & swww init && swww img ~/Wallpaper/wallhaven-rrw3mm.png

    $mainMod = SUPER

    # Install xev to find out the codes nix-shell -p xorg.xev

    bind = $mainMod, F, exec, firefox
    bind = , code:123, exec, pactl set-sink-volume `pactl get-default-sink` +5% 
    bind = , code:122, exec, pactl set-sink-volume `pactl get-default-sink` -5% 
    bind = $mainMod, S, exec, pactl set-sink-mute `pactl get-default-sink` toggle
    #bind = , Print, exec, grimblast copy area

    # Example binds, see https://wiki.hyprland.org/Configuring/Binds/ for more
    bind = $mainMod, Q, exec, kitty
    bind = $mainMod, C, killactive, 
    bind = $mainMod, M, exit, 
    #bind = $mainMod, E, exec, dolphin
    bind = $mainMod, V, togglefloating, 
    bind = $mainMod, P, exec, rofi -show run 
    bind = $mainMod, D, pseudo, # dwindle
    #bind = $mainMod, J, togglesplit, # dwindle
    
    # Move focus with mainMod + arrow keys
    bind = $mainMod, H, movefocus, l
    bind = $mainMod, L, movefocus, r
    bind = $mainMod, K, movefocus, u
    bind = $mainMod, J, movefocus, d
    # workspaces
    # binds $mainMod + [shift +] {1..10} to [move to] workspace {1..10}
    ${builtins.concatStringsSep "\n" (builtins.genList (
        x: let
          ws = let
            c = (x + 1) / 10;
          in
            builtins.toString (x + 1 - (c * 10));
        in ''
          bind = $mainMod, ${ws}, workspace, ${toString (x + 1)}
          bind = $mainMod SHIFT, ${ws}, movetoworkspace, ${toString (x + 1)}
        ''
      )
      10)}

    # ...
    # Scroll through existing workspaces with mainMod + scroll
    bind = $mainMod, mouse_down, workspace, e+1
    bind = $mainMod, mouse_up, workspace, e-1
    
    # Move/resize windows with mainMod + LMB/RMB and dragging
    bindm = $mainMod, mouse:272, movewindow
    bindm = $mainMod, mouse:273, resizewindow
  '';
}
