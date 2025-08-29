return function()
  local null_ls = require("null-ls")
  local formatting = null_ls.builtins.formatting
  local diagnostics = null_ls.builtins.diagnostics
  local code_actions = null_ls.builtins.code_actions

  null_ls.setup({
    sources = {
      diagnostics.sqruff,
      diagnostics.textlint,
      formatting.textlint,
      formatting.stylua,
      formatting.shfmt,
      formatting.goimports,
      formatting.gofmt,
      formatting.sqruff,
      code_actions.textlint,
    },
  })

  vim.api.nvim_create_autocmd("BufWritePre", {
    callback = function(args)
      if vim.v.cmdbang == 1 then
        return nil
      end

      vim.lsp.buf.format({ bufnr = args.buf })
    end,
  })
end
