return {
  "akinsho/toggleterm.nvim",
  commit = "50ea089fc548917cc3cc16b46a8211833b9e3c7c",
  keys = { "<leader>cc", "<leader>t1", "<leader>t2", "<leader>t3", "<leader>t4", "<leader>t5" },
  config = function()
    require("toggleterm").setup({
      -- size can be a number or function which is passed the current terminal
      size = 20,
      hide_numbers = true, -- hide the number column in toggleterm buffers
      shade_filetypes = {},
      autochdir = true, -- when neovim changes it's directory, toggleterm will change it's directory too
      shade_terminals = true,
      start_in_insert = true,
      insert_mappings = true, -- whether or not the open mapping applies in insert mode
      terminal_mappings = true, -- whether or not the open mapping applies in the opened terminals
      persist_size = true,
      persist_mode = false, -- if set to true (default) the previous terminal mode will be remembered
      direction = "float",
      close_on_exit = true, -- close the terminal window when the process exits
      shell = vim.o.shell, -- change the default shell
      float_opts = {
        border = "curved",
        winblend = 0,
      },
    })

    local terminal = require("toggleterm.terminal")

    local terminal_styles = {
      [1] = { display_name = "Terminal 1", highlights = { FloatBorder = { guifg = "#f7768e" } } }, -- red
      [2] = { display_name = "Terminal 2", highlights = { FloatBorder = { guifg = "#e0af68" } } }, -- yellow
      [3] = { display_name = "Terminal 3", highlights = { FloatBorder = { guifg = "#9ece6a" } } }, -- green
      [4] = { display_name = "Terminal 4", highlights = { FloatBorder = { guifg = "#7dcfff" } } }, -- cyan
      [5] = { display_name = "Terminal 5", highlights = { FloatBorder = { guifg = "#9d7cd8" } } }, -- purple
    }

    local function new_terminal(id, style)
      local term = terminal.Terminal:new(vim.tbl_extend("force", { id = id }, style))
      term:open()
      -- scheduled so it applies after this callback finishes; a direct call
      -- here gets clobbered by toggleterm's own mode handling on first spawn
      vim.schedule(function() vim.cmd("startinsert") end)
      return term
    end

    local function open_terminal(id)
      local style = terminal_styles[id]
      if not style then return end

      local term = terminal.get(id, true)
      if term then
        term.display_name = style.display_name
        term.highlights = style.highlights
        term:open()
      else
        term = new_terminal(id, style)
      end
      return term
    end

    local function swap_terminal(step)
      local id = terminal.identify()
      if not id then return end

      local next_id = id + step
      if not terminal_styles[next_id] then return end

      local current = terminal.get(id, true)
      if current then current:close() end

      open_terminal(next_id)
    end

    vim.api.nvim_create_autocmd("TermOpen", {
      pattern = "term://*",
      callback = function()
        local opts = { buffer = 0 }
        vim.keymap.set("t", "<esc>", [[<C-\><C-n><Cmd>ToggleTerm<CR>]], opts)
        vim.keymap.set("t", "<M-h>", function() swap_terminal(-1) end, { buffer = 0, desc = "Switch to previous terminal" })
        vim.keymap.set("t", "<M-j>", function() swap_terminal(-1) end, { buffer = 0, desc = "Switch to previous terminal" })
        vim.keymap.set("t", "<M-k>", function() swap_terminal(1) end, { buffer = 0, desc = "Switch to next terminal" })
        vim.keymap.set("t", "<M-l>", function() swap_terminal(1) end, { buffer = 0, desc = "Switch to next terminal" })

      end,
    })

    local Terminal = terminal.Terminal
    local claude_terminal = Terminal:new({
      id = 10,
      cmd = "claude",
      direction = "float",
      hide_numbers = true,
      float_opts = {
        border = "curved",
      },
    })

    function _CLAUDE_TOGGLE()
      claude_terminal:toggle()
    end

    vim.keymap.set("n", "<leader>cc", "<cmd>lua _CLAUDE_TOGGLE()<CR>", { desc = "Toggle Claude Code terminal" })
    vim.keymap.set("n", "<leader>t1", function() open_terminal(1) end, { desc = "Open terminal 1" })
    vim.keymap.set("n", "<leader>t2", function() open_terminal(2) end, { desc = "Open terminal 2" })
    vim.keymap.set("n", "<leader>t3", function() open_terminal(3) end, { desc = "Open terminal 3" })
    vim.keymap.set("n", "<leader>t4", function() open_terminal(4) end, { desc = "Open terminal 4" })
    vim.keymap.set("n", "<leader>t5", function() open_terminal(5) end, { desc = "Open terminal 5" })
  end,
}
