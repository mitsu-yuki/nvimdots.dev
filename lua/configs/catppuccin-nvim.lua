return function()
  ---@type Catppuccin
  require("catppuccin").setup({
    flavour = "mocha",
    custom_highlights = function(colors)
      return {
        LineNr = { fg = colors.subtext0 },
      }
    end,
    transparent_background = true,
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
