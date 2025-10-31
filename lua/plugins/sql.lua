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
        "mysql://localhost/hbtn_0d_tvshows"
      ),
    }
  end,
}


