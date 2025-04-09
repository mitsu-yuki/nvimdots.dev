return function()
  local flavour = require("catppuccin").options.flavour
  local C = require("catppuccin.palettes").get_palette(flavour)
  require("modes").setup({
    colors = {
      bg = "",
      copy = O,
      insert = C.green,
      visual = C.mauve,
    },
    set_number = true,
    set_cursor = true,
  })
end
