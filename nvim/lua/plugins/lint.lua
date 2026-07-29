return {
  "mfussenegger/nvim-lint",
  commit = "a219b2c9e5b4765e5c845aba119dad55806fcaf1",
  event = { "BufReadPost", "BufWritePost", "InsertLeave" },
  config = function()
    require("config.lint")
  end,
}
