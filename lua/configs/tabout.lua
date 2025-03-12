return function()
  ---@type TaboutOptions
  require("tabout").setup({
    tabkey = "<Tab>",
    backwards_tabkey = "<S-Tab>",
    act_as_tab = true,
    act_as_shift_tab = false,
    completion = true,
    default_tab = "<C-t>",
    default_shift_tab = "<C-d>",
    enable_backwards = true,
  })
end
