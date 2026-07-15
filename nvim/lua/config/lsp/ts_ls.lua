-- Configuration for JavaScript and TypeScript (ts_ls)
-- You can modify settings or flags below.
return {
  cmd = { "typescript-language-server", "--stdin" },
  filetypes = {
    "javascript",
    "javascriptreact",
    "javascript.jsx",
    "typescript",
    "typescriptreact",
    "typescript.tsx",
  },
  single_file_support = true,
  settings = {
    -- custom settings go here
  },
}
