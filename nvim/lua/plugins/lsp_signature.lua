return {
  "ray-x/lsp_signature.nvim",
  commit = "b7ace9ddb1640ce266012a45a672dfdaedfa5ec6",
  event = "VeryLazy",
  opts = {
    bind = true, -- This is mandatory, otherwise border config won't get registered.
    handler_opts = {
      border = "rounded",
    },
    floating_window = true, -- show hint in a floating window
    floating_window_above_cur = true, -- show window above cursor
    hint_enable = true, -- virtual hint enable
    hint_prefix = "🐼 ", -- prefix for virtual hint
  },
  config = function(_, opts)
    require("lsp_signature").setup(opts)
  end,
}
