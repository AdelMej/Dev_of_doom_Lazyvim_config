-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
--
-- Add any additional autocmds here
-- with `vim.api.nvim_create_autocmd`
--
-- Or remove existing autocmds by their group name (which is prefixed with `lazyvim_` for the defaults)
-- e.g. vim.api.nvim_del_augroup_by_name("lazyvim_wrap_spell")

-- Check if a file exists
local function file_exists(path)
  local f = io.open(path, "r")
  if f then
    f:close()
    return true
  else
    return false
  end
end

-- Search for .clang-format up the directory tree
local function find_clang_format(path)
  local dir = vim.fn.fnamemodify(path, ":p:h")
  while dir ~= "/" do
    local candidate = dir .. "/.clang-format"
    if file_exists(candidate) then
      return candidate
    end
    dir = vim.fn.fnamemodify(dir, ":h")
  end
  return nil
end

vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = "*.c,*.h,*.py",
  callback = function()
    local file = vim.fn.expand("%:p")
    local clang_file = find_clang_format(file)
    if clang_file then
      vim.fn.system("clang-format -i " .. file)
      print("Formatted " .. file .. " using " .. clang_file)
    end
  end,
})
