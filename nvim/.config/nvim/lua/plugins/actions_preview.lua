return {
  "aznhe21/actions-preview.nvim",
  config = function()
    vim.keymap.set({ "v", "n" }, "gra", function()
      require("actions-preview").code_actions({
        filter = function(action, _)
          return not action.disabled
        end
      })
    end
    )
    require("actions-preview").setup {
      telescope = {
        layout_strategy = "horizontal",
      }
    }
  end
}
