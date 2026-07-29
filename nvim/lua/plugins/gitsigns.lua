return {
  "lewis6991/gitsigns.nvim",
  commit = "31d6fb2d618bca1482b9f274751ead5f03461408",
  event = { "BufReadPre", "BufNewFile" },
  config = function()
    require("gitsigns").setup({
      on_attach = function(bufnr)
        local gitsigns = require("gitsigns")
        local opts = { buffer = bufnr }

        vim.keymap.set("n", "]c", function() gitsigns.nav_hunk("next") end, vim.tbl_extend("force", opts, { desc = "Next git hunk" }))
        vim.keymap.set("n", "[c", function() gitsigns.nav_hunk("prev") end, vim.tbl_extend("force", opts, { desc = "Previous git hunk" }))

        vim.keymap.set("n", "<leader>hs", gitsigns.stage_hunk, vim.tbl_extend("force", opts, { desc = "Stage git hunk" }))
        vim.keymap.set("n", "<leader>hr", gitsigns.reset_hunk, vim.tbl_extend("force", opts, { desc = "Reset git hunk" }))
        vim.keymap.set("n", "<leader>hp", gitsigns.preview_hunk, vim.tbl_extend("force", opts, { desc = "Preview git hunk" }))
        vim.keymap.set("n", "<leader>hb", function() gitsigns.blame_line({ full = true }) end, vim.tbl_extend("force", opts, { desc = "Blame line" }))
        vim.keymap.set("n", "<leader>tb", gitsigns.toggle_current_line_blame, vim.tbl_extend("force", opts, { desc = "Toggle line blame" }))
      end,
    })
  end,
}
