return function()
  -- load library
  require("lspconfig")

  -- keymapping
  --ref: https://github.com/neovim/nvim-lspconfig/blob/796394fd19fb878e8dbc4fd1e9c9c186ed07a5f4/README.md#suggested-configuration
  -- Global mappings.
  -- See `:help vim.diagnostic.*` for documentation on any of the below functions
  vim.keymap.set("n", "<space>e", vim.diagnostic.open_float, { desc = "Open float window" })
  vim.keymap.set("n", "[d", function()
    vim.diagnostic.jump({ count = -1, float = { border = "rounded" } })
  end, { desc = "Previous diagnostic" })
  vim.keymap.set("n", "]d", function()
    vim.diagnostic.jump({ count = 1, float = { border = "rounded" } })
  end, { desc = "Next diagnostic" })

  ---@type vim.diagnostic.Opts
  vim.diagnostic.config({
    virtual_text = false,
    virtual_lines = {
      format = function(diagnostic)
        return string.format("%s (%s: %s)", diagnostic.message, diagnostic.source, diagnostic.code)
      end,
    },
    signs = {
      text = {
        [vim.diagnostic.severity.ERROR] = "",
        [vim.diagnostic.severity.WARN] = "",
        [vim.diagnostic.severity.INFO] = "",
        [vim.diagnostic.severity.HINT] = "",
      },
    },
  })
  -- lsp server setup
  -- common settings
  vim.lsp.config("*", {
    capabilities = vim.tbl_deep_extend(
      "force",
      {},
      vim.lsp.protocol.make_client_capabilities(),
      require("cmp_nvim_lsp").default_capabilities()
    ),
  })

  local enabled_language_server = {
    "ansiblels",
    "bashls",
    "biome",
    "clangd",
    "dockerls",
    "golangci_lint_ls",
    "gopls",
    "jsonls",
    "lua_ls",
    "sqruff",
    "tailwindcss",
    "taplo",
    "ts_ls",
    "typos_lsp",
    "unocss",
    "yamlls",
  }

  vim.lsp.enable(enabled_language_server)
  vim.cmd("LspStart")
end
