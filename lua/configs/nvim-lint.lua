return function()
  local shellcheck = { "shellcheck" }
  local lint = require("lint")
  lint.linters_by_ft = {
    ansible = { "ansible_lint" },
    bash = shellcheck,
    json = { "jsonlint" },
    perl = { "perlcritic" },
    sh = shellcheck,
    txt = { "textlint" },
    markdown = { "textlint" },
    zsh = shellcheck,
  }

  local severities = {
    [0] = vim.diagnostic.severity.INFO,
    [1] = vim.diagnostic.severity.WARN,
    [2] = vim.diagnostic.severity.ERROR,
  }
  local textlint = "textlint"
  lint.linters.textlint = {
    name = "textlint",
    cmd = function()
      local local_binary = vim.fn.fnamemodify("./node_modules/.bin/" .. textlint, ":p")
      return vim.loop.fs_stat(local_binary) and local_binary or textlint
    end,
    args = {
      "--format",
      "json",
      "--stdin",
      "--stdin-filename",
      function()
        return vim.api.nvim_buf_get_name(0)
      end,
    },
    stdin = true,
    ignore_exitcode = true,
    stream = "stdout",
    parser = function(output)
      if output == "" then
        return {}
      end
      local decoded = vim.json.decode(output)
      if decoded == nil then
        return {}
      end
      local diagnostics = {}
      for _, values in ipairs(decoded) do
        for _, item in ipairs(values.messages) do
          table.insert(diagnostics, {
            message = item.message,
            code = item.ruleId,
            col = item.loc.start.column - 1,
            end_col = item.loc["end"].column - 1,
            lnum = item.loc.start.line - 1,
            end_lnum = item.loc["end"].line - 1,
            severity = severities[item.severity],
            source = textlint,
          })
        end
        return diagnostics
      end
    end,
  }
  vim.api.nvim_create_autocmd({ "BufReadPost", "InsertLeave" }, {
    callback = function()
      lint.try_lint()
    end,
  })
end
