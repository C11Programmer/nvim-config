-- Set leader to space
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Move down/up half a page (and keep cursor centered)
vim.keymap.set({ "n", "v" }, "<C-j>", "<C-d>zz", { desc = "Move down half a page" })
vim.keymap.set({ "n", "v" }, "<C-k>", "<C-u>zz", { desc = "Move up half a page" })
vim.keymap.set({ "n", "v" }, "<fn-j>", "<C-d>zz", { desc = "Move down half a page" })
vim.keymap.set({ "n", "v" }, "<fn-k>", "<C-u>zz", { desc = "Move up half a page" })

-- Escape aliases (useful on terminals/keyboard protocols where these no longer collapse to <Esc>)
vim.keymap.set({ "i", "v", "s", "c" }, "<C-[>", "<Esc>", { desc = "Exit to Normal mode" })
vim.keymap.set({ "i", "v", "s", "c" }, "<fn-[>", "<Esc>", { desc = "Exit to Normal mode" })

-- Open file explorer
vim.keymap.set("n", "<leader>e", vim.cmd.Ex, { desc = "Open Netrw file explorer" })

-- Show keybindings reference (KEYMAPS.md) in a floating window; q to close
vim.keymap.set("n", "<leader>k", function()
  local buf = vim.fn.bufadd(vim.fn.stdpath("config") .. "/KEYMAPS.md")
  vim.fn.bufload(buf)
  local width, height = math.floor(vim.o.columns * 0.8), math.floor(vim.o.lines * 0.8)
  vim.api.nvim_open_win(buf, true, {
    relative = "editor",
    width = width,
    height = height,
    row = math.floor((vim.o.lines - height) / 2),
    col = math.floor((vim.o.columns - width) / 2),
    border = "rounded",
    style = "minimal",
  })
  vim.wo.wrap = true
  vim.keymap.set("n", "q", "<cmd>close<CR>", { buffer = buf, silent = true })
end, { desc = "Show keybindings (KEYMAPS.md)" })
