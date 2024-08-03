return { {
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
      require("mason-lspconfig").setup()

      require("mason-lspconfig").setup_handlers({
        function(server)
          require("lspconfig")[server].setup({})
        end,
        ["lua_ls"] = function()
          local lspconfig = require("lspconfig")
          lspconfig.lua_ls.setup {
            settings = {
              Lua = {
                diagnostics = {
                  globals = { "vim" }
                }
              }
            }
          }
        end,
        ["tailwindcss"] = function()
          local lspconfig = require("lspconfig")
          lspconfig.tailwindcss.setup({
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
        end
      })


      --todo setup cmp_nvim_lsp
      --local capabilities = require('cmp_nvim_lsp').default_capabilities()
    end
  }
}
