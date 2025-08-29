return function()
  local cmp = require("cmp")
  local luasnip = require("luasnip")
  local cmp_autopairs = require("nvim-autopairs.completion.cmp")
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

    formatting = {
      format = require("lspkind").cmp_format({
        mode = "text_symbol",
        show_labelDetails = true,
      }),
    },
    ---@type table<string, cmp.MappingClass>
    mapping = cmp.mapping.preset.insert({
      ["<CR>"] = cmp.mapping.confirm({
        select = false,
        behavior = cmp.ConfirmBehavior.Replace,
      }),
      ["<Tab>"] = function(fallback)
        if cmp.visible() then
          cmp.select_next_item()
        elseif luasnip.expand_or_jumpable() then
          luasnip.expand_or_jump()
          -- vim.fn.feedkeys(vim.api.nvim_replace_termcodes("<Plug>luasnip-expand-or-jump", true, true, true), "")
        else
          fallback()
        end
      end,
      ["<S-Tab>"] = function(fallback)
        if cmp.visible() then
          cmp.select_prev_item()
        elseif luasnip.jumpable(-1) then
          luasnip.jump(-1)
          -- vim.fn.feedkeys(vim.api.nvim_replace_termcodes("<Plug>luasnip-jump-prev", true, true, true), "")
        else
          fallback()
        end
      end,
    }),
    ---@type cmp.SourceConfig[]
    sources = cmp.config.sources({
      { name = "nvim_lsp" },
      { name = "luasnip" },
      { name = "path" },
      { name = "lazydev", group_index = 0 },
      {
        name = "buffer",
        option = {
          get_bufnrs = function()
            return vim.api.nvim_list_bufs()
          end,
          keyword_length = 3,
        },
      },
    }),
    -- search completion
    ---@type cmp.SetupProperty
    cmp.setup.cmdline({ "/", "?" }, {
      mapping = cmp.mapping.preset.cmdline(),
      sources = {
        { name = "buffer" },
      },
    }),
    -- command line completion
    ---@type cmp.SetupProperty
    cmp.setup.cmdline(":", {
      mapping = cmp.mapping.preset.cmdline(),
      sources = cmp.config.sources({
        { name = "path" },
        { name = "cmdline" },
      }),
    }),
  })
  -- ref: https://github.com/hrsh7th/nvim-cmp/wiki/Advanced-techniques/887c198ad1fa9296d9ee60ad4c7de50fa2a7cf14#add-parentheses-after-selecting-function-or-method-item1
  ---@type cmp.Event
  cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())
end
