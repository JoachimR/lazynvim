-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- source nvim config
vim.keymap.set("n", "<leader>pp", ":source $MYVIMRC<CR>", { noremap = true })

-- navigate in insert mode
vim.keymap.set("i", "jj", "<Esc>", { noremap = true })
vim.keymap.set("i", "kk", "<Esc>", { noremap = true })
vim.keymap.set("i", "bb", "<Esc>", { noremap = true })

-- trouble toggle
vim.keymap.set("n", "ttt", ":TroubleToggle<CR>", { noremap = true })

-- refactoring.nvim
vim.api.nvim_set_keymap(
  "v",
  "<leader>rr",
  ":lua require('refactoring').select_refactor()<CR>",
  { noremap = true, silent = true, expr = false, desc = "Select refactoring" }
)

-- lsp remaps
require("lspconfig")["tsserver"].setup({
  on_attach = function(_, bufnr)
    -- gx for references without telescope (telescope seems to only find TS references but no vue references)
    vim.keymap.set(
      "n",
      "gx",
      vim.lsp.buf.references,
      { noremap = true, silent = true, buffer = bufnr, desc = "Show references" }
    )

    -- F2 for next issue (like in IntelliJ)
    vim.keymap.set(
      "n",
      "<F2>",
      vim.diagnostic.goto_next,
      { noremap = true, silent = true, buffer = bufnr, desc = "Go to next issue" }
    )
  end,
  flags = {
    debounce_text_changes = 150,
  },
})

-- run tests with nvim-test
vim.keymap.set("n", "<F4>", ":w<CR>:TestNearest<CR>", { noremap = true, desc = "Test nearest" })
vim.keymap.set("n", "<F5>", ":w<CR>:TestFile<CR>", { noremap = true, desc = "Test file" })
