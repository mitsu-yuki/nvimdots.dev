---@module "lazy"
---@type LazySpec[]
return {
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
