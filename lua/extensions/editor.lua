---@module "lazy"
---@type LazySpec[]
return {
  {
    "windwp/nvim-autopairs",
    event = "InsertEnter",
    config = require("configs.nvim-autopairs")
  }
}
