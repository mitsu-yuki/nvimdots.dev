---@module "lazy"
---@type LazySpec[]
return {
  {
    "neovim/nvim-lspconfig",
    lazy = true,
    -- ref: https://github.com/LazyVim/LazyVim/blob/86ac9989ea15b7a69bb2bdf719a9a809db5ce526/lua/lazyvim/plugins/lsp/init.lua#L5
    event = { "BufReadPre", "BufNewFile" },
    config = require("configs.nvim-lspconfig"),
    dependencies = {
      { "b0o/SchemaStore.nvim" },
    },
  },
  {
    "mfussenegger/nvim-lint",
    event = { "BufReadPre", "BufNewFile" },
    config = require("configs.nvim-lint"),
  },
  {
    "stevearc/conform.nvim",
    event = { "BufReadPre", "BufNewFile" },
    config = require("configs.conform-nvim"),
  }
}
