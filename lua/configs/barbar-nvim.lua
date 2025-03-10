return function()
  ---@type barbar.Config
  require("barbar").setup({
    highlight_visible = false,
    icons = {
      buffer_number = true,
      gitsigns = {
        added = { enabled = false },
        changed = { enabled = false },
        deleted = { enabled = false },
      },
      filetype = {
        custom_colors = false,
        enabled = true,
      },
    },
  })
  require("transparent").clear_prefix("Buffer")
  -- 文字色の背景ハイライト削除
  vim.api.nvim_create_autocmd({
    "BufEnter",
    "BufWinEnter",
    "BufWinLeave",
    "BufWritePost",
    "TabEnter",
    "VimResized",
    "WinEnter",
    "WinLeave",
    "User",
  }, {
    callback = vim.schedule_wrap(function()
      require("transparent").clear_prefix("DevIcon")
    end),
    group = "barbar_render",
  })
  vim.keymap.set("n", "<Space>n", "<Cmd>BufferNext<CR>", { desc = "Move next buffer" })
  vim.keymap.set("n", "<Space>p", "<Cmd>BufferPrevious<CR>", { desc = "Move previous buffer" })
  vim.keymap.set("n", "<Space>w", "<Cmd>BufferClose<CR>", { desc = "Close buffer" })
  vim.keymap.set("n", "<Space>W", "<Cmd>BufferRestore<CR>", { desc = "Move previous buffer" })
end
