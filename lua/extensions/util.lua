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
    config = require("configs.capture-vim"),
  },
  {
    "rktjmp/lush.nvim",
    ft = { "lua" },
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
      { "<C-G>", "<cmd>Telescope live_grep_args<CR>", desc = "live grep" },
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
  { "nvim-telescope/telescope-live-grep-args.nvim" },
  {
    "kevinhwang91/nvim-ufo",
    dependencies = "kevinhwang91/promise-async",
    event = "CursorMoved",
    config = require("configs.nvim-ufo"),
  },
  {
    "vim-jp/vimdoc-ja",
    keys = {
      { "h", mode = "c" },
    },
    config = require("configs.vimdoc-ja"),
  },
  {
    "dstein64/vim-startuptime",
    cmd = { "StartupTime" },
    config = require("configs.vim-startuptime"),
  },
  {
    "folke/which-key.nvim",
    event = { "CursorHold", "CursorHoldI" },
    init = function()
      vim.o.timeout = true
      vim.o.timeoutlen = 500
    end,
    config = require("configs.which-key"),
  },
}
