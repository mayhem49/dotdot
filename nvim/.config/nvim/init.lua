-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
end
vim.opt.rtp:prepend(lazypath)


-- Make sure to setup `mapleader` and `maplocalleader` before
-- loading lazy.nvim so that mappings are correct.
-- This is also a good place to setup other settings (vim.opt)
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- Disable Netrw
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

require("mappings")
require("autocmd")
require("set")

local opts = {
}
--ui = {
  --border = 'single',
  --icons = {
    --lazy = '💤',
    --},
    --},
    --checker = {
      --enabled = true,
      --},

local opts = {
    ui = {
        border = 'single',
        icons = {
            lazy = '💤',
        },
    },
    checker = {
        enabled = true,
    },
}

require('lazy').setup("plugins")
      -- Setup lazy.nvim
      --require("lazy").setup({
        --{
          --"folke/tokyonight.nvim",
          --lazy = false, -- make sure we load this during startup if it is your main colorscheme
          --priority = 1000, -- make sure to load this before all the other start plugins
          --style = "storm", -- The theme comes in three styles, `storm`, `moon`, a darker variant `night` and `day`
          --config = function()
            ---- load the colorscheme here
            --vim.cmd([[colorscheme tokyonight]])
            --end,
            --},
            --
            --  --fuzzy finder ig
            --  {
              --    'nvim-telescope/telescope.nvim', tag = '0.1.3',
              --    dependencies = { { 'nvim-lua/plenary.nvim' } }
              --  },
              --
              --  --treesitter
              --  { 'nvim-treesitter/nvim-treesitter', build = ':TSUpdate' },
              --
              --  --rust-tool alternatives
              --  'mrcjkb/rustaceanvim',
              --
              --  --lsp
              --  {
                --    'VonHeikemen/lsp-zero.nvim',
                --    branch = 'v3.x',
                --    dependencies = {
                  --      --- Uncomment these if you want to manage LSP servers from neovim
                  --      { 'williamboman/mason.nvim' },
                  --      { 'williamboman/mason-lspconfig.nvim' },
                  --
                  --      -- LSP Support
                  --      { 'neovim/nvim-lspconfig' },
                  --      -- Autocompletion
                  --      { 'hrsh7th/nvim-cmp' },
                  --      { 'hrsh7th/cmp-nvim-lsp' },
                  --      { 'L3MON4D3/LuaSnip' },
                  --    }
                  --  },
                  --  --colorscheme
                  --  'AlexvZyl/nordic.nvim',
                  --  -- { 'nyoom-engineering/oxocarbon.nvim' },
                  --
                  --    'nvim-tree/nvim-tree.lua',
                  --
                  --  --startup screen
                  --  --TODO: customize
                  --  {
                    --    'goolord/alpha-nvim',
                    --    config = function()
                      --      require 'alpha'.setup(require 'alpha.themes.dashboard'.config)
                      --    end
                      --  },
                      --  {
                        --    'rmagatti/auto-session',
                        --    config = function()
                          --      require("auto-session").setup {
                            --        log_level = "error",
                            --        auto_session_suppress_dirs = { "~/", "/" },
                            --      }
                            --    end
                            --  },
                            --
                            --})
