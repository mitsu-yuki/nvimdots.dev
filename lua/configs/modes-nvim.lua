return function()
  -- local flavour = require("catppuccin").options.flavour
  local C = require("catppuccin.palettes").get_palette("mocha")
  require("modes").setup({
    -- colors = {
    --   bg = "",
    --   copy = O,
    --   insert = C.green,
    --   visual = C.mauve,
    -- },
    -- set_number = false,
    -- set_cursor = false,
  })
end
