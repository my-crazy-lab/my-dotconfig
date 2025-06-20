local status, toggleterm = pcall(require, "toggleterm")
if (not status) then return end

toggleterm.setup({
  size = 20,
  open_mapping = [[<c-\>]],
  hide_numbers = true,
  shade_filetypes = {},
  shade_terminals = true,
  shading_factor = 2,
  start_in_insert = true,
  insert_mappings = true,
  persist_size = true,
  direction = "float",
  close_on_exit = true,
  shell = vim.o.shell,
  float_opts = {
    border = "curved",
    winblend = 0,
    highlights = {
      border = "Normal",
      background = "Normal",
    },
  },
})

-- Custom terminal functions
local Terminal = require("toggleterm.terminal").Terminal

-- Lazygit terminal
local lazygit = Terminal:new({
  cmd = "lazygit",
  hidden = true,
  direction = "float",
  float_opts = {
    border = "curved",
  },
})

function _LAZYGIT_TOGGLE()
  lazygit:toggle()
end

-- Node terminal
local node = Terminal:new({
  cmd = "node",
  hidden = true,
  direction = "float",
})

function _NODE_TOGGLE()
  node:toggle()
end

-- Python terminal
local python = Terminal:new({
  cmd = "python3",
  hidden = true,
  direction = "float",
})

function _PYTHON_TOGGLE()
  python:toggle()
end

-- Keymaps
vim.keymap.set("n", "<leader>lg", "<cmd>lua _LAZYGIT_TOGGLE()<CR>", { desc = "Toggle Lazygit" })
vim.keymap.set("n", "<leader>tn", "<cmd>lua _NODE_TOGGLE()<CR>", { desc = "Toggle Node REPL" })
vim.keymap.set("n", "<leader>tp", "<cmd>lua _PYTHON_TOGGLE()<CR>", { desc = "Toggle Python REPL" })