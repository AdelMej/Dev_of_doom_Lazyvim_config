return {
  -- 🗄️ Core database engine (must load before UI)
  {
    "tpope/vim-dadbod",
    lazy = true,
    cmd = { "DB", "DBUI", "DBUIToggle", "DBUIAddConnection" },
  },

  -- 🧭 Database UI
  {
    "kristijanhusak/vim-dadbod-ui",
    dependencies = {
      "tpope/vim-dadbod",
      "kristijanhusak/vim-dadbod-completion",
    },
    init = function()
      vim.g.db_ui_use_nerd_fonts = 1
      vim.g.dbs = {
        dev = "mysql://user:password@localhost:3306/mydatabase",
        staging = "postgresql://user:password@192.168.1.100:5432/stagingdb",
      }
    end,
  },

  -- ✍️ SQL completion
  {
    "kristijanhusak/vim-dadbod-completion",
    ft = { "sql", "mysql", "plsql" },
    config = function()
      vim.api.nvim_create_autocmd("FileType", {
        pattern = { "sql", "mysql", "plsql" },
        callback = function()
          require("cmp").setup.buffer({
            sources = { { name = "vim-dadbod-completion" } },
          })
        end,
      })
    end,
  },
}
