local config = function()
  local cmp = require('cmp')
  local luasnip = require('luasnip')


  -- sources for autocompletion
  local sources = cmp.config.sources({
    { name = "nvim_lsp" },
    { name = "luasnip" },
    { name = "path" },
    { name = "buffer" },
  })

  local snippet= {
    expand=function(args)
      luasnip.lsp_expand(args.body)
    end
  }


  local formatting={
    format= function(entry, item)
      item.menu = ({
        buffer = '[Buffer]',
        nvim_lsp = '[LSP]',
        path = '[Path]',
        luasnip = '[Snip]',
      })[entry.source.name]
      return item
    end
  }
  local mapping = {
    --   IDK what select mode do?
    ['<esc>'] = { i = cmp.mapping.abort() },
    ['<cr>'] = cmp.mapping.confirm(),
    ['<Tab>'] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      elseif luasnip.expand_or_jumpable() then
        luasnip.expand_or_jump()
      else
        fallback()
      end
    end, { 'i', 's' }),
    ['<S-Tab>'] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      elseif luasnip.jumpable(-1) then
        luasnip.jump(-1)
      else
        fallback()
      end
    end, { 'i', 's' }),
  }
  cmp.setup({
    mapping=mapping,
    formatting = formatting,
    snippet = snippet,
    sources=sources,

  })
end
return {
  "hrsh7th/nvim-cmp",
  event = { "InsertEnter", "CmdlineEnter" },
  dependencies={
    "L3MON4D3/LuaSnip",
    "hrsh7th/cmp-buffer",
    "hrsh7th/cmp-path",
    "hrsh7th/cmp-nvim-lsp",
    { "saadparwaiz1/cmp_luasnip", dependencies = { "L3MON4D3/LuaSnip" } },
  },
  config =config,

}
