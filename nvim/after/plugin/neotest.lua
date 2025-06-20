local status, neotest = pcall(require, "neotest")
if (not status) then return end

neotest.setup({
  adapters = {
    require("neotest-python")({
      dap = { justMyCode = false },
      python = "python3",
    }),
    require("neotest-jest")({
      jestCommand = "npm test --",
      jestConfigFile = "jest.config.js",
      env = { CI = true },
      cwd = function(path)
        return vim.fn.getcwd()
      end,
    }),
    require("neotest-go")({
      experimental = {
        test_table = true,
      },
      args = { "-count=1", "-timeout=60s" }
    }),
  },
  icons = {
    running = "⟳",
    passed = "✓",
    failed = "✗",
    skipped = "↓",
  },
  summary = {
    open = "botright vsplit | vertical resize 50"
  },
})

-- Keymaps
vim.keymap.set("n", "<leader>tt", function() neotest.run.run() end, { desc = "Run nearest test" })
vim.keymap.set("n", "<leader>tf", function() neotest.run.run(vim.fn.expand("%")) end, { desc = "Run current file" })
vim.keymap.set("n", "<leader>td", function() neotest.run.run({strategy = "dap"}) end, { desc = "Debug nearest test" })
vim.keymap.set("n", "<leader>ts", function() neotest.summary.toggle() end, { desc = "Toggle test summary" })
vim.keymap.set("n", "<leader>to", function() neotest.output.open() end, { desc = "Open test output" })