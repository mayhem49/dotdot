return {
  --  ╭──────────────────────────────────────────────────────────╮
  --  │                       COLORSCHEME                        │
  --  ╰──────────────────────────────────────────────────────────╯
  -- === tokyonight ===
  {
    --"folke/tokyonight.nvim",
    "navarasu/onedark.nvim",
    --"savq/melange-nvim",
    --"xero/miasma.nvim",
    -- "ptdewey/darkearth-nvim",
    --
    -- "olimorris/onedarkpro.nvim",
    --'projekt0n/caret.nvim',

    --"catppuccin/nvim",
    --name = "catppuccin",
    --
    lazy = false,     -- make sure we load this during startup if it is your main colorscheme
    priority = 1000,  -- make sure to load this before all the other start plugins
    style = "warmer", -- The theme comes in three styles, `storm`, `moon`, a darker variant `night` and `day`
    config = function()
      -- load the colorscheme here
      -- vim.cmd([[colorscheme tokyonight]])
      --vim.cmd([[colorscheme catppuccin-frappe]])
      -- vim.cmd([[colorscheme darkearth]])
      vim.cmd([[colorscheme onedark]])
      -- vim.cmd([[colorscheme miasma]])
      -- vim.cmd([[colorscheme melange]])
    end,
  },
  -- minimal installations
  {
    'Hashino/doing.nvim',
    config = true,
  },
  {
    'tpope/vim-fugitive'
  },
  {
    'lewis6991/gitsigns.nvim',
    config = function()
      require("gitsigns").setup()
    end
  }
}
-- try this
-- https://github.com/srt0/everblush.nvim
