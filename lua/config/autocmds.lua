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
  silent = true, -- less notifications
  term = "terminal", -- a terminal to run ("terminal"|"toggleterm")
  termOpts = {
    direction = "vertical", -- terminal's direction ("horizontal"|"vertical"|"float")
    width = 80, -- 96, -- terminal's width (for vertical|float)
    height = 24, -- terminal's height (for horizontal|float)
    go_back = false, -- return focus to original window after executing
    stopinsert = "auto", -- exit from insert mode (true|false|"auto")
    keep_one = true, -- keep only one terminal for testing
  },
  runners = { -- setup tests runners
    typescript = "nvim-test.runners.jest",
  },
})
--
-- -- vim.g['test#strategy'] = 'jest'
-- function FindNearestNodeModules()
--   local current_file = vim.fn.expand("%:p")
--   print(current_file)
--   local current_path = vim.fn.fnamemodify(current_file, ":h")
--   print(current_path)
--   local node_modules = vim.fn.finddir("node_modules", current_path .. ";")
--   print(node_modules)
--   return node_modules -- ~= "" and node_modules or "node_modules"
-- end
-- -- vim.g['test#javascript#jest#executable'] = FindNearestNodeModules() .. '/.bin/jest'jest
--
-- vim.keymap.set("n", "<F8>", function()
--   local current_file = vim.fn.expand("%:p")
--   print(current_file)
--   local current_path = vim.fn.fnamemodify(current_file, ":h")
--   print(current_path)
--   local node_modules = vim.fn.finddir("node_modules", current_path .. ";")
--   print(node_modules)
--   return node_modules -- ~= "" and node_modules or "node_modules"
-- end, { desc = "Say hello" })
--
-- require("nvim-test.runners.jest"):setup({
--   command = FindNearestNodeModules() .. "/.bin/jest", -- "pnpm jest", -- a command to run the test runner
require("nvim-test.runners.jest"):setup({
  command = "pnpm jest", -- a command to run the test runner

  file_pattern = "\\v(__tests__/.*|(spec|test))\\.(js|jsx|coffee|ts|tsx)$", -- determine whether a file is a testfile
  find_files = { "{name}.test.{ext}", "{name}.spec.{ext}" }, -- find testfile for a file

  filename_modifier = nil, -- modify filename before tests run (:h filename-modifiers)
  working_directory = nil, -- set working directory (cwd by default)
})

-- -- NORD THEME
-- require("nord").setup({})
-- require("lualine").setup({
--   options = {
--     theme = "nord",
--   },
-- })
-- require("bufferline").setup({
--   options = {
--     separator_style = "thin",
--   },
--   highlights = require("nord.plugins.bufferline").akinsho(),
-- })

-- atom one theme
-- require("onedark").load()
-- require("lualine").setup({
--   options = {
--     theme = "onedark",
--   },
-- })

require("typescript").setup({})
