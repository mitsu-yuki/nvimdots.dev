return function()
  local conform = require("conform")
  local shfmt = { "shfmt" }
  conform.setup({
    formatters_by_ft = {
      lua = { "stylua" },
      sh = shfmt,
      bash = shfmt,
      zsh = shfmt,
      go = { "goimports", "gofmt" },
    },
  })
end
