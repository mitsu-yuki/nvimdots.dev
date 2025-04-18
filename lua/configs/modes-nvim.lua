return function()
  local flavour = require("catppuccin").options.flavour
  local C = require("catppuccin.palettes").get_palette(flavour)
  require("modes").setup({
    colors = {
      copy = O,
      insert = C.green,
      visual = C.mauve,
    },
    line_opacity = {
      copy = 0,
      delete = 0,
      insert = 0.18,
      visual = 0.4,
    },
    set_number = false,
    set_cursor = true,
    set_signcolumn = false,
  })
end
