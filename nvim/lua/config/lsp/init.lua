-- If Neovim 0.11+ is used, use the new native vim.lsp.config API
-- otherwise, fallback to the legacy require('lspconfig') setup
local has_native_lsp = vim.lsp.config ~= nil

-- Common on_attach function to map keys when LSP attaches to a buffer
local on_attach = function(client, bufnr)
  local opts = { buffer = bufnr, remap = false }

  vim.keymap.set("n", "gd", vim.lsp.buf.definition, { desc = "LSP: Go to Definition", buffer = bufnr })
  vim.keymap.set("n", "K", vim.lsp.buf.hover, { desc = "LSP: Hover Info", buffer = bufnr })
  vim.keymap.set("n", "<leader>vws", vim.lsp.buf.workspace_symbol, { desc = "LSP: Workspace Symbol", buffer = bufnr })
  vim.keymap.set("n", "<leader>vd", vim.diagnostic.open_float, { desc = "LSP: Open Diagnostic Float", buffer = bufnr })
  vim.keymap.set("n", "[d", vim.diagnostic.goto_next, { desc = "LSP: Next Diagnostic", buffer = bufnr })
  vim.keymap.set("n", "]d", vim.diagnostic.goto_prev, { desc = "LSP: Previous Diagnostic", buffer = bufnr })
  vim.keymap.set("n", "<leader>vca", vim.lsp.buf.code_action, { desc = "LSP: Code Action", buffer = bufnr })
  vim.keymap.set("n", "<leader>vrr", vim.lsp.buf.references, { desc = "LSP: References", buffer = bufnr })
  vim.keymap.set("n", "<leader>vrn", vim.lsp.buf.rename, { desc = "LSP: Rename Symbol", buffer = bufnr })
  vim.keymap.set("i", "<C-h>", vim.lsp.buf.signature_help, { desc = "LSP: Signature Help", buffer = bufnr })

  -- Hook lsp_signature into this buffer if it's loaded
  local ok, lsp_sig = pcall(require, "lsp_signature")
  if ok then
    lsp_sig.on_attach({
      bind = true,
      handler_opts = { border = "rounded" },
      floating_window = true,
      floating_window_above_cur = true,
      hint_enable = true,
      hint_prefix = "🐼 ",
    }, bufnr)
  end
end

-- Base capabilities
local capabilities = vim.lsp.protocol.make_client_capabilities()

-- Load each language configuration
local servers = {
  clangd = require("config.lsp.clangd"),
  pyright = require("config.lsp.pyright"),
  gopls = require("config.lsp.gopls"),
  ts_ls = require("config.lsp.ts_ls"),
}

if has_native_lsp then
  for server, config in pairs(servers) do
    config.on_attach = config.on_attach or on_attach
    config.capabilities = config.capabilities or capabilities

    -- Define the configuration natively (Neovim 0.11+)
    vim.lsp.config[server] = config
    -- Enable the server
    vim.lsp.enable(server)
  end
else
  local lspconfig = require("lspconfig")
  for server, config in pairs(servers) do
    config.on_attach = config.on_attach or on_attach
    config.capabilities = config.capabilities or capabilities

    -- Fallback to the legacy setup API (Neovim <= 0.10)
    lspconfig[server].setup(config)
  end
end
