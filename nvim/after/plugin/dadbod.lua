-- Cấu hình cho vim-dadbod và vim-dadbod-ui
vim.g.db_ui_save_location = vim.fn.stdpath("config") .. "/db_ui"
vim.g.db_ui_use_nerd_fonts = 1
vim.g.db_ui_show_database_icon = 1
vim.g.db_ui_force_echo_notifications = 1
vim.g.db_ui_win_position = "left"
vim.g.db_ui_winwidth = 40

-- Keymaps
vim.keymap.set("n", "<leader>db", "<cmd>DBUIToggle<CR>", { desc = "Toggle DB UI" })
vim.keymap.set("n", "<leader>df", "<cmd>DBUIFindBuffer<CR>", { desc = "Find DB buffer" })
vim.keymap.set("n", "<leader>dr", "<cmd>DBUIRenameBuffer<CR>", { desc = "Rename DB buffer" })
vim.keymap.set("n", "<leader>dl", "<cmd>DBUILastQueryInfo<CR>", { desc = "Show last query" })