-- ref: https://superuser.com/questions/299646/vim-make-star-command-stay-on-current-word
-- カーソル位置の単語をハイライトするやつ
vim.keymap.set(
  "n",
  "*",
  "<cmd>let @/='\\<'.expand('<cword>').'\\>'<CR>:set hlsearch<CR>",
  { desc = "Highlighting word" }
)

--ref: https://zenn.dev/vim_jp/articles/43d021f461f3a4
vim.keymap.set("n", "x", '"_x')
vim.keymap.set("x", "p", "P")
