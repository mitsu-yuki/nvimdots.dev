return function()
  ---@type TodoConfig
  require("todo-comments").setup({
    highlight = {
      comments_only = false,
    },
  })
  vim.keymap.set("n", "]t", function()
    require("todo-comments").jump_next()
  end, { desc = "Next todo comment" })
  vim.keymap.set("n", "[t", function()
    require("todo-comments").jump_prev()
  end, { desc = "Previous todo comment" })
end
