# Neovim Keymaps

Leader key: `<space>`

Hand-maintained snapshot of custom keybindings. Not auto-generated — update by hand alongside future keymap changes.

## Global / Movement

Defined in: `lua/config/keymaps.lua`

| Key | Mode | Action | Description |
|---|---|---|---|
| `<C-j>` | Normal, Visual | `<C-d>zz` | Scroll down half a page and re-center the cursor |
| `<C-k>` | Normal, Visual | `<C-u>zz` | Scroll up half a page and re-center the cursor |
| `<fn-j>` | Normal, Visual | `<C-d>zz` | Fn-key equivalent of `<C-j>` |
| `<fn-k>` | Normal, Visual | `<C-u>zz` | Fn-key equivalent of `<C-k>` |
| `<C-[>` | Insert, Visual, Select, Command-line | `<Esc>` | Exit to Normal mode (explicit alias for Esc) |
| `<fn-[>` | Insert, Visual, Select, Command-line | `<Esc>` | Fn-key equivalent of Esc |
| `<leader>e` | Normal | `vim.cmd.Ex` | Open the built-in Netrw file explorer |
| `<leader>k` | Normal | opens `KEYMAPS.md` in a floating window | Show this keybindings reference (`q` to close) |

## LSP

Defined in: `lua/config/lsp/init.lua` (buffer-local, registered via `on_attach` when an LSP client attaches)

| Key | Mode | Action | Description |
|---|---|---|---|
| `gd` | Normal | `vim.lsp.buf.definition` | Jump to the definition of the symbol under the cursor |
| `K` | Normal | `vim.lsp.buf.hover` | Show hover documentation for the symbol under the cursor |
| `<leader>vws` | Normal | `vim.lsp.buf.workspace_symbol` | Search for a symbol across the whole workspace |
| `<leader>vd` | Normal | `vim.diagnostic.open_float` | Show diagnostics for the current line in a floating window |
| `[d` | Normal | `vim.diagnostic.goto_next` | Jump to the next diagnostic in the buffer |
| `]d` | Normal | `vim.diagnostic.goto_prev` | Jump to the previous diagnostic in the buffer |
| `<leader>vca` | Normal | `vim.lsp.buf.code_action` | Show available code actions at the cursor |
| `<leader>vrr` | Normal | `vim.lsp.buf.references` | List all references to the symbol under the cursor |
| `<leader>vrn` | Normal | `vim.lsp.buf.rename` | Rename the symbol under the cursor project-wide |
| `<C-h>` | Insert | `vim.lsp.buf.signature_help` | Show function signature help while typing |

## Harpoon

Defined in: `lua/plugins/harpoon.lua`

| Key | Mode | Action | Description |
|---|---|---|---|
| `<leader>a` | Normal | `harpoon:list():add()` | Add the current file to the Harpoon list |
| `<C-e>` | Normal | `harpoon.ui:toggle_quick_menu(...)` | Toggle the Harpoon quick-menu popup |
| `<leader>1` | Normal | `harpoon:list():select(1)` | Jump to Harpoon slot 1 |
| `<leader>2` | Normal | `harpoon:list():select(2)` | Jump to Harpoon slot 2 |
| `<leader>3` | Normal | `harpoon:list():select(3)` | Jump to Harpoon slot 3 |
| `<leader>4` | Normal | `harpoon:list():select(4)` | Jump to Harpoon slot 4 |

## Terminal / ToggleTerm

Defined in: `lua/plugins/toggleterm.lua`

| Key | Mode | Action | Description |
|---|---|---|---|
| `<esc>` | Terminal | `<C-\><C-n><Cmd>ToggleTerm<CR>` | Exit terminal-insert mode and close/hide the terminal |
| `<leader>cc` | Normal | `_CLAUDE_TOGGLE()` | Toggle a dedicated floating terminal running the `claude` CLI |
| `<leader>t1` | Normal | `open_terminal(1)` | Open terminal instance 1 (styled: red border) |
| `<leader>t2` | Normal | `open_terminal(2)` | Open terminal instance 2 (styled: yellow border) |
| `<leader>t3` | Normal | `open_terminal(3)` | Open terminal instance 3 (styled: green border) |
| `<leader>t4` | Normal | `open_terminal(4)` | Open terminal instance 4 (styled: cyan border) |
| `<leader>t5` | Normal | `open_terminal(5)` | Open terminal instance 5 (styled: purple border) |
| `<M-b>` (Option+Left) | Terminal | `swap_terminal(-1)` | Switch to the previous terminal instance (1-5); no-op at instance 1 |
| `<M-f>` (Option+Right) | Terminal | `swap_terminal(1)` | Switch to the next terminal instance (1-5); no-op at instance 5 |

## Gitsigns

Defined in: `lua/plugins/gitsigns.lua` (buffer-local, registered via `on_attach` when gitsigns attaches)

| Key | Mode | Action | Description |
|---|---|---|---|
| `]c` | Normal | `gitsigns.nav_hunk("next")` | Jump to the next git hunk |
| `[c` | Normal | `gitsigns.nav_hunk("prev")` | Jump to the previous git hunk |
| `<leader>hs` | Normal | `gitsigns.stage_hunk` | Stage the hunk under the cursor |
| `<leader>hr` | Normal | `gitsigns.reset_hunk` | Reset the hunk under the cursor |
| `<leader>hp` | Normal | `gitsigns.preview_hunk` | Preview the hunk's diff in a floating window |
| `<leader>hb` | Normal | `gitsigns.blame_line({ full = true })` | Show full blame info for the current line |
| `<leader>tb` | Normal | `gitsigns.toggle_current_line_blame` | Toggle inline current-line blame |

## Telescope / Search

Defined in: `lua/plugins/telescope.lua`

| Key | Mode | Action | Description |
|---|---|---|---|
| `<leader>fg` | Normal | `require("telescope.builtin").live_grep()` | Open a floating Telescope window and live-grep (via ripgrep) across the whole project |
| `<leader>ff` | Normal | `require("telescope.builtin").find_files()` | Open a floating Telescope window to fuzzy-find files by name across the project |
