return function()
  ---@type oil.Config
  require("oil").setup({
    keymaps = {
      ["q"] = "actions.close",
    },
    view_options = {
      show_hidden = true,
    },
    float = {
      border = "rounded",
    },
  })
  -- Override oil command
  vim.api.nvim_create_user_command("Oil", function()
    require("oil").open_float()
  end, { desc = "Open oil file border on a directory for float window" })
end
