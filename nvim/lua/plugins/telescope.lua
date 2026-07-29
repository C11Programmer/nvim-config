return {
  "nvim-telescope/telescope.nvim",
  commit = "427b576c16792edad01a92b89721d923c19ad60f",
  keys = { "<leader>ff", "<leader>fg" },
  dependencies = {
    { "nvim-lua/plenary.nvim", commit = "74b06c6c75e4eeb3108ec01852001636d85a932b" },
  },
  config = function()
    require("telescope").setup({})

    -- Keymaps
    vim.keymap.set("n", "<leader>fg", function() require("telescope.builtin").live_grep() end, { desc = "Telescope: Live grep (project-wide)" })
    vim.keymap.set("n", "<leader>ff", function() require("telescope.builtin").find_files() end, { desc = "Telescope: Find files" })
  end,
}
