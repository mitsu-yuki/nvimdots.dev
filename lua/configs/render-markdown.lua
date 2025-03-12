return function()
  ---@type render.md.UserConfig
  require("render-markdown").setup({
    file_types = { "markdown", "Avante" },
    code = {
      disable_background = {},
      left_margin = 1,
    },
  })
end
