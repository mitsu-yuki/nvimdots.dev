return function()
  require("transparent").setup({
    extra_groups = {
      "NormalFloat",
      "LazyNormal",
    },
    exclude_groups = {
      "LineNr",
      "CursorLineNr",
    },
  })
end
