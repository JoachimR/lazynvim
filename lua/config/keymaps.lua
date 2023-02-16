-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

vim.keymap.set("i", "jj", "<Esc>:w<CR>", { noremap = true })
vim.keymap.set("i", "kk", "<Esc>:w<CR>", { noremap = true })
vim.keymap.set("i", "bb", "<Esc>:w<CR>", { noremap = true })

-- refactoring.nvim
vim.api.nvim_set_keymap(
  "v",
  "<leader>rr",
  ":lua require('refactoring').select_refactor()<CR>",
  { noremap = true, silent = true, expr = false }
)
