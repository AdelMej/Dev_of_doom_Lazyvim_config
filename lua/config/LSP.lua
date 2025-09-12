local lspconfig = require("lspconfig")

lspconfig.clangd.setup({
  cmd = { "clangd", "--compile-commands-dir=build" }, -- points to your compile_commands.json
  filetypes = { "c", "cpp", "objc", "objcpp" },
  root_dir = lspconfig.util.root_pattern("CMakeLists.txt", ".git"),
})
