-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here

local util = require("lspconfig.util")

require("lspconfig").tsserver.setup({
  root_dir = function(fname)
    return util.root_pattern(".git")(fname)
  end,
})

-- format on save
require("lspconfig").eslint.setup({
  on_attach = function(_, bufnr)
    vim.api.nvim_create_autocmd("BufWritePost", {
      buffer = bufnr,
      command = "EslintFixAll",
    })
  end,
})
