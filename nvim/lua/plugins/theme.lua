return {
  "folke/tokyonight.nvim",
  lazy = false,
  commit = "cdc07ac78467a233fd62c493de29a17e0cf2b2b6",
  priority = 1000, -- Make sure this loads before other plugins
  config = function()
    -- Optional configuration settings
    require("tokyonight").setup({
      style = "night", -- Options: "storm", "moon", "night", "day"
      transparent = false, -- enable/disable transparency
      terminal_colors = true, -- configure colors for terminal outputs
      styles = {
        comments = { italic = true },
        keywords = { italic = true },
        functions = {},
        variables = {},
      },
    })

    -- Load the colorscheme
    vim.cmd.colorscheme("tokyonight")
  end,
}
