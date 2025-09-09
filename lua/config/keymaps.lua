-- File: lua/config/keymaps.lua
-- Default keymaps: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua

-- =========================
-- Run Code per Filetype
-- =========================
local function run_code()
  local ft = vim.bo.filetype
  local cmd = ""

  if ft == "python" then
    cmd = "py -3.11 " .. vim.fn.shellescape(vim.fn.expand("%"))
  elseif ft == "java" then
    local filename = vim.fn.expand("%:t")
    local classname = vim.fn.expand("%:t:r")
    local filepath = vim.fn.expand("%:p")

    local javafx_path = "C:/Users/91994/Downloads/openjfx-24.0.2_windows-x64_bin-sdk/javafx-sdk-24.0.2/lib"

    cmd = "javac --module-path "
      .. vim.fn.shellescape(javafx_path)
      .. " --add-modules=javafx.controls -d out "
      .. vim.fn.shellescape(filepath)
      .. " && java --module-path "
      .. vim.fn.shellescape(javafx_path)
      .. " --add-modules=javafx.controls -cp out "
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
  elseif ft == "html" then
    cmd = "start " .. vim.fn.expand("%:p")
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

vim.keymap.set("n", "<leader>tt", function()
  vim.cmd("ToggleTerm")
end, { desc = "Toggle terminal" })

vim.keymap.set("t", "<leader>tt", function()
  vim.cmd("ToggleTerm")
end, { desc = "Toggle terminal" })
