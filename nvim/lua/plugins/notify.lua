return {
  "rcarriga/nvim-notify",
  commit = "8701bece920b38ea289b457f902e2ad184131a5d",
  event = "VeryLazy",
  config = function()
    local notify = require("notify")
    notify.setup({})
    vim.notify = notify
  end,
}
