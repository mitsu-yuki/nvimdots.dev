return function()
  local telescope = require("telescope")
  local actions = require("telescope.actions")
  telescope.setup({
    defaults = {
      sorting_strategy = "ascending",
      scroll_strategy = "limit",
      mappings = {
        i = {
          ["<C-c>"] = { "<esc>", type = "command" },
          ["<CR>"] = { "<esc>", type = "command" },
        },
        n = {
          ["<C-c>"] = actions.close,
          ["q"] = actions.close,
        },
      },
    },
    pickers = {
      buffers = {
        initial_mode = "normal",
      },
      notify = {
        initial_mode = "normal",
      },
      find_files = {
        initial_mode = "normal",
      },
      grep_string = {
        initial_mode = "normal",
      },
      live_grep = {
        only_sort_text = true,
      },
    },
    extensions = {
      fzf = {
        fuzzy = true,
        override_generic_sorter = true,
        override_file_sorter = true,
        case_mode = "smart_case",
      },
    },
  })
  telescope.load_extension("fzf")
  telescope.load_extension("frecency")
end
