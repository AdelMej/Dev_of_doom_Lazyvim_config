return {
  {
    "mfussenegger/nvim-lint",
    config = function()
      local lint = require("lint")

      -- assign linters to filetypes
      lint.linters_by_ft = {
        htmldjango = { "djlint" },
        python = { "flake8" },
        html = { "markuplint", "vale" },
        markdown = { "markdownlint-cli2", "vale" },
        css = { "stylelint" },
        scss = { "stylelint" },
        javascript = { "eslint_d" },
        typescript = { "eslint_d" },
        javascriptreact = { "eslint_d" },
        typescriptreact = { "eslint_d" },
        dockerfile = { "hadolint" },
        yaml = { "yamllint" },
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
