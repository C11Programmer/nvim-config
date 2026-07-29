local M = {}

-- Called remotely by Claude Code's SessionStart hook (see
-- ~/.claude/hooks/session-start-nvim-context.sh) to tell Claude which files
-- are open or were recently opened in the parent Neovim instance.
function M.export_json()
  local cwd = vim.fn.getcwd()

  local open_buffers = {}
  for _, buf in ipairs(vim.api.nvim_list_bufs()) do
    if vim.api.nvim_buf_is_loaded(buf) and vim.bo[buf].buflisted then
      local name = vim.api.nvim_buf_get_name(buf)
      if name ~= "" then
        table.insert(open_buffers, name)
      end
    end
  end

  local recent_files = {}
  for _, f in ipairs(vim.v.oldfiles or {}) do
    if vim.startswith(f, cwd) and vim.fn.filereadable(f) == 1 then
      table.insert(recent_files, f)
      if #recent_files >= 50 then
        break
      end
    end
  end

  return vim.json.encode({ open_buffers = open_buffers, recent_files = recent_files })
end

return M
