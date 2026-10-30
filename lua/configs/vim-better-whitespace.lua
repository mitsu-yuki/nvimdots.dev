return function()
  vim.g.better_whitespace_enabled = 1
  vim.g.strip_whitespace_confirm = 1

  vim.g.strip_whitespace_on_save = 0
  vim.api.nvim_create_autocmd("BufWritePre", {
    group = vim.api.nvim_create_augroup("MyStripWhitespace", { clear = true }),
    callback = function()
      if vim.v.cmdbang == 1 then
        return
      end
      local bl = vim.g.better_whitespace_filetypes_blacklist or {}
      if vim.tbl_contains(bl, vim.bo.filetype) then
        return
      end
      vim.cmd("StripWhitespace")
    end,
  })
end
