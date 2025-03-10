return function()
  ---@type Catppuccin
  require("catppuccin").setup({
    flavour = "mocha",
    transparent_background = false,
    integrations = {
      avante = true,
      barbar = true,
      cmp = true,
      gitsigns = true,
      illuminate = {
        enabled = true,
        lsp = false,
      },
      leap = true,
      lsp_saga = true,
      lsp_trouble = true,
      noice = true,
      telescope = {
        enabled = true,
      },
      which_key = true,
    },
  })
  vim.cmd.colorscheme("catppuccin")
end
