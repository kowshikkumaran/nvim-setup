-- File: lua/config/keymaps.lua (your file)
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua

-- =========================
-- Run Code per Filetype
-- =========================
local function run_code()
  local ft = vim.bo.filetype
  local cmd = ""

  if ft == "python" then
    cmd = "py -3.11 " .. vim.fn.shellescape(vim.fn.expand("%"))
  elseif ft == "java" then
    local filename = vim.fn.expand("%:t") -- e.g. Main.java
    local classname = vim.fn.expand("%:t:r") -- e.g. Main (without .java)
    local filepath = vim.fn.expand("%:p") -- full path

    -- Compile to the same directory
    cmd = "javac "
      .. vim.fn.shellescape(filepath)
      .. " && java -cp "
      .. vim.fn.shellescape(vim.fn.expand("%:p:h"))
      .. " "
      .. classname
  elseif ft == "javascript" then
    cmd = "node " .. vim.fn.shellescape(vim.fn.expand("%"))
  elseif ft == "c" then
    cmd = "gcc "
      .. vim.fn.shellescape(vim.fn.expand("%"))
      .. " -o "
      .. vim.fn.shellescape(vim.fn.expand("%:r"))
      .. " && "
      .. vim.fn.shellescape(vim.fn.expand("%:r"))
  elseif ft == "cpp" then
    cmd = "g++ "
      .. vim.fn.shellescape(vim.fn.expand("%"))
      .. " -o "
      .. vim.fn.shellescape(vim.fn.expand("%:r"))
      .. " && "
      .. vim.fn.shellescape(vim.fn.expand("%:r"))
  elseif ft == "go" then
    cmd = "go run " .. vim.fn.shellescape(vim.fn.expand("%"))
  elseif ft == "lua" then
    cmd = "lua " .. vim.fn.shellescape(vim.fn.expand("%"))
  else
    vim.notify("No run command set for filetype: " .. ft, vim.log.levels.WARN)
    return
  end

  vim.cmd("term " .. cmd)
end

vim.keymap.set("n", "<leader>r", run_code, { desc = "Run current file" })

-- =========================
-- Escape mappings
-- =========================
vim.keymap.set("i", "jj", "<Esc>", { noremap = true })
vim.keymap.set("t", "jj", [[<C-\><C-n>]], { noremap = true, silent = true })

-- =========================
-- Terminal mappings
-- =========================
vim.keymap.set("n", "<leader>tt", "<cmd>ToggleTerm<cr>", { desc = "Toggle terminal" })
vim.keymap.set("t", "<leader>tt", [[<C-\><C-n><cmd>ToggleTerm<cr>]], { desc = "Toggle terminal" })
