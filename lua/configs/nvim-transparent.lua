return function()
  require("transparent").setup({
    extra_groups = {
      "LazyNormal",
    },
    exclude_groups = {
      "LineNr",
      "CursorLineNr",
    },
  })
end
