local statusTelescope, telescope = pcall(require, "telescope")
if (not statusTelescope) then
  print("telescope not found")
  return
end

local actions = require('telescope.actions')
local builtin = require("telescope.builtin")

local fb_actions = require "telescope".extensions.file_browser.actions

telescope.setup {
  defaults = {
    mappings = {
      n = {
        ["q"] = actions.close
      },
    },
  },
  extensions = {
    file_browser = {
      theme = "dropdown",
      -- disables netrw and use telescope-file-browser in its place
      hijack_netrw = true,
      mappings = {
        -- your custom insert mode mappings
        ["i"] = {
          ["<C-w>"] = function() vim.cmd('normal vbd') end,
        },
        ["n"] = {
          -- your custom normal mode mappings
          ["N"] = fb_actions.create,
          ["h"] = fb_actions.goto_parent_dir,
          ["/"] = function()
            vim.cmd('startinsert')
          end
        },
      },
    },
  },
}

telescope.load_extension("file_browser")
telescope.load_extension("live_grep_args")

local function telescope_buffer_dir()
  return vim.fn.expand('%:p:h')
end

vim.keymap.set(
  'n',
  ';g',
  "<cmd>lua require('telescope').extensions.live_grep_args.live_grep_args()<CR>",
  { desc = "Live Grep Args" }
)

vim.keymap.set('n',
  ';h',
  function()
    builtin.find_files({
      no_ignore = false,
      hidden = true
    })
  end,
  { desc = "Find files not have ignore but have hidden" } -- e.g just dont find node_modules
)

vim.keymap.set('n',
  ';f',
  function()
    builtin.find_files({
      no_ignore = false,
      hidden = false
    })
  end,
  { desc = "Find files not have ignore and hidden" } -- e.g dont find node_modules and .git
)

vim.keymap.set('n', ';l', function()
    builtin.live_grep()
  end,
  { desc = "Live grep" }
)

vim.keymap.set('n', ';o', builtin.oldfiles, { desc = "Find Old Files" })

vim.keymap.set('n', ';\\', function()
    builtin.buffers()
  end,
  { desc = "List buffers" }
)

vim.keymap.set('n', ';t', function()
    builtin.help_tags()
  end,
  { desc = "Help tags" }
)

vim.keymap.set('n', ';r', function()
    builtin.resume()
  end,
  { desc = "resume" }
)

vim.keymap.set(
  'n', ';c', function()
    builtin.commands()
  end,
  { desc = "commands" }
)

vim.keymap.set("n", ";b", function()
    telescope.extensions.file_browser.file_browser({
      path = "%:p:h",
      cwd = telescope_buffer_dir(),
      respect_gitignore = false,
      hidden = true,
      grouped = true,
      previewer = false,
      initial_mode = "normal",
      layout_config = { height = 40 }
    })
  end,
  { desc = "File browser" }
)
