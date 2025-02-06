local statusPrettier, prettier = pcall(require, "prettier")
if (not statusPrettier) then return end

prettier.setup {
  bin = 'prettierd',
  filetypes = {
    'javascript',
    'javascriptreact',
    'typescripte',
    'typescriptreact',
    'css',
    'json'
  }
}
-- vim.api.nvim_exec([[
--  augroup AutoFormat
--    autocmd!
--    autocmd BufWritePre *.lua Prettier
--  augroup END
-- ]], false)

vim.g['prettier#autoformat'] = 1
vim.g['prettier#autoformat_require_pragma'] = 0
vim.g['prettier#exec_cmd_path'] = 'prettier'
vim.g['prettier#exec_args'] = '--parser lua'
vim.api.nvim_exec([[
    autocmd BufRead,BufNewFile *.tsx set filetype=typescriptreact
]], false)

-- null-ls
local null_ls = require("null-ls")
local group = vim.api.nvim_create_augroup("lsp_format_on_save", { clear = false })
local event =
"BufWritePre"               -- or "BufWritePost"
local async = event == "BufWritePost"

null_ls.setup({
  sources = {
    null_ls.builtins.formatting.prettier,
    null_ls.builtins.formatting.stylua,
    null_ls.builtins.diagnostics.eslint,
    null_ls.builtins.completion.spell,
  },
})
