return function()
  require("ufo").setup()
  vim.keymap.set("n", "zR", require("ufo").openAllFolds, { desc = "nvim-ufo: open all folds" })
  vim.keymap.set("n", "zM", require("ufo").closeAllFolds, { desc = "nvim-ufo: close all folds" })
end
