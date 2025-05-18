return {
  {
    "neovim/nvim-lspconfig"
  },
  {
    "williamboman/mason.nvim",
    config = function()
      require("mason").setup({})
    end
  },
  {
    "williamboman/mason-lspconfig.nvim",
    dependencies = { "williamboman/mason.nvim" },
    config = function()
      require("mason-lspconfig").setup({
        ensure_installed = {
          'ts_ls',
          'eslint',
          'html',
          'cssls',
          'gopls',
          'lua_ls'
        },
      })

      vim.lsp.config('lua_ls', {
        settings = {
          Lua = {
            diagnostics = {
              globals = { "vim" }
            }
          }
        }
      })

      vim.lsp.config('ts_ls', {})

      vim.lsp.config('tailwindcss', {
        -- filetypes = { "html", "elixir", "eelixir", "heex" },
        -- init_options = {
        --   userLanguages = {
        --     elixir = "html-eex",
        --     eelixir = "html-eex",
        --     heex = "html-eex",
        --   },
        -- },
        filetypes = { "html", "eelixir", "heex" },
        init_options = {
          userLanguages = {
            eelixir = "html-eex",
            heex = "html-eex",
          },
        },
      })

      vim.lsp.config('gopls', {
        settings = {
          gopls = {
            ["formatting.gofumpt"] = false,
            --["formatting.formatTool"] = "goimports", -- optional
            usePlaceholders = true,
            completeUnimported = true,
            staticcheck = true,
          }
        }

      })
      --local capabilities = require('cmp_nvim_lsp').default_capabilities()
    end
  }
}
