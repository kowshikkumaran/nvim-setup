-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local function run_code()
  local ft = vim.bo.filetype
  local cmd = ""

  if ft == "python" then
    cmd = "py -3.11 " .. vim.fn.shellescape(vim.fn.expand("%"))
  elseif ft == "java" then
    cmd = "javac " .. vim.fn.shellescape(vim.fn.expand("%")) .. " && java " .. vim.fn.shellescape(vim.fn.expand("%:r"))
  elseif ft == "javascript" then
    cmd = "node " .. vim.fn.shellescape(vim.fn.expand("%"))
  elseif ft == "html" then
    cmd = "start " .. vim.fn.shellescape(vim.fn.expand("%"))
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

vim.keymap.set("i", "jj", "<esc>", { noremap = true })
vim.keymap.set("t", "jj", "<C-\\><C-n>", { noremap = true, silent = true })
