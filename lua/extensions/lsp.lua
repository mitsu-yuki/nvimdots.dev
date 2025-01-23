---@module "lazy"
---@type LazySpec[]
return {
  {
    "neovim/nvim-lspconfig",
    lazy = true,
    -- ref: https://github.com/LazyVim/LazyVim/blob/86ac9989ea15b7a69bb2bdf719a9a809db5ce526/lua/lazyvim/plugins/lsp/init.lua#L5
    event = { "BufReadPre", "BufNewFile" },
    config = require("configs.nvim-lspconfig")
  },
}
