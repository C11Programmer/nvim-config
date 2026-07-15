-- Configuration for C / C++ (clangd)
-- You can modify settings or flags below.
return {
  cmd = {
    "clangd",
    -- Add command line arguments here, e.g., "--background-index"
  },
  filetypes = { "c", "cpp", "objc", "objcpp", "cuda", "proto" },
  single_file_support = true,
  settings = {
    -- custom settings go here
  },
}
