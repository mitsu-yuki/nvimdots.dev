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
      sql = { "sqruff" },
    },
  })
  vim.api.nvim_create_autocmd("BufWritePre", {
    callback = function(args)
      conform.format({ bufnr = args.buf })
    end,
  })
end
