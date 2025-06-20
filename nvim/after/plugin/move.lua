local status, move = pcall(require, "move")
if (not status) then return end

-- Configuration for move.nvim
move.setup({
  -- Configuration options here (if any)
})

-- Normal-mode commands
vim.keymap.set('n', '<A-j>', ':MoveLine(1)<CR>', { silent = true })
vim.keymap.set('n', '<A-k>', ':MoveLine(-1)<CR>', { silent = true })
vim.keymap.set('n', '<A-h>', ':MoveHChar(-1)<CR>', { silent = true })
vim.keymap.set('n', '<A-l>', ':MoveHChar(1)<CR>', { silent = true })

-- Visual-mode commands
vim.keymap.set('v', '<A-j>', ':MoveBlock(1)<CR>', { silent = true })
vim.keymap.set('v', '<A-k>', ':MoveBlock(-1)<CR>', { silent = true })
vim.keymap.set('v', '<A-h>', ':MoveHBlock(-1)<CR>', { silent = true })
vim.keymap.set('v', '<A-l>', ':MoveHBlock(1)<CR>', { silent = true })

-- Alternative keybindings for terminals that might conflict with Alt
vim.keymap.set('n', '<C-j>', ':MoveLine(1)<CR>', { silent = true })
vim.keymap.set('n', '<C-k>', ':MoveLine(-1)<CR>', { silent = true })
vim.keymap.set('v', 'J', ':MoveBlock(1)<CR>', { silent = true })
vim.keymap.set('v', 'K', ':MoveBlock(-1)<CR>', { silent = true })
