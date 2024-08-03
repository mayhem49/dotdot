local config = function()
  local telescope = require("telescope")
  local actions = require("telescope.actions")
  local open_with_trouble = require("trouble.sources.telescope").open


  local defaults = {
    layout_strategy = "horizontal",
    file_ignore_patterns = {
      "assets/",
      "^%.git/",
      "^%.git$",
      "lazy-lock.json",
      "%.lock",
      --elixir
      "^%_build/",
      "^%.elixir_ls/",
      "^%.lexical/"
    },
    mappings = {
      i = {
        ['<c-d>'] = actions.delete_buffer,
        ["<c-t>"] = open_with_trouble
      },
      n = {
        ['<c-d>'] = actions.delete_buffer,
        ["<c-t>"] = open_with_trouble
      }
    },
    vimgrep_arguments = {
      'rg',
      '--color=never',
      '--no-heading',
      '--with-filename',
      '--line-number',
      '--column',
      '--hidden',
      '--smart-case',

    },
  }
  local pickers = {
    find_files = {
      -- find hidden files but not .git/*
      find_command = { 'rg', '--files', '--hidden', '-g', '!.git' },
    },
    buffers = {
      -- didn't work i guess, so needed to add again
      sort_mru = true,
      sort_lastused = true,
    }
  }

  telescope.setup({
    defaults = defaults,
    pickers = pickers
  })
end

local keys = {
  { "<leader><leader>", "<cmd>lua require('telescope.builtin').buffers({sort_lastused = true})<cr>" },
  { "<leader>ff",       "<cmd>Telescope find_files<cr>" },
  { "<leader>fg",       "<cmd>Telescope live_grep<cr>" },
  { "<leader>fr",       "<cmd>Telescope lsp_references<cr>" },
  { "<leader>fh",       "<cmd>Telescope help_tags<cr>" },
  { '<leader>q',        " <cmd>lua require('telescope.builtin').quickfix()<cr>" },
  { "<leader>lf",       "<cmd>lua require('telescope.builtin').lsp_document_symbols({ symbols = { 'function', 'method' } })<cr>" },
  { '<leader>fb',       "<cmd>lua require('telescope.builtin').current_buffer_fuzzy_find({ sorting_strategy = 'ascending', prompt_position = 'top' })<cr>" },
}

return {
  'nvim-telescope/telescope.nvim',
  tag = '0.1.8',
  dependencies = { 'nvim-lua/plenary.nvim' },
  config = config,
  keys = keys
}
