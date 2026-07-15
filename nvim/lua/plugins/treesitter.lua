return {
  "nvim-treesitter/nvim-treesitter",
  -- Pin to the stable master branch for backward compatibility with configs.lua
  branch = "master",
  build = ":TSUpdate",
  config = function()
    -- Fail loudly if the configs module is missing
    local configs = require("nvim-treesitter.configs")

    configs.setup({
      -- Install parsers synchronously (only applied to `ensure_installed`)
      sync_install = false,

      -- Automatically install missing parsers when entering buffer
      auto_install = true,

      -- List of parsers to install
      ensure_installed = {
        "c",
        "lua",
        "vim",
        "vimdoc",
        "query",
        "javascript",
        "html",
        "css",
        "markdown",
        "markdown_inline",
      },

      highlight = {
        enable = true, -- false will disable the whole extension
        additional_vim_regex_highlighting = false,
      },
      indent = {
        enable = true,
      },
    })
  end,
}
