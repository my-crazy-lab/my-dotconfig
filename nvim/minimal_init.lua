-- File cấu hình tối giản để kiểm tra từng plugin
vim.opt.termguicolors = true
vim.opt.background = 'dark'
vim.opt.cmdheight = 1
vim.opt.laststatus = 3
vim.opt.showmode = false
vim.opt.ruler = false
vim.opt.showcmd = false
vim.opt.fillchars = { eob = " " }
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.signcolumn = "yes"

-- Chỉ cài đặt các plugin cần thiết
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

require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'
  
  -- Thêm từng plugin một để kiểm tra
  -- use 'folke/tokyonight.nvim'
  -- use 'nvim-lualine/lualine.nvim'
  -- use 'nvim-tree/nvim-web-devicons'
  
  if packer_bootstrap then
    require('packer').sync()
  end
end)

-- Thêm autocmd để khắc phục vấn đề sau khi khởi động
vim.api.nvim_create_autocmd("VimEnter", {
  callback = function()
    vim.defer_fn(function()
      vim.cmd("redraw")
      vim.opt.cmdheight = 1
      vim.opt.laststatus = 3
      vim.cmd("echo ''")
    end, 100)
  end,
})