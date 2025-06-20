-- Tạo file mới để cấu hình ts_context_commentstring
local status, ts_context = pcall(require, "ts_context_commentstring")
if (not status) then return end

-- Cấu hình mới cho ts_context_commentstring
ts_context.setup {
  enable_autocmd = false,
  languages = {
    typescript = '// %s',
    typescriptreact = '// %s',
    javascript = '// %s',
    javascriptreact = '// %s',
    tsx = '// %s',
    jsx = '// %s',
    css = '/* %s */',
    scss = '/* %s */',
    html = '<!-- %s -->',
    svelte = '<!-- %s -->',
    vue = '<!-- %s -->',
    lua = '-- %s',
    python = '# %s',
    go = '// %s',
    rust = '// %s',
    java = '// %s',
  },
}

-- Cấu hình cho plugin comment.nvim nếu bạn đang sử dụng
local status_comment, comment = pcall(require, "Comment")
if status_comment then
  comment.setup({
    pre_hook = require('ts_context_commentstring.integrations.comment_nvim').create_pre_hook(),
  })
end