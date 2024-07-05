return {
  --  ╭──────────────────────────────────────────────────────────╮
  --  │                       COLORSCHEME                        │
  --  ╰──────────────────────────────────────────────────────────╯
  -- === tokyonight ===
  {
    "folke/tokyonight.nvim",
    lazy = false,    -- make sure we load this during startup if it is your main colorscheme
    priority = 1000, -- make sure to load this before all the other start plugins
    style = "storm", -- The theme comes in three styles, `storm`, `moon`, a darker variant `night` and `day`
    config = function()
      -- load the colorscheme here
      -- vim.cmd([[colorscheme tokyonight]])
      vim.cmd([[colorscheme tokyonight]])
    end,
  }
}
