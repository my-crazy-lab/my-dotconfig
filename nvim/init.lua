vim.cmd("autocmd!") -- clear all autocmd

vim.scriptencoding = 'utf-8'
vim.opt.encoding = 'utf-8'
vim.opt.fileencoding = 'utf-8'

vim.wo.number = true
vim.o.clipboard = "unnamedplus"
vim.opt.relativenumber = true

vim.opt.title = true
vim.opt.autoindent = true
vim.opt.smartindent = true
vim.opt.hlsearch = true
vim.opt.backup = false
vim.opt.showcmd = true
vim.opt.cmdheight = 1
vim.opt.laststatus = 2
vim.opt.expandtab = true
vim.opt.scrolloff = 10
vim.opt.backupskip = { '/tmp/*', '/private/tmp/*' }
vim.opt.inccommand = 'split'
vim.opt.ignorecase = true -- Case insensitive searching UNLESS /C or capital in search
vim.opt.smarttab = true
vim.opt.breakindent = true
vim.opt.shiftwidth = 2
vim.opt.tabstop = 2
vim.opt.wrap = false         -- No Wrap lines
vim.opt.backspace = { 'start', 'eol', 'indent' }
vim.opt.path:append { '**' } -- Finding files - Search down into subfolders
vim.opt.wildignore:append { '*/node_modules/*' }

-- Undercurl
vim.cmd([[let &t_Cs = "\e[4:3m"]])
vim.cmd([[let &t_Ce = "\e[4:0m"]])

vim.opt.cursorline = true
vim.opt.termguicolors = true
vim.opt.winblend = 0
vim.opt.wildoptions = 'pum'
vim.opt.pumblend = 5
vim.opt.background = 'dark'

-- Add asterisks in block comments
vim.opt.formatoptions:append { 'r' }
vim.o.guifont = "*:h12"

local status, packer = pcall(require, "packer")
if (not status) then
  print("Packer is not installed")
  return
end

vim.cmd [[packadd packer.nvim]]

packer.startup(function(use)
  use {
    'folke/trouble.nvim',
    requires = { 'nvim-tree/nvim-web-devicons' }
  }

  use 'fedepujol/move.nvim'

  use 'wbthomason/packer.nvim'
  use {
    'svrana/neosolarized.nvim',
    requires = { 'tjdevries/colorbuddy.nvim' }
  }
  use 'nvim-lualine/lualine.nvim' -- Statusline
  use 'onsails/lspkind-nvim'      -- vscode-like pictograms

  use 'nvim-pack/nvim-spectre'
  use 'nvim-lua/plenary.nvim'

  use 'hrsh7th/cmp-buffer'              -- nvim-cmp source for buffer words
  use 'hrsh7th/cmp-nvim-lsp'            -- nvim-cmp source for neovim's built-in LSP
  use 'hrsh7th/nvim-cmp'                -- Completion

  use 'neovim/nvim-lspconfig'           -- LSP
  use 'jose-elias-alvarez/null-ls.nvim' -- Use Neovim as a language server to inject LSP diagnostics, code actions, and more via Lua

  use 'williamboman/mason.nvim'
  use 'williamboman/mason-lspconfig.nvim'

  use 'nvimdev/lspsaga.nvim' -- LSP UIs
  use 'L3MON4D3/LuaSnip'

  use 'nvim-tree/nvim-web-devicons' -- File icons
  use 'nvim-telescope/telescope-file-browser.nvim'
  use 'nvim-telescope/telescope-live-grep-args.nvim'
  use 'nvim-telescope/telescope.nvim'

  use 'MunifTanjim/prettier.nvim'

  use 'windwp/nvim-autopairs'
  use 'norcalli/nvim-colorizer.lua'
  use({
    "iamcco/markdown-preview.nvim",
    run = function() vim.fn["mkdp#util#install"]() end,
  })
  use 'akinsho/nvim-bufferline.lua'
  -- use 'github/copilot.vim'

  use 'lewis6991/gitsigns.nvim'
  use 'dinhhuy258/git.nvim' -- For git blame & browse

  use 'junegunn/fzf.vim'
  use {
    'nvim-treesitter/nvim-treesitter',
    run = function()
      local ts_update = require('nvim-treesitter.install').update({ with_sync = true })
      ts_update()
    end,
  }

  use 'nvim-tree/nvim-tree.lua'
end)

-- TEST
vim.keymap.set("n", "<A-j>", function()
  print("a,b,c,d")

  -- run prettier script from lua, can work
  -- local prettierCommand = "npx prettier --write --fix ."

  -- Execute the Prettier command
  -- os.execute(prettierCommand)
end)
