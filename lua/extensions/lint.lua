---@module "lazy"
---@type LazySpec[]
return {
  {
    "stevearc/conform.nvim",
    event = { "BufReadPre", "BufNewFile" },
    config = require("configs.conform-nvim"),
  },
  {
    "ray-x/lsp_signature.nvim",
    event = "InsertEnter",
    enabled = false,
    config = require("configs.lsp-signature-nvim"),
  },
  {
    "nvimdev/lspsaga.nvim",
    event = "LspAttach",
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
      "nvim-tree/nvim-web-devicons",
    },
    config = require("configs.lspsaga"),
  },
  {
    "mfussenegger/nvim-lint",
    event = { "BufReadPre", "BufNewFile" },
    config = require("configs.nvim-lint"),
  },
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
}
