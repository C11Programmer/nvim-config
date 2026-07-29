# External Dependencies

Tools this config expects to be installed outside of Neovim itself. Hand-maintained snapshot — not auto-generated, update by hand if you add a new LSP server, linter, or plugin with an external binary requirement. Status reflects what's installed on this machine as of 2026-07-15; a missing tool only breaks the specific feature that needs it, not the rest of the config.

## Core

Required for the config to load and for plugins to install/build.

| Tool | Used for | Install | Status |
|---|---|---|---|
| git | Bootstraps lazy.nvim and clones/updates all plugins | Pre-installed on macOS, or `brew install git` | ✅ Found |
| C compiler (`cc`) | Compiles Tree-sitter parsers on `:TSUpdate` | Xcode Command Line Tools: `xcode-select --install` | ✅ Found |

## Search

| Tool | Used for | Install | Status |
|---|---|---|---|
| ripgrep (`rg`) | Powers Telescope's `<leader>fg` live grep | `brew install ripgrep` | ✅ Found |

Config: `lua/plugins/telescope.lua`

## LSP servers

| Tool | Language(s) | Install | Status |
|---|---|---|---|
| clangd | C, C++, Objective-C/C++, CUDA, proto | `brew install llvm`, or via Xcode | ✅ Found |
| gopls | Go | `go install golang.org/x/tools/gopls@latest` | ✅ Found |
| pyright (`pyright-langserver`) | Python | `npm install -g pyright` | ❌ Not found |
| typescript-language-server | JavaScript, TypeScript, JSX/TSX | `npm install -g typescript-language-server typescript` | ❌ Not found |

Config: `lua/config/lsp/clangd.lua`, `gopls.lua`, `pyright.lua`, `ts_ls.lua`. Missing a server means no LSP features (hover, go-to-definition, diagnostics, etc.) for that language's files — everything else keeps working.

## Linters

| Tool | Used for | Install | Status |
|---|---|---|---|
| golangci-lint | Go linting via nvim-lint | `brew install golangci-lint` | ❌ Not found |

Config: `lua/config/lint/init.lua`

## Terminal integrations

| Tool | Used for | Install | Status |
|---|---|---|---|
| claude (Claude Code CLI) | `<leader>cc` dedicated terminal | https://claude.com/claude-code | ✅ Found |

Config: `lua/plugins/toggleterm.lua`
