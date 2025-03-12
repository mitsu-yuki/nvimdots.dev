return function()
  ---@type ToggleTermConfig
  require("toggleterm").setup({
    size = 20,
    open_mapping = [[<C-]>]],
    hidde_numbers = true,
    start_in_insert = true,
    insert_mappings = true,
    terminal_mappings = true,
    direction = "float",
    close_on_exit = false,
    float_opts = {
      border = "curved",
    },
  })
end
