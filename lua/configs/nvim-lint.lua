return function()
  local shellcheck = { "shellcheck" }
  local lint = require("lint")
  lint.linters_by_ft = {
    ansible = { "ansible_lint" },
    bash = shellcheck,
    go = { "golangcilint" },
    json = { "jsonlint" },
    perl = { "perlcritic" },
    sh = shellcheck,
    zsh = shellcheck,
  }
  vim.api.nvim_create_autocmd({"BufReadPost", "InsertLeave"}, {
    callback = function()
      lint.try_lint()
    end
  })
end
