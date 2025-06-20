-- Tạo file keymaps.lua nếu chưa có
local keymap = vim.keymap.set
local opts = { noremap = true, silent = true }

-- Phím tắt chung
keymap("n", "<Space>", "", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Điều hướng giữa các cửa sổ
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)

-- Điều chỉnh kích thước cửa sổ
keymap("n", "<C-Up>", ":resize -2<CR>", opts)
keymap("n", "<C-Down>", ":resize +2<CR>", opts)
keymap("n", "<C-Left>", ":vertical resize -2<CR>", opts)
keymap("n", "<C-Right>", ":vertical resize +2<CR>", opts)

-- Di chuyển văn bản trong Visual mode
keymap("v", "J", ":m '>+1<CR>gv=gv", opts)
keymap("v", "K", ":m '<-2<CR>gv=gv", opts)

-- Giữ con trỏ ở giữa khi tìm kiếm và cuộn
keymap("n", "n", "nzzzv", opts)
keymap("n", "N", "Nzzzv", opts)
keymap("n", "<C-d>", "<C-d>zz", opts)
keymap("n", "<C-u>", "<C-u>zz", opts)

-- Giữ clipboard khi paste đè lên text
keymap("v", "p", '"_dP', opts)

-- Xóa không lưu vào register
keymap("n", "<leader>d", '"_d', opts)
keymap("v", "<leader>d", '"_d', opts)

-- Format
keymap("n", "<leader>f", ":Neoformat<CR>", opts)

-- Zen Mode
keymap("n", "<leader>z", ":ZenMode<CR>", opts)

-- Telescope
keymap("n", "<leader>ff", ":Telescope find_files<CR>", opts)
keymap("n", "<leader>fg", ":Telescope live_grep<CR>", opts)
keymap("n", "<leader>fb", ":Telescope buffers<CR>", opts)
keymap("n", "<leader>fh", ":Telescope help_tags<CR>", opts)
keymap("n", "<leader>fo", ":Telescope oldfiles<CR>", opts)
keymap("n", "<leader>fc", ":Telescope commands<CR>", opts)

-- NvimTree
keymap("n", "<leader>e", ":NvimTreeToggle<CR>", opts)

-- Bufferline
keymap("n", "<S-l>", ":BufferLineCycleNext<CR>", opts)
keymap("n", "<S-h>", ":BufferLineCyclePrev<CR>", opts)
keymap("n", "<leader>c", ":bdelete!<CR>", opts)

-- LSP
keymap("n", "gd", ":lua vim.lsp.buf.definition()<CR>", opts)
keymap("n", "gr", ":lua vim.lsp.buf.references()<CR>", opts)
keymap("n", "K", ":lua vim.lsp.buf.hover()<CR>", opts)
keymap("n", "<leader>rn", ":lua vim.lsp.buf.rename()<CR>", opts)
keymap("n", "<leader>ca", ":lua vim.lsp.buf.code_action()<CR>", opts)
keymap("n", "<leader>df", ":lua vim.diagnostic.open_float()<CR>", opts)
keymap("n", "[d", ":lua vim.diagnostic.goto_prev()<CR>", opts)
keymap("n", "]d", ":lua vim.diagnostic.goto_next()<CR>", opts)

-- Git
keymap("n", "<leader>gg", ":Git<CR>", opts)
keymap("n", "<leader>gd", ":Gdiffsplit<CR>", opts)
keymap("n", "<leader>gb", ":Git blame<CR>", opts)

-- Terminal
keymap("n", "<leader>t", ":ToggleTerm<CR>", opts)
keymap("t", "<Esc>", "<C-\\><C-n>", opts)

-- Flash.nvim
keymap("n", "s", ":lua require('flash').jump()<CR>", opts)
keymap("v", "s", ":lua require('flash').jump()<CR>", opts)