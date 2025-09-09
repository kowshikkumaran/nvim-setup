return {
  "akinsho/toggleterm.nvim",
  version = "*",
  config = function()
    require("toggleterm").setup({
      size = 15,
      open_mapping = [[<C-/>]],
      shade_terminals = true,
      start_in_insert = true,
      persist_size = true,
      direction = "float",
      close_on_exit = true,
      shell = vim.o.shell,
    })

    -- Auto change cwd to the current file’s directory
    vim.api.nvim_create_autocmd("BufEnter", {
      callback = function()
        local bufname = vim.api.nvim_buf_get_name(0)
        if bufname ~= "" then
          vim.cmd("cd " .. vim.fn.fnamemodify(bufname, ":p:h"))
        end
      end,
    })
  end,
}
