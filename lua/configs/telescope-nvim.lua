return function()
  local telescope = require("telescope")
  local actions = require("telescope.actions")
  local lga_actions = require("telescope-live-grep-args.actions")
  telescope.setup({
    defaults = {
      sorting_strategy = "ascending",
      scroll_strategy = "limit",
      layout_strategy = "flex",
      layout_config = {
        flex = {
          vertical = {
            prompt_position = "bottom",
            preview_height = 0.3,
          },
        },
      },
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
      live_grep_args = {
        auto_quoting = true,
        mappings = {
          i = {
            ["<C-k>"] = lga_actions.quote_prompt(),
          },
        },
      },
    },
  })
  telescope.load_extension("fzf")
  telescope.load_extension("frecency")
  telescope.load_extension("live_grep_args")
end
