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
  pattern = "*.c,*.h",
  callback = function()
    local file = vim.fn.expand("%:p")
    local clang_file = find_clang_format(file)
    if clang_file then
      vim.fn.system("clang-format -i " .. file)
      print("Formatted " .. file .. " using " .. clang_file)
    end
  end,
})

vim.api.nvim_create_autocmd("FileType", {
  pattern = "python",
  callback = function()
    local file = vim.fn.expand("%:p")
    vim.b.autoformat = false
    vim.fn.system(string.format("~/.local/share/nvim/mason/bin/flake8 %s", file))
  end,
})

vim.api.nvim_create_autocmd("BufWritePost", {
  pattern = "*.py",
  callback = function()
    local file = vim.fn.expand("%:p")
    local output = vim.fn.systemlist("flake8 --max-line-length=79 " .. file)

    local messages = {}
    for _, line in ipairs(output) do
      local msg = line:match(":%d+:%d+:%s*(.*)")
      if msg then
        table.insert(messages, msg)
      end
    end

    if #messages > 0 then
      vim.api.nvim_echo({ { table.concat(messages, "\n"), "WarningMsg" } }, true, {})
    end
  end,
})

-- some plantUML feedback shenanigans
vim.api.nvim_create_autocmd("BufWritePost", {
  pattern = "*.puml",
  callback = function(opts)
    local file = vim.fn.expand("<afile>")
    local cmd = { "plantuml", file }

    vim.fn.jobstart(cmd, {
      on_exit = function(_, code)
        if code ~= 0 then
          vim.notify("PlantUML failed for " .. file, vim.log.levels.ERROR)
        else
          vim.notify("PlantUML generated PNG for " .. file, vim.log.levels.INFO)
        end
      end,
      stderr_buffered = true,
      on_stderr = function(_, data)
        if data then
          for _, line in ipairs(data) do
            if line ~= "" then
              vim.notify(line, vim.log.levels.ERROR)
            end
          end
        end
      end,
    })
  end,
})

-- Disable autoformatting for SQL files in LazyVim
vim.api.nvim_create_autocmd("FileType", {
  pattern = "sql",
  callback = function()
    vim.b.autoformat = false
  end,
})
