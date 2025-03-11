return function()
  ---@type PluginConfig
  require("tiny-inline-diagnostic").setup({
    options = {
      multilines = { enabled = true, always_show = true },
      show_all_diags_on_cursorline = true,
      ---@param diagnostic vim.Diagnostic
      format = function(diagnostic)
        return string.format("%s (%s: %s)", diagnostic.message, diagnostic.source, diagnostic.code)
      end,
    },
  })
end
