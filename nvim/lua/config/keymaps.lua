-- Set leader to space
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Move down/up half a page (and keep cursor centered)
vim.keymap.set({ "n", "v" }, "<C-j>", "<C-d>zz", { desc = "Move down half a page" })
vim.keymap.set({ "n", "v" }, "<C-k>", "<C-u>zz", { desc = "Move up half a page" })

-- Open file explorer
vim.keymap.set("n", "<leader>e", vim.cmd.Ex, { desc = "Open Netrw file explorer" })
