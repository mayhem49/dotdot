vim.api.nvim_command([[autocmd FileType help lua vim.cmd('wincmd L')]])

-- for make build
vim.api.nvim_command([[ autocmd FileType rust compiler cargo ]])
--vim.api.nvim_command([[ autocmd FileType elixir compiler mix ]])

--vim.api.nvim_command([[ autocmd QuickFixCmdPost [^l]* cwindow ]])
--automatically open trouble window when a command that populates quickfix list
--vim.api.nvim_create_autocmd("QuickFixCmdPost", {
--callback = function()
--vim.cmd([[Trouble qflist open]])
--end,
--})

--auto format on save
--maybe other solution but it works for now
vim.api.nvim_create_autocmd("BufWritePre", {
  callback = function()
    vim.cmd([[lua vim.lsp.buf.format({ async = false })]])
  end,
})


--lsp mappings
vim.api.nvim_create_autocmd('LspAttach', {
  --group = vim.api.nvim_create_augroup("my.lsp", {}),
  callback = function(event)
    local opts = { buffer = event.buf, silent = true }
    -- grt type_definition
    -- grr references
    -- grn rename
    -- gri implemenation
    -- gra code_action
    vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
    vim.keymap.set("n", "<leader>f", vim.lsp.buf.format, opts)
    -- see actions-preview plugin configuration
    -- vim.keymap.set("n", "gra", function()
    --   vim.lsp.buf.code_action({
    --     filter = function(action, _)
    --       return not action.disabled
    --     end,
    --   })
    -- end , opts)

    -- At this point I really can't undestand the differences in definition vs implemenation

    -- trigger format without saving buffer
    vim.keymap.set("n", "<leader>f", vim.lsp.buf.format, opts)


    -- the native open_floating_preview sets concealcursor to ""
    -- this is all good until you focus on that window
    -- and then the concealed markdown backtics '````' gets un-concealed
    -- but the window height doesn't changes, and stuff gets hidden in a very small window
    -- ofcourse the alternative is to either use larger window
    local orig = vim.lsp.util.open_floating_preview
    vim.lsp.util.open_floating_preview = function(contents, syntax, opts, ...)
      local bufnr, winid = orig(contents, syntax, opts, ...)

      vim.wo[winid].concealcursor = "nc"
      -- vim.wo[winid].conceallevel = 0

      return bufnr, winid
    end
  end
})
