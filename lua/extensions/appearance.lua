---@module "lazy"
---@type LazySpec[]
return {
  {
    "romgrk/barbar.nvim",
    event = { "BufReadPost", "BufAdd", "BufNewFile" },
    cond = false,
    config = require("configs.barbar-nvim"),
  },
  {
    "catppuccin/nvim",
    name = "catppuccin",
    lazy = false,
    config = require("configs.catppuccin-nvim"),
  },
  {
    "lewis6991/gitsigns.nvim",
    event = { "BufReadPost", "BufAdd", "BufNewFile" },
    config = require("configs.gitsigns"),
  },
  {
    "shellRaining/hlchunk.nvim",
    event = { "BufReadPre", "BufNewFile" },
    config = require("configs.hlchunk-nvim"),
  },
  {
    "nvim-lualine/lualine.nvim",
    event = { "BufReadPost", "BufAdd", "BufNewFile" },
    config = require("configs.lualine-nvim"),
  },
  {
    "mvllow/modes.nvim",
    event = "UIEnter",
    config = require("configs.modes-nvim"),
  },
  {
    "folke/noice.nvim",
    event = "VeryLazy",
    dependencies = {
      "MunifTanjim/nui.nvim",
    },
    config = require("configs.noice-nvim"),
  },
  {
    "kevinhwang91/nvim-hlslens",
    event = "CmdlineEnter",
    config = require("configs.nvim-hlslens"),
  },
  {
    "petertriho/nvim-scrollbar",
    event = { "BufReadPost", "BufAdd", "BufNewFile" },
    config = require("configs.nvim-scrollbar"),
  },
  {
    "xiyaowong/nvim-transparent",
    lazy = false,
    config = require("configs.nvim-transparent"),
  },
  {
    "nvim-treesitter/nvim-treesitter",
    event = "BufReadPre",
    build = ":TSUpdate",
    config = require("configs.nvim-treesitter"),
  },
  {
    "nvim-treesitter/nvim-treesitter-context",
    event = "BufReadPre",
    config = require("configs.nvim-treesitter-context"),
  },
  {
    "sphamba/smear-cursor.nvim",
    event = "CursorMoved",
    config = require("configs.smear-cursor-nvim"),
  },
  {
    "ramilito/winbar.nvim",
    event = { "BufReadPost", "BufAdd", "BufNewFile" },
    config = require("configs.winbar-nvim"),
  },
}
