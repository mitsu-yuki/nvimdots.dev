return function()
  local null_ls = require("null-ls")
  local formatting = null_ls.builtins.formatting
  local diagnostics = null_ls.builtins.diagnostics

  local textlint = diagnostics.textlint.with({
    command = function()
      local local_binary = vim.fn.fnamemodify("./node_modules/.bin/textlint", ":p")
      return vim.loop.fs_stat(local_binary) and local_binary or "textlint"
    end,
  })

  null_ls.setup({
    sources = {
      diagnostics.ansiblelint,
      diagnostics.shellcheck,
      diagnostics.jsonlint,
      diagnostics.perlcritic,
      diagnostics.sqruff,
      textlint,
      formatting.stylua,
      formatting.shfmt,
      formatting.goimports,
      formatting.gofmt,
      formatting.sqruff,
    },
  })

  vim.api.nvim_create_autocmd("BufWritePre", {
    callback = function(args)
      vim.lsp.buf.format({ bufnr = args.buf })
    end,
  })
end
