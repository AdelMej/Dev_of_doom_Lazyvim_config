return {
	-- Add this to your cmp setup
local cmp = require("cmp")
cmp.setup.filetype({ "sql", "mysql", "plsql" }, {
  sources = {
    { name = "vim-dadbod-completion" },
    { name = "buffer" },
  },
})

}
