return
{
  "kristijanhusak/vim-dadbod-ui",
  dependencies = {
    { "tpope/vim-dadbod", lazy = true },
    { "kristijanhusak/vim-dadbod-completion", ft = { "sql", "mysql", "plsql" }, lazy = true },
  },
  cmd = { "DBUI", "DBUIToggle", "DBUIAddConnection", "DBUIFindBuffer" },

  config = function()
    vim.g.dbs = {
      localdb = string.format(
        "mariadb://%s:%s@localhost/%s",
        os.getenv("DB_USER"),
        os.getenv("DB_PASS"),
        os.getenv("DB_NAME")
      ),
    }
  end,
}


