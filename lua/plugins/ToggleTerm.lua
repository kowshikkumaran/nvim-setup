return {
  "akinsho/toggleterm.nvim",
  version = "*",
  config = function()
    require("toggleterm").setup({
      size = 15,
      open_mapping = [[<C-/>]], -- LazyVim’s default
      hide_numbers = true,
      shade_terminals = true,
      start_in_insert = true,
      insert_mappings = true,
      persist_size = true,
      direction = "float", -- options: 'float' | 'horizontal' | 'vertical' | 'tab'
      close_on_exit = true,
      shell = vim.o.shell,
    })
  end,
}
