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

return {
  "LazyVim/LazyVim",
  opts = function(_, opts)
    local map = vim.keymap.set
    local opts = { noremap = true, silent = true }

    --  Normal mode basics
    map("n", "<leader>w", "<cmd>w<cr>", { desc = "Save file" })
    map("n", "<leader>q", "<cmd>q<cr>", { desc = "Quit window" })

    --  Terminal mode basics
    -- Escape to Normal mode
    map("t", "<Esc>", [[<C-\><C-n>]], { desc = "Exit terminal mode" })

    -- Window navigation from terminal
    map("t", "<C-h>", [[<C-\><C-n><C-w>h]], { desc = "Go left" })
    map("t", "<C-j>", [[<C-\><C-n><C-w>j]], { desc = "Go down" })
    map("t", "<C-k>", [[<C-\><C-n><C-w>k]], { desc = "Go up" })
    map("t", "<C-l>", [[<C-\><C-n><C-w>l]], { desc = "Go right" })

    map("n", "<leader>tt", "<cmd>terminal<cr>", { desc = "New terminal" })
    map("t", "<CR>", "<CR>", { desc = "Send Enter inside terminal" })
  end,
}
