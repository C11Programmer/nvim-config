-- Set tabs to be 4 spaces
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

-- Enable autoindent
vim.opt.autoindent = true
vim.opt.smartindent = true

-- Enable line numbers and relative numbers (highly recommended for jumping around)
vim.opt.number = true
vim.opt.relativenumber = true

-- Enable true color support
vim.opt.termguicolors = true

-- Highlight search matches
vim.opt.hlsearch = true
vim.opt.incsearch = true

-- Use system clipboard
vim.opt.clipboard = "unnamedplus"

-- Save undo history
vim.opt.undofile = true

-- Keep 8 lines of context above/below the cursor when scrolling
vim.opt.scrolloff = 8

-- Native completion popup: don't auto-select, show docs in a popup, fuzzy-match candidates
vim.opt.completeopt = "menuone,noselect,popup,fuzzy"
