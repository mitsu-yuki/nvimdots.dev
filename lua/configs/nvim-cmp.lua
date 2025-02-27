return function()
  local cmp = require("cmp")
  local luasnip = require("luasnip")
  ---@type cmp.ConfigSchema
  cmp.setup({
    ---@type cmp.SnippetConfig
    snippet = {
      expand = function(args)
        luasnip.lsp_expand(args.body)
      end,
    },
    ---@type cmp.WindowConfig
    window = {
      completion = cmp.config.window.bordered(),
      documentation = cmp.config.window.bordered(),
    },
    sources = cmp.config.sources({
      { name = "nvim_lsp" },
      { name = "luasnip" },
      { name = "nvim_cmdline" },
    })
  })
end
