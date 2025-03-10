return function()
  local search_hl_bg = string.format("#%06x", vim.api.nvim_get_hl(0, { name = "IncSearch" }).bg)
  require("scrollbar").setup({
    marks = {
      Search = { color = search_hl_bg },
    },
  })
end
