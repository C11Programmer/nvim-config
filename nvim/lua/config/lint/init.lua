local lint = require("lint")

-- Map filetypes to the linter(s) that should run against them.
-- To add a new language: add a `filetype = { "linter_name" }` entry here,
-- e.g. javascript/typescript = { "eslint_d" }, python = { "ruff" }, etc.
-- See :help nvim-lint-linters for the full list of built-in linters.
lint.linters_by_ft = {
  go = { "golangcilint" },
  terraform = { "tflint" },
  ["terraform-vars"] = { "tflint" },
}

local lint_augroup = vim.api.nvim_create_augroup("nvim-lint", { clear = true })

vim.api.nvim_create_autocmd({ "BufReadPost", "BufWritePost", "InsertLeave" }, {
  group = lint_augroup,
  callback = function()
    lint.try_lint()
  end,
})
