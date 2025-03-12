---@module "lazy"
---@type LazySpec[]
return {
  {
    "rhysd/conflict-marker.vim",
    event = { "BufReadPost", "BufNewFile" },
    config = function() end,
  },
  {
    "monaqa/dial.nvim",
    event = { "CursorMoved" },
    config = require("configs.dial-nvim"),
  },
  {
    "windwp/nvim-autopairs",
    event = "InsertEnter",
    config = require("configs.nvim-autopairs"),
  },
}
