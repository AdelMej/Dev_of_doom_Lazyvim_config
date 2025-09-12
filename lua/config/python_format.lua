local null_ls = require("null-ls")

null_ls.setup({
  sources = {
    null_ls.builtins.formatting.black.with({
      extra_args = { "--line-length", "79" },
    }),
    -- optional: Ruff for diagnostics only
    null_ls.builtins.diagnostics.ruff,
  },
})
