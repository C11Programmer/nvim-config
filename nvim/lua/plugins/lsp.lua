return {
  "neovim/nvim-lspconfig",
  commit = "d5b6e3db4c17b0146f63a2fc47e2027a754b2cb1",
  dependencies = {
    -- Useful status updates for LSP
    { "j-hui/fidget.nvim", opts = {}, commit = "6f793b2bcd2d35e201c09520f698bb763220908a" },
  },
  config = function()
    require("config.lsp")
  end,
}
