return {
  'nvim-treesitter/nvim-treesitter',
  lazy = false,
  branch = 'main',
  build = function()
    -- The :TSUpdate command is registered in the plugin's plugin/ files,
    -- which lazy.nvim does NOT source before running a build function on a
    -- fresh clone -- so `vim.cmd("TSUpdate")` errors with "Not an editor
    -- command". Call the Lua API directly instead (this is all :TSUpdate
    -- does anyway). On first install nothing is installed yet so this is a
    -- no-op; it only does work on plugin updates.
    if pcall(require, "nvim-treesitter") then
      require("nvim-treesitter").update():wait(300000)
    end
  end,
  opts = {
    ensure_installed = {
      "c",
      "cpp",
      "typescript",
      "javascript",
      "elixir",
      "lua",
      "vimdoc",
      "rust",
      "make",
      "go",
      "gomod",
      "json",
      "yaml",
      "lua",
      "tsx",
      "jsx"
    }
  },
  config = function(_, opts)
    local ts = require('nvim-treesitter')
    ts.install(opts.ensure_installed):wait(300000)

    ---@param buf integer
    ---@param language string
    local function treesitter_try_attach(buf, language)
      -- check if parser exists and load it
      if not vim.treesitter.language.add(language) then
        return false
      end
      -- enables syntax highlighting and other treesitter features
      vim.treesitter.start(buf, language)

      -- enables treesitter based folds
      vim.wo.foldexpr = "v:lua.vim.treesitter.foldexpr()"
      vim.wo.foldmethod = "expr"
      -- ensure folds are open to begin with
      vim.opt.foldlevel = 99
      vim.opt.foldcolumn = "0"
      -- for highlighting
      vim.opt.foldtext = ""
      -- donot open fold on block movement
      -- see :h foldopen
      vim.opt.foldopen:remove({ "block" })

      -- enables treesitter based indentation
      vim.b.did_indent = 1 -- this right here prevents built-in indent scripts from loading
      vim.bo.indentexpr = "v:lua.require'nvim-treesitter.indent'.get_indent(v:lnum)"
      vim.keymap.set("n", "<leader>e", "za", { noremap = true, silent = true })

      return true
    end

    local installable_parsers = require("nvim-treesitter").get_available()
    vim.api.nvim_create_autocmd("FileType", {
      callback = function(args)
        local buf, filetype = args.buf, args.match
        local language = vim.treesitter.language.get_lang(filetype)
        if not language then
          return
        end

        if not treesitter_try_attach(buf, language) then
          ---@cast installable_parsers string[]
          if vim.tbl_contains(installable_parsers, language) then
            -- not already installed, so try to install them via nvim-treesitter if possible
            require("nvim-treesitter").install(language):await(function()
              treesitter_try_attach(buf, language)
            end)
          end
        end
      end,
    })
  end,
}


-- WIP
