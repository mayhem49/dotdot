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
    -- gra code_action
    -- gri implemenation
    vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
    vim.keymap.set("n", "<leader>f", vim.lsp.buf.format, opts)

    -- At this point I really can't undestand the differences in definition vs implemenation

    --set("n", "<leader>f", function()
    --vim.lsp.buf.format()
    --end, opts)
  end
})
