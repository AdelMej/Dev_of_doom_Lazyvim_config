return {
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      -- 🔒 Disable Vim's old SQL completion engine
      vim.g.loaded_sql_completion = 1
      vim.g.loaded_sql = 1
      vim.g.loaded_sql_compl = 1
      vim.g.loaded_sql_completion = 1
      return opts
    end,
  },
}
