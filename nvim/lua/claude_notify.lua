local M = {}

function M.done(message)
  vim.notify(message or "Claude Code finished", vim.log.levels.INFO, { title = "Claude Code" })
  return ""
end

return M
