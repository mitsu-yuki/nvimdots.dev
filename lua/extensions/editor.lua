---@module "lazy"
---@type LazySpec[]
return {
  {
    "rhysd/conflict-marker.vim",
    event = { "BufReadPost", "BufNewFile" },
    config = function() end,
  },
  {
    "jinh0/eyeliner.nvim",
    event = { "BufRead", "BufEnter" },
    config = require("configs.eyeliner-nvim"),
  },
  {
    "monaqa/dial.nvim",
    event = { "CursorMoved" },
    config = require("configs.dial-nvim"),
  },
  {
    "ggandor/leap.nvim",
    event = { "CursorHold", "CursorHoldI" },
    config = require("configs.leap-nvim"),
  },
  {
    "windwp/nvim-autopairs",
    event = "InsertEnter",
    config = require("configs.nvim-autopairs"),
  },
  {
    "brenoprata10/nvim-highlight-colors",
    event = { "BufReadPost", "BufNewFile" },
    config = require("configs.nvim-highlight-colors"),
  },
  {
    "kylechui/nvim-surround",
    event = "CursorMoved",
    config = require("configs.nvim-surround"),
  },
  {
    "windwp/nvim-ts-autotag",
    ft = {
      "html",
      "javascriptreact",
      "typescriptreact",
      "vue",
      "svelte",
      "markdown",
    },
    event = "InsertEnter",
    dependencies = { "nvim-treesitter/nvim-treesitter" },
    config = require("configs.nvim-ts-autotag"),
  },
  {
    "stevearc/oil.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    cmd = { "Oil" },
    config = require("configs/oil-nvim"),
  },
  {
    "MeanderingProgrammer/render-markdown.nvim",
    ft = { "markdown", "Avante" },
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
      "nvim-tree/nvim-web-devicons",
    },
    config = require("configs.render-markdown"),
  },
  {
    "NStefan002/screenkey.nvim",
    cmd = "Screenkey",
    config = require("configs.screenkey"),
  },
  {
    "abecodes/tabout.nvim",
    event = "InsertEnter",
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
    },
    config = require("configs.tabout"),
  },
  {
    "folke/todo-comments.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    event = { "CursorHold", "CursorHoldI" },
    config = require("configs.todo-comments"),
  },
  {
    "akinsho/toggleterm.nvim",
    cmd = {
      "ToggleTerm",
      "TermExec",
      "ToggleTermToggleAll",
      "ToggleTermSendCurrentLine",
      "ToggleTermSendVisualLines",
      "ToggleTermSendVisualSelection",
    },
    keys = { [[<C-]>]] },
    config = require("configs.toggleterm-nvim"),
  },
  {
    "ntpeters/vim-better-whitespace",
    event = { "CursorHold", "CursorHoldI" },
    config = require("configs.vim-better-whitespace"),
  },
  {
    "RRethy/vim-illuminate",
    event = { "CursorHold", "CursorHoldI" },
    config = require("configs.vim-illuminate"),
  },
}
