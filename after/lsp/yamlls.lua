local ft = require("core.filetypes")
---@type vim.lsp.Config
return {
  filetypes = ft.yaml_like,
  settings = {
    yaml = {
      hover = true,
      completion = true,
      validate = true,
      schemas = vim.tbl_extend("force", require("schemastore").yaml.schemas(), {
        ["https://spec.openapis.org/oas/3.0/schema/2021-09-28"] = { "openapi.yaml" },
      }),
    },
  },
}
