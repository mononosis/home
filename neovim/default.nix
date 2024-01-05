{ lib, config, pkgs, ... }:

let
  myPlugins = import ./plugins.nix { inherit lib config pkgs; };
in
{
  programs.neovim = {
    enable = true;
    extraLuaConfig = ''
      local is_dev_mode = os.getenv("NIX_DEV_MODE")
      local utils = require("nvim-utils-config")
      local nvim_user_config_path = os.getenv("HOME") .. "/Lab/LuaLab/${myPlugins.nvimUserConfig.repo}"
      if is_dev_mode then
          -- utils.set_packages_paths(nvim_user_config_path)
          -- Lets use instead the runtime setter in order to override with the develop user config
          utils.add_paths_to_rtp(utils.split(nvim_user_config_path .. "*",","))
      end
      require("${myPlugins.nvimUserConfig.repo}")

    '';
    plugins = with pkgs.vimPlugins; [
      nvim-lspconfig
      vim-nix

      myPlugins.nvimUserConfig
      myPlugins.lspsaga
      myPlugins.nvimUtilsConfig
      myPlugins.nullLs
      myPlugins.plenary
      myPlugins.telescope
      myPlugins.formatter
      myPlugins.lightline
      myPlugins.luaSnip
      myPlugins.cyberpunkTheme
      myPlugins.nui
      myPlugins.bufferline
      myPlugins.nvimTree
      myPlugins.noice

      nvim-highlight-colors

      nvim-web-devicons
      nvim-notify

      nvim-dap

      nvim-cmp
      cmp-nvim-lsp
      cmp-buffer
      cmp-path
      cmp-cmdline
      cmp_luasnip
      awesome-vim-colorschemes

      vim-fugitive
      auto-pairs
      vim-surround
      nerdcommenter
      nvim-treesitter
      nvim-treesitter-parsers.c
      nvim-treesitter-parsers.lua
      nvim-treesitter-parsers.python
      nvim-treesitter-parsers.nix
      nvim-treesitter-parsers.regex
      nvim-treesitter-parsers.bash
      nvim-treesitter-parsers.markdown
      nvim-treesitter-parsers.markdown_inline

      #yankring
      #{ plugin = vim-startify; config = "let g:startify_change_to_vcs_root = 0"; }
    ];
    withPython3 = true;
  };

}
