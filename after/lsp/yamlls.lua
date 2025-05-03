local ft = require("core.filetypes")
---@type vim.lsp.Config
return {
  filetypes = ft.yaml_like,
  settings = {
    yaml = {
      hover = true,
      completion = true,
      validate = true,
      schemas = require("schemastore").yaml.schemas(),
    },
  },
}
