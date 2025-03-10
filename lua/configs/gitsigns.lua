return function()
  ---@type Gitsigns.Config
  require("gitsigns").setup({
    on_attach = function()
      local gitsigns = require("gitsigns")
      -- next hunk
      vim.keymap.set("n", "]g", function()
        if vim.wo.diff then
          vim.cmd.normal({ "]g", bang = true })
        else
          gitsigns.nav_hunk("next")
        end
      end, { desc = "gitsigns: Jump to the next hunk" })
      -- prev hunk
      vim.keymap.set("n", "[g", function()
        if vim.wo.diff then
          vim.cmd.normal({ "[g", bang = true })
        else
          gitsigns.nav_hunk("prev")
        end
      end, { desc = "gitsigns: Preview next hunk" })
      -- aaaa
      vim.keymap.set("n", "<leader>gd", function()
        gitsigns.diffthis(nil, { split = "belowright" })
      end, { desc = "gitsigns: Show diff" })
    end,
  })
end
