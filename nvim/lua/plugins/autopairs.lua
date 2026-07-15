return {
  "windwp/nvim-autopairs",
  -- Load on startup instead of InsertEnter to prevent initialization issues
  lazy = false,
  commit = "7b9923abad60b903ece7c52940e1321d39eccc79",
  config = true, -- automatically runs require("nvim-autopairs").setup()
}
