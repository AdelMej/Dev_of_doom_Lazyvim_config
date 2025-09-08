local ls = require("luasnip")
local s, t, i = ls.snippet, ls.text_node, ls.insert_node

return {
  s("cssreset", {
    t("* {"),
    t({ "", "    margin: 0;" }),
    t({ "    padding: 0;" }),
    t({ "    box-sizing: border-box;" }),
    t({ "    font-family: " }),
    i(1, "Arial, sans-serif"),
    t(";"),
    t({ "", "}" }),
    i(0),
  }),
}
