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
    vim.api.nvim_create_autocmd("BufWritePre", {
      buffer = bufnr,
      command = "EslintFixAll",
    })
  end,
})

-- volar take over mode
require("lspconfig").volar.setup({
  filetypes = { "vue" },
})

-- nvim-test
require("nvim-test").setup({
  run = true, -- run tests (using for debug)
  commands_create = true, -- create commands (TestFile, TestLast, ...)
  filename_modifier = ":.", -- modify filenames before tests run(:h filename-modifiers)
  silent = false, -- less notifications
  term = "terminal", -- a terminal to run ("terminal"|"toggleterm")
  termOpts = {
    direction = "vertical", -- terminal's direction ("horizontal"|"vertical"|"float")
    width = 55, -- 96, -- terminal's width (for vertical|float)
    height = 24, -- terminal's height (for horizontal|float)
    go_back = false, -- return focus to original window after executing
    stopinsert = "auto", -- exit from insert mode (true|false|"auto")
    keep_one = true, -- keep only one terminal for testing
  },
  runners = { -- setup tests runners
    typescript = "nvim-test.runners.jest",
  },
})

require("nvim-test.runners.jest"):setup({
  command = "/Users/joachimreiss/workspace/ryter/node_modules/.bin/jest", -- a command to run the test runner

  file_pattern = "\\v(__tests__/.*|(spec|test))\\.(js|jsx|coffee|ts|tsx)$", -- determine whether a file is a testfile
  find_files = { "{name}.test.{ext}", "{name}.spec.{ext}" }, -- find testfile for a file

  filename_modifier = nil, -- modify filename before tests run (:h filename-modifiers)
  working_directory = nil, -- set working directory (cwd by default)
})
