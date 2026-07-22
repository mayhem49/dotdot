return {
  on_attach = function(client, bufnr)
    vim.api.nvim_buf_create_user_command(bufnr, 'LspTypescriptSourceAction', function()
      vim.lsp.buf.code_action({ context = { only = { "quickfix", "source" } }, })
    end, {})
  end
}
