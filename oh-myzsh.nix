{ lib, config, pkgs, ... }:
{
  programs.zsh.enable = true;
  programs.zsh.enableCompletion = true;
  programs.zsh.package = pkgs.zsh;
  programs.zsh.initExtra = ''
    eval "$(direnv hook zsh)"
  '';
  programs.zsh = {
    oh-my-zsh = {
      enable = true;
      theme = "robbyrussell";
      plugins = [ "git" ];
    };
    autocd = true;
    history = {
      ignoreDups = true;
      share = true;
      size = 10000;
      save = 10000;
    };

    syntaxHighlighting = {
      enable = true;
    };
  };
}
