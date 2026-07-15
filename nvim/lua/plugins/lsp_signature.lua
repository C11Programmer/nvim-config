return {
  "ray-x/lsp_signature.nvim",
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
