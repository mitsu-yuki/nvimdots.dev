return function()
  -- load library
  local lspconfig = require("lspconfig")
  local schemastore = require("schemastore")

  -- define variables
  local ft = require("core.filetypes")
  local capabilities = vim.tbl_deep_extend(
    "force",
    {},
    vim.lsp.protocol.make_client_capabilities(),
    require("cmp_nvim_lsp").default_capabilities()
  )

  -- define functions
  local default_opts = function(filetypes)
    ---@class lspconfig.Config
    local opts = {}
    opts.capabilities = capabilities

    if filetypes then
      opts.filetypes = filetypes
    end
    return opts
  end
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
  --- lsp server setup
  lspconfig.bashls.setup(default_opts(ft.bashls))
  lspconfig.biome.setup(default_opts(ft.js_framework_like))
  lspconfig.clangd.setup(default_opts())
  lspconfig.dockerls.setup(default_opts())
  lspconfig.golangci_lint_ls.setup(default_opts())
  lspconfig.gopls.setup(default_opts())
  lspconfig.ts_ls.setup(default_opts())
  lspconfig.jsonls.setup({
    capabilities = capabilities,
    filetypes = { "json" },
    settings = {
      json = {
        schemas = schemastore.json.schemas(),
      },
      validate = {
        enable = true,
      },
    },
  })
  lspconfig.lua_ls.setup({
    capabilities = capabilities,
    on_init = function(client)
      if client.workspace_folders then
        local path = client.workspace_folders[1].name
        if vim.uv.fs_stat(path .. "/.luarc.json") or vim.uv.fs_stat(path .. "/.luarc.jsonc") then
          return
        end
      end

      client.config.settings.Lua = vim.tbl_deep_extend("force", client.config.settings.Lua, {
        runtime = {
          -- Tell the language server which version of Lua you're using
          -- (most likely LuaJIT in the case of Neovim)
          version = "LuaJIT",
        },
        -- Make the server aware of Neovim runtime files
        workspace = {
          checkThirdParty = false,
          library = {
            vim.env.VIMRUNTIME,
            -- Depending on the usage, you might want to add additional paths here.
            "${3rd}/luv/library",
            "${3rd}/busted/library",
          },
          -- or pull in all of 'runtimepath'. NOTE: this is a lot slower and will cause issues when working on your own configuration (see https://github.com/neovim/nvim-lspconfig/issues/3189)
          -- library = vim.api.nvim_get_runtime_file("", true)
        },
      })
    end,
    settings = {
      Lua = {},
    },
  })
  ---@type lspconfig.Config
  lspconfig.yamlls.setup({
    filetypes = ft.yaml_like,
    capabilities = capabilities,
    settings = {
      yaml = {
        hover = true,
        completion = true,
        validate = true,
        schemas = schemastore.yaml.schemas(),
      },
    },
  })
  vim.cmd("LspStart")
end
