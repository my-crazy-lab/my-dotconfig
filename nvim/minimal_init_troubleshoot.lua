-- Minimal init.lua for troubleshooting
-- Usage: nvim -u minimal_init_troubleshoot.lua

-- Basic settings
vim.opt.termguicolors = true
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.signcolumn = "yes"
vim.opt.expandtab = true
vim.opt.shiftwidth = 2
vim.opt.tabstop = 2

-- Ensure packer is installed
local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()

-- Only load essential plugins for troubleshooting
require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'
  
  -- Core plugins only
  use 'nvim-lua/plenary.nvim'
  use 'nvim-telescope/telescope.nvim'
  use 'neovim/nvim-lspconfig'
  use 'hrsh7th/nvim-cmp'
  use 'hrsh7th/cmp-nvim-lsp'
  
  if packer_bootstrap then
    require('packer').sync()
  end
end)

-- Basic keymaps
vim.g.mapleader = " "
vim.keymap.set('n', '<leader>ff', '<cmd>Telescope find_files<CR>')
vim.keymap.set('n', '<leader>fg', '<cmd>Telescope live_grep<CR>')

-- Basic LSP setup
local lspconfig = require('lspconfig')
lspconfig.tsserver.setup{}  -- Using tsserver which is the correct name

-- Print message when ready
vim.api.nvim_create_autocmd("VimEnter", {
  callback = function()
    print("Minimal config loaded successfully!")
  end,
})
