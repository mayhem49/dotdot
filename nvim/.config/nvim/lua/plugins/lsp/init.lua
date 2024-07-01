return {{
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
    dependencies={"williamboman/mason.nvim"},
    config = function()
      require("mason-lspconfig").setup()

      require("mason-lspconfig").setup_handlers({
        function (server)
          require("lspconfig")[server].setup({})
        end,
        ["lua_ls"] = function ()
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
      })


      --todo setup cmp_nvim_lsp
      --local capabilities = require('cmp_nvim_lsp').default_capabilities()
    end
  }
}


