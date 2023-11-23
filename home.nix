{ lib, config, pkgs, ... }:

let
  luaNeovimLab = pkgs.fetchFromGitHub {
    owner = "mononosis";
    repo = "nvim-user-config";
    rev = "main";
    sha256 = "sha256-mMCTHue+ql/YO/0ZLNuJKbBhVI5drSson09VtPpzYzA=";
  };
in
{

  home.username = "nixos";
  home.homeDirectory = "/home/nixos";

  programs.zsh.enable = true;
  programs.zsh.enableCompletion = true;
  programs.zsh.package = pkgs.zsh;
  programs.zsh.initExtra = ''
    eval "$(direnv hook zsh)"
  '';

  programs.neovim = {
    enable = true;
    extraLuaConfig = ''
      dofile("${luaNeovimLab}/init.lua")
    '';
    plugins = with pkgs.vimPlugins; [
      nvim-lspconfig
      vim-nix
      yankring

      nvim-web-devicons
      nvim-notify

      nvim-cmp
      cmp-nvim-lsp
      cmp-buffer
      cmp-path
      cmp-cmdline
      cmp_luasnip

      vim-fugitive
      auto-pairs
      vim-surround
      nerdcommenter
      nvim-treesitter

      (pkgs.vimUtils.buildVimPlugin {
        name = "lightline";
        src = pkgs.fetchFromGitHub {
          owner = "nvim-lualine";
          repo = "lualine.nvim";
          rev = "master";
          sha256 = "sha256-jV+6mV0dyuhiHGei1UqE2r2GoiKJLtdZI2AMNexbi7E=";
        };
      })

      (pkgs.vimUtils.buildVimPlugin {
        name = "LuaSnip";
        src = pkgs.fetchFromGitHub {
          owner = "L3MON4D3";
          repo = "LuaSnip";
          rev = "master";
          sha256 = "sha256-d94eTUq0suRhW5gTfN00v/aXCkwIW5oPYn61PNoKMoI=";
        };
      })
      (pkgs.vimUtils.buildVimPlugin {
        name = "cyberpunk-theme";
        src = pkgs.fetchFromGitHub {
          owner = "thedenisnikulin";
          repo = "vim-cyberpunk";
          rev = "master";
          sha256 = "sha256-AhwPJzH5xMR/2MG4VH5xxEL1yZj3fE3ET3abuBs7aOY=";
        };
      })
      (pkgs.vimUtils.buildVimPlugin {
        name = "nui";
        src = pkgs.fetchFromGitHub {
          owner = "MunifTanjim";
          repo = "nui.nvim";
          rev = "main";
          sha256 = "sha256-pRruztD0S+x0M0jWfLnhGZXlIpka2hzlvnR10oZxa3Q=";
        };
      })
      (pkgs.vimUtils.buildVimPlugin {
        name = "noice";
        src = pkgs.fetchFromGitHub {
          owner = "folke";
          repo = "noice.nvim";
          rev = "main";
          sha256 = "sha256-7lgJK5pkMqwIXNeBDsz4B8UAKnkpUvDrHdeG/aSFRzM=";
        };
      })
      (pkgs.vimUtils.buildVimPlugin {
        name = "bufferline";
        src = pkgs.fetchFromGitHub {
          owner = "akinsho";
          repo = "bufferline.nvim";
          rev = "main";
          sha256 = "sha256-la4inoYjcs6o9oNC3UkhV1D+IwJaUDvwA4UlIyJaYiI=";
        };
      })
      (pkgs.vimUtils.buildVimPlugin {
        name = "nvim-tree";
        src = pkgs.fetchFromGitHub {
          owner = "nvim-tree";
          repo = "nvim-tree.lua";
          rev = "master";
          sha256 = "sha256-QNJbj1H87SMrcguxhw6gAeIZNrBRUZLHpD8ikz8kcbA=";
        };
      })
      { plugin = vim-startify; config = "let g:startify_change_to_vcs_root = 0"; }
    ];
    withPython3 = true;
  };


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


  home.stateVersion = "22.11";

  home.packages = with pkgs; [
    htop
    git
    openssh
    rnix-lsp
    nerdfonts
    (pkgs.writeShellScriptBin "my-custom-hello" ''
      echo "Hello, ${config.home.username}!"
    '')
  ];

  home.activation.copyLab = lib.hm.dag.entryAfter [ "writeBoundary" ] ''
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
