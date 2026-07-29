-- Configuration for Terraform (terraform-ls)
-- You can modify settings or flags below.
return {
  cmd = { "terraform-ls", "serve" },
  filetypes = { "terraform", "terraform-vars" },
  single_file_support = true,
}
