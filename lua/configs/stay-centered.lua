return function()
  require("stay-centered").setup({})

  vim.api.nvim_create_user_command("StayCenteredEnable", function()
    require("stay-centered").enable()
  end, { desc = "Enable stay-centered" })
  vim.api.nvim_create_user_command("StayCenteredDisable", function()
    require("stay-centered").disable()
  end, { desc = "Disable stay-centered" })
  vim.api.nvim_create_user_command("StayCenteredToggle", function()
    require("stay-centered").toggle()
  end, { desc = "Toggle stay-centered" })
end
