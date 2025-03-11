return function()
  ---@type NoiceConfig
  local default_opts = require("noice.config").defaults()
  local user_opts = {
    cmdline = {
      enabled = true,
      view = "cmdline_popup",
    },
    messages = {
      enabled = false,
      view = "mini",
      view_search = false,
      view_options = {
        timeout = 3000,
      },
    },
    popupmenu = {
      enabled = false,
    },
    presets = {
      lsp_doc_border = true,
    },
  }
  local options = vim.tbl_deep_extend("force", {}, default_opts, user_opts)
  require("noice").setup(options)
  vim.opt.cmdheight = 0
end
