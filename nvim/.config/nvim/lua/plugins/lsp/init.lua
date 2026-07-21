return {
  "mason-org/mason-lspconfig.nvim",
  opts = {
    ensure_installed = {
      'ts_ls',
      'eslint',
      'html',
      'cssls',
      'gopls',
      'lua_ls',
      'expert',
    },
    automatic_enable = true,
  },
  dependencies = {
    {
      "mason-org/mason.nvim",
      opts = {},
    },
    {
      "neovim/nvim-lspconfig",
      event = { "BufReadPre", "BufNewFile" },
      config = function()
      end
    }
    ,
  },
}
