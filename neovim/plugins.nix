{ lib, config, pkgs, ... }:
{
  nvimUserConfig = pkgs.fetchFromGitHub {
    owner = "mononosis";
    repo = "nvim-user-config";
    rev = "1284c95c43ff4c17f8dd64844cf773348787cdc2";
    sha256 = "sha256-S6d9KBSKdrvnMM/j21xuM3KlXyHhU4M4qTBJmbLOn5E=";
  };
  nvimUtilsConfig = (pkgs.vimUtils.buildVimPlugin {
    name = "nvim-utils-config";
    src = pkgs.fetchFromGitHub {
      owner = "mononosis";
      repo = "nvim-utils-config";
      rev = "master";
      sha256 = "sha256-wfDgFIKgGHlEzPmDNqcA3ciZ5Y4utj0iUHrJZiC6Ks8=";
    };
  });
  lspsaga = (pkgs.vimUtils.buildVimPlugin {
    name = "lspsaga";
    src = pkgs.fetchFromGitHub {
      owner = "nvimdev";
      repo = "lspsaga.nvim";
      rev = "master";
      sha256 = "sha256-RUjZT9rnb7cefW8N1NIhlZ97ATgm2/a6P/AhTvISnyw=";
    };
  });
  nullLs = (pkgs.vimUtils.buildVimPlugin {
    name = "null-ls.nvim";
    src = pkgs.fetchFromGitHub {
      owner = "jose-elias-alvarez";
      repo = "null-ls.nvim";
      rev = "master";
      sha256 = "sha256-cWA0rzkOp/ekVKaFee7iea1lhnqKtWUIU+fW5M950wI=";
    };
  });
  plenary = (pkgs.vimUtils.buildVimPlugin {
    name = "plenary.nvim";
    src = pkgs.fetchFromGitHub {
      owner = "nvim-lua";
      repo = "plenary.nvim";
      rev = "55d9fe89e33efd26f532ef20223e5f9430c8b0c0";
      sha256 = "sha256-S6d9KBSKdrvnMM/j21xuM3KlXyHhU4M4qTBJmbLOn5E=";
    };
  });
  telescope = (pkgs.vimUtils.buildVimPlugin {
    name = "telescope.nvim";
    src = pkgs.fetchFromGitHub {
      owner = "nvim-telescope";
      repo = "telescope.nvim";
      rev = "master";
      sha256 = "sha256-Zhx4Sy857CCVuK1qSlTEdZ+0blxheB6+CNnPFS7Cixw=";
    };
  });
  formatter = (pkgs.vimUtils.buildVimPlugin {
    name = "formatter.nvim";
    src = pkgs.fetchFromGitHub {
      owner = "mhartington";
      repo = "formatter.nvim";
      rev = "master";
      sha256 = "sha256-C+TXwyNrAXIaq3oKqkLZFmQx1/1my/fV5Kzzh6gOuR4=";
    };
  });
  lightline = (pkgs.vimUtils.buildVimPlugin {
    name = "lightline";
    src = pkgs.fetchFromGitHub {
      owner = "nvim-lualine";
      repo = "lualine.nvim";
      rev = "master";
      sha256 = "sha256-jV+6mV0dyuhiHGei1UqE2r2GoiKJLtdZI2AMNexbi7E=";
    };
  });
  luaSnip = (pkgs.vimUtils.buildVimPlugin {
    name = "LuaSnip";
    src = pkgs.fetchFromGitHub {
      owner = "L3MON4D3";
      repo = "LuaSnip";
      rev = "cab667e2674881001a86a7478fff7dc7791c63f5";
      sha256 = "sha256-d94eTUq0suRhW5gTfN00v/aXCkwIW5oPYn61PNoKMoI=";
    };
  });
  cyberpunkTheme = (pkgs.vimUtils.buildVimPlugin {
    name = "cyberpunk-theme";
    src = pkgs.fetchFromGitHub {
      owner = "thedenisnikulin";
      repo = "vim-cyberpunk";
      rev = "master";
      sha256 = "sha256-AhwPJzH5xMR/2MG4VH5xxEL1yZj3fE3ET3abuBs7aOY=";
    };
  });
  nui = (pkgs.vimUtils.buildVimPlugin {
    name = "nui";
    src = pkgs.fetchFromGitHub {
      owner = "MunifTanjim";
      repo = "nui.nvim";
      rev = "main";
      sha256 = "sha256-pRruztD0S+x0M0jWfLnhGZXlIpka2hzlvnR10oZxa3Q=";
    };
  });
  noice = (pkgs.vimUtils.buildVimPlugin {
    name = "noice";
    src = pkgs.fetchFromGitHub {
      owner = "folke";
      repo = "noice.nvim";
      rev = "main";
      sha256 = "sha256-7lgJK5pkMqwIXNeBDsz4B8UAKnkpUvDrHdeG/aSFRzM=";
    };
  });
  bufferline = (pkgs.vimUtils.buildVimPlugin {
    name = "bufferline";
    src = pkgs.fetchFromGitHub {
      owner = "akinsho";
      repo = "bufferline.nvim";
      rev = "main";
      sha256 = "sha256-la4inoYjcs6o9oNC3UkhV1D+IwJaUDvwA4UlIyJaYiI=";
    };
  });
  nvimTree = (pkgs.vimUtils.buildVimPlugin {
    name = "nvim-tree";
    src = pkgs.fetchFromGitHub {
      owner = "nvim-tree";
      repo = "nvim-tree.lua";
      rev = "master";
      sha256 = "sha256-QNJbj1H87SMrcguxhw6gAeIZNrBRUZLHpD8ikz8kcbA=";
    };
  });
}
