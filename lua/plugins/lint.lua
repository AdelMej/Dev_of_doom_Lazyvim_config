return {
  {
    "mfussenegger/nvim-lint",
    config = function()
      local lint = require("lint")

      -- assign linters to filetypes
      lint.linters_by_ft = {
        html = { "markuplint", "vale" },
        markdown = { "markdownlint-cli2", "vale" },
      }

      -- auto-lint on save
      vim.api.nvim_create_autocmd({ "BufWritePost" }, {
        callback = function()
          require("lint").try_lint()
        end,
      })
    end,
  },
}
