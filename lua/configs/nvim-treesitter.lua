return function()
  require("nvim-treesitter").setup()
  vim.api.nvim_create_autocmd("FileType", {
    group = vim.api.nvim_create_augroup("nvim-treesitter-start", {}),
    callback = function()
      pcall(vim.treesitter.start)
    end,
  })
end
