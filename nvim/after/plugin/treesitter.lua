local status, nvim_treesitter = pcall(require, 'nvim-treesitter.configs')
if (not status) then return end

nvim_treesitter.setup {
  ensure_installed = { "go", "typescript", "c", "lua", "vim", "tsx", "html", "css" },
  highlight = {
    enable = true
  }
}
