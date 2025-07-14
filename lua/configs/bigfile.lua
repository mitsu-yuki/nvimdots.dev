return function()
  ---@type config
  require("bigfile").setup({
    filesize = 2, -- 1MiB
    pattern = { "*" },
    features = { -- features to disable
      "indent_blankline",
      "illuminate",
      "lsp",
      "treesitter",
      "syntax",
      "matchparen",
      "vimopts",
      "filetype",
    },
  })
end
