---@module "lazy"
---@type LazySpec[]
return {
  {
    "LunarVim/bigfile.nvim",
    lazy = false,
    cond = true,
    config = require("configs.bigfile"),
  },
  {
    "folke/lazydev.nvim",
    ft = "lua",
    config = require("configs.lazydev-nvim"),
  },
  {
    "vim-jp/vimdoc-ja",
    keys = {
      { "h", mode = "c" },
    },
  },
}
