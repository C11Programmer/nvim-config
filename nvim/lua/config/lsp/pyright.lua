-- Configuration for Python (pyright)
-- You can modify settings or flags below.
return {
  cmd = { "pyright-langserver", "--stdin" },
  filetypes = { "python" },
  single_file_support = true,
  settings = {
    python = {
      analysis = {
        autoSearchPaths = true,
        useLibraryCodeForTypes = true,
        diagnosticMode = "openFilesOnly", -- or "workspace"
      },
    },
  },
}
