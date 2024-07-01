local function on_attach(bufnr)
local api = require "nvim-tree.api"
local view = require 'nvim-tree.view'
print "on_attach nvimtree"

--deault mappings
api.config.mappings.default_on_attach(bufnr)
end

--custom mappings
--if open and focused -> close
--if open and not focused -> focus
--if closed -> open
local function toggle_tree()
local api = require "nvim-tree.api"
local view = require 'nvim-tree.view'

  if view.is_visible() then
    local bufname = vim.fn.bufname()
    if string.match(string.lower(bufname), "nvimtree_") == nil then
      api.tree.focus()
    else
      api.tree.toggle()
    end
  else
    api.tree.toggle { find_file = false, focus = true, update_root = false }
  end
end

return {
  "nvim-tree/nvim-tree.lua",
  version = "*",
  lazy = false,
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },
  config = function()
    require("nvim-tree").setup {
      on_attach = on_attach
    }
  end,
vim.keymap.set('n', '<c-n>', toggle_tree)
}
