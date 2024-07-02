vim.api.nvim_command([[autocmd FileType help lua vim.cmd('wincmd L')]])

-- for make build
vim.api.nvim_command([[ autocmd FileType rust compiler cargo ]])
vim.api.nvim_command([[ autocmd FileType elixir compiler mix ]])

--vim.api.nvim_command([[ autocmd QuickFixCmdPost [^l]* cwindow ]])
--automatically open trouble window when a command that populates quickfix list
vim.api.nvim_create_autocmd("QuickFixCmdPost", {
  callback = function()
    vim.cmd([[Trouble qflist open]])
  end,
})
