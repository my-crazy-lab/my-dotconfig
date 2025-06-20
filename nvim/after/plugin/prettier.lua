local statusPrettier, prettier = pcall(require, "prettier")
if not statusPrettier then return end

prettier.setup {
  bin = 'prettierd',
  filetypes = {
    'javascript',
    'javascriptreact',
    'typescript',
    'typescriptreact',
    'css',
    'json',
    'lua',   -- thêm lua nếu bạn muốn format lua bằng prettier
  },
}

-- Tự động format khi lưu file thuộc các filetypes trên
local format_group = vim.api.nvim_create_augroup("PrettierFormat", { clear = true })

vim.api.nvim_create_autocmd("BufWritePre", {
  group = format_group,
  pattern = { "*.js", "*.jsx", "*.ts", "*.tsx", "*.css", "*.json", "*.lua" },
  callback = function()
    vim.cmd("Prettier")
  end,
})

-- Fix filetype cho tsx
vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
  pattern = "*.tsx",
  callback = function()
    vim.bo.filetype = "typescriptreact"
  end,
})
