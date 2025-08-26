---@module "lazy"
---@type LazySpec[]
return {
  {
    "yetone/avante.nvim",
    cmd = {
      "AvanteAsk",
      "AvanteBuild",
      "AvanteChat",
      "AvanteEdit",
      "AvanteFocus",
      "AvanteRefresh",
      "AvanteSwitchProvider",
      "AvanteShowRepoMap",
      "AvanteToggle",
    },
    build = "make",
    dependencies = {
      "stevearc/dressing.nvim",
      "nvim-lua/plenary.nvim",
      "MunifTanjim/nui.nvim",
    },
    cond = function()
      local ollama_host = os.getenv("OLLAMA_HOST")
      if ollama_host ~= nil then
        return true
      else
        return false
      end
    end,
    config = require("configs.avante-nvim"),
  },
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
  { "onsails/lspkind.nvim", event = { "InsertEnter" } },
  -- snippet engine
  { "L3MON4D3/LuaSnip" },
  { "rafamadriz/friendly-snippets", event = { "InsertEnter", "CmdlineEnter" } },
  { "saadparwaiz1/cmp_luasnip",     event = { "InsertEnter" } },
  {
    "TabbyML/vim-tabby",
    lazy = false,
    cond = function()
      local ollama_host = os.getenv("ENABLE_TABBY")
      if ollama_host ~= nil then
        return true
      else
        return false
      end
    end,
    tag = "1.4.0",
    init = function()
      vim.g.tabby_keybinding_accept = "<C-f>"
      vim.g.tabby_agent_start_command = { "tabby-agent", "--stdio" }
      vim.g.tabby_inline_completion_trigger = "auto"
    end,
    config = require("configs.vim-tabby"),
  },
}
