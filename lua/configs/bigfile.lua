return function()
  ---@type config
  require("bigfile").setup({
    filesize = 1, -- 1MiB
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
