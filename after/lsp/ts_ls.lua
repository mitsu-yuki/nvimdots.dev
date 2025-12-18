local ft = require("core.filetypes")
vim.lsp.set_log_level("debug")
---@type vim.lsp.Config
local mise_vue_language_server = vim.env.XDG_DATA_HOME
    .. "/mise/installs/npm-vue-language-server/latest/lib/node_modules/@vue/language-server"
return {
  filetypes = ft.js_framework_like,
  init_options = {
    hostInfo = "neovim",
    plugins = {
      {
        name = "@vue/typescript-plugin",
        location = mise_vue_language_server,
        languages = { "vue" },
        configNamespace = "typescript",
      },
    },
  },
}
