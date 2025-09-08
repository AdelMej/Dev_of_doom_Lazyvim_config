local ls = require("luasnip")
local s, t, i = ls.snippet, ls.text_node, ls.insert_node

return {
  -- Main function
  s("main", {
    t({ "int main(int argc, char *argv[]) {", "\t" }),
    i(0),
    t({ "", "\treturn 0;", "}" }),
  }),

  -- Include stdio.h
  s("inc", {
    t("#include <"),
    i(1, "stdio.h"),
    t(">"),
  }),

  -- Printf
  s("pr", {
    t('printf("'),
    i(1, "Hello, world!"),
    t('");'),
    i(0),
  }),

  -- Struct
  s("struct", {
    t("typedef struct "),
    i(1, "Name"),
    t({ " {", "\t" }),
    i(2, "int field;"),
    t({ "", "} " }),
    i(1),
    t(";"),
  }),

  -- For loop
  s("fori", {
    t("for (int "),
    i(1, "i"),
    t(" = 0; "),
    t(i(1)),
    t(" < "),
    i(2, "n"),
    t("; "),
    t(i(1)),
    t("++) {"),
    t({ "", "\t" }),
    i(0),
    t({ "", "}" }),
  }),

  -- If statement
  s("if", {
    t("if ("),
    i(1, "condition"),
    t({ ") {", "\t" }),
    i(0),
    t({ "", "}" }),
  }),
}
