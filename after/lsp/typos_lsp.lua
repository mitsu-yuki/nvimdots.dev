---@type vim.lsp.Config
return {
  init_options = {
    {
      config = vim.env.XDG_CONFIG_HOME .. "/typos-lsp/typos.toml",
      diagnosticSeverity = "Error",
    },
  },
}
