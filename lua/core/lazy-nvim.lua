-- ref: https://github.com/yuucu/dotfiles/blob/79adcdebf7bc36b7cb6e14c2bbcf157ebb12a54f/config/nvim/lua/lazyvim.lua

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

---@module "lazy"
---@type LazySpec
local opts = {
  spec = {
    { import = "plugins.lsp" },
    { import = "plugins.dev" },
  },
  defaults = {
    lazy = true,
  },
  performance = {
    cache = {
      enabled = true,
    },
    rtp = {
      disabled_plugins = {
        "gzip",
        "man",
        "rplugin",
        "matchit",
        "netrwPlugin",
        "tarPlugin",
        "tohtml",
        "tutor",
        "zipPlugin",
      },
    },
  },
  ui = {
    border = "single",
  },
}

require("lazy").setup(opts)
