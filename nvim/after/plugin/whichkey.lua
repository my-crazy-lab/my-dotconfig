local status, which_key = pcall(require, "which-key")
if (not status) then return end

which_key.setup({
  plugins = {
    marks = true,
    registers = true,
    spelling = {
      enabled = true,
      suggestions = 20,
    },
    presets = {
      operators = true,
      motions = true,
      text_objects = true,
      windows = true,
      nav = true,
      z = true,
      g = true,
    },
  },
  window = {
    border = "rounded",
    padding = { 2, 2, 2, 2 },
  },
  layout = {
    height = { min = 4, max = 25 },
    width = { min = 20, max = 50 },
    spacing = 3,
    align = "center",
  },
  ignore_missing = false,
  hidden = { "<silent>", "<cmd>", "<Cmd>", "<CR>", "call", "lua", "^:", "^ " },
  show_help = true,
  triggers = "auto",
})

-- Register key groups
which_key.register({
  ["<leader>f"] = { name = "File/Find" },
  ["<leader>g"] = { name = "Git" },
  ["<leader>l"] = { name = "LSP" },
  ["<leader>t"] = { name = "Test" },
  ["<leader>d"] = { name = "Debug" },
  ["<leader>x"] = { name = "Trouble/Diagnostics" },
  ["<leader>b"] = { name = "Buffer" },
})