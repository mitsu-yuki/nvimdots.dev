---@module "lazy"
---@type LazySpec[]
return {
  {
    "hrsh7th/nvim-cmp",
    event = { "InsertEnter", "CmdlineEnter" },
    config = require("configs.nvim-cmp"),
  },
  -- nvim-cmp dependencies
  { "hrsh7th/cmp-nvim-lsp", event = { "InsertEnter" } },
  { "hrsh7th/cmp-buffer", event = { "InsertEnter" } },
  { "hrsh7th/cmp-path", event = { "InsertEnter" } },
  { "hrsh7th/cmp-cmdline", event = { "CmdlineEnter" } },
  -- snippet engine
  { "L3MON4D3/LuaSnip" },
  { "saadparwaiz1/cmp_luasnip" },
  {
    "neovim/nvim-lspconfig",
    lazy = true,
    -- ref: https://github.com/LazyVim/LazyVim/blob/86ac9989ea15b7a69bb2bdf719a9a809db5ce526/lua/lazyvim/plugins/lsp/init.lua#L5
    event = { "BufReadPre", "BufNewFile" },
    config = require("configs.nvim-lspconfig"),
  },
  {
    "mfussenegger/nvim-lint",
    event = { "BufWritePost", "BufReadPost", "InsertLeave" },
    config = require("configs.nvim-lint"),
  },
}
