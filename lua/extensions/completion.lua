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
  { "hrsh7th/cmp-nvim-lsp-signature-help", event = { "InsertEnter" } },
  -- snippet engine
  { "L3MON4D3/LuaSnip" },
  { "saadparwaiz1/cmp_luasnip" },
}
