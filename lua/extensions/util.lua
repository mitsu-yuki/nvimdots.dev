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
    "tyru/capture.vim",
    cmd = { "Capture" },
  },
  {
    "folke/lazydev.nvim",
    ft = "lua",
    config = require("configs.lazydev-nvim"),
  },
  {
    "nvim-telescope/telescope.nvim",
    cmd = { "Telescope" },
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons",
    },
    keys = {
      { "<C-F>", "<cmd>Telescope find_files<CR>", desc = "find files" },
      { "<C-G>", "<cmd>Telescope live_grep<CR>", desc = "live grep" },
      { "<C-T>g", "<cmd>Telescope grep_string default_text=<CR>", desc = "grep string on cursor word" },
      { "<space>b", "<cmd>Telescope buffers<CR>", desc = "buffer list" },
      { "<C-T>n", "<cmd>Telescope notify<CR>", desc = "notify list" },
    },
    config = require("configs.telescope-nvim"),
  },
  {
    "nvim-telescope/telescope-fzf-native.nvim",
    build = "make",
  },
  { "nvim-telescope/telescope-frecency.nvim" },
  {
    "vim-jp/vimdoc-ja",
    keys = {
      { "h", mode = "c" },
    },
  },
}
