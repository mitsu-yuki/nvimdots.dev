---@module "lazy"
---@type LazySpec[]
return {
  {
    "kevinhwang91/nvim-bqf",
    event = "FileType qf",
    config = require("configs.nvim-bqf"),
  },
  {
    "stevearc/quicker.nvim",
    event = "FileType qf",
    config = require("configs.quicker-nvim"),
  },
}
