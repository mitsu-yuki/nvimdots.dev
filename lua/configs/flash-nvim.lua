return function()
  ---@type Flash.Config
  require("flash").setup({
    modes = {
      char = {
        enabled = false,
      },
    },
  })
end
