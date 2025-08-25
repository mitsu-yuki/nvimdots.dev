return function()
  ---@type Catppuccin
  require("catppuccin").setup({
    flavour = "mocha",
    custom_highlights = function(colors)
      return {
        CursorLine = { bg = colors.none },
        LineNr = { fg = colors.overlay0 },
      }
    end,
    transparent_background = true,
    float = {
      transparent = true,
      solid = true,
    },
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
