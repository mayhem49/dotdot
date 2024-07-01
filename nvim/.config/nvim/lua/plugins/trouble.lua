return {
  "folke/trouble.nvim",
  cmd = "Trouble",
  opts={
    auto_close=true
  },
  keys = {
    {
      "<leader>cad",
      "<cmd>Trouble diagnostics toggle<cr>",
      desc = "Diagnostics (Trouble)",
    },
    {
      "<leader>cd",
      "<cmd>Trouble diagnostics toggle filter.buf=0<cr>",
      desc = "Buffer Diagnostics (Trouble)",
    },
    {
      "<leader>ce",
      "<cmd>Trouble my_errors toggle<cr>",
      desc = "Trouble show errors only",
    },
    {
      "<leader>cs",
      "<cmd>Trouble symbols toggle focus=false<cr>",
      desc = "Symbols (Trouble)",
    },
    {
      "<leader>cl",
      "<cmd>Trouble lsp toggle focus=false win.position=right<cr>",
      desc = "LSP Definitions / references / ... (Trouble)",
    },
    {
      "<leader>ct",
      "<cmd>Trouble loclist toggle<cr>",
      desc = "Location List (Trouble)",
    },
    {
      "<leader>cq",
      "<cmd>Trouble qflist toggle<cr>",
      desc = "Quickfix List (Trouble)",
    },
    {
      "<leader>cf",
      "<cmd>lua require('trouble').focus()<cr>",
      desc = "Trouble close"
    },
    {
      --or just use <leader>cf and then q
      "<leader>cc",
      "<cmd>lua require('trouble').close()<cr>",
      desc = "Trouble close"
    }
  },
  -- errors only
  modes = {
    diagnostics_buffer = {
      mode = "diagnostics", -- inherit from diagnostics mode
      filter = { buf = 0 }, -- filter diagnostics to the current buffer
    },
    my_errors = {
      mode = "diagnostics",
      filter = {
        any = {
          {
            severity = vim.diagnostic.severity.ERROR, -- errors only
            -- limit to files in the current project
            --function(item)
            --return item.filename:find((vim.loop or vim.uv).cwd(), 1, true)
            --end,
          },
        },
      },
    }
  }
}

