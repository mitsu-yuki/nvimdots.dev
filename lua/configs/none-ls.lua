return function()
  local null_ls = require("null-ls")
  local formatting = null_ls.builtins.formatting
  local diagnostics = null_ls.builtins.diagnostics
  local code_actions = null_ls.builtins.code_actions

  null_ls.setup({
    sources = {
      code_actions.textlint,
      diagnostics.sqruff,
      diagnostics.textlint,
      formatting.gofmt,
      formatting.goimports,
      formatting.prettier,
      formatting.shfmt,
      formatting.sqruff,
      formatting.stylua,
      formatting.textlint,
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
