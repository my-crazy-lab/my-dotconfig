# Neovim Configuration

My personal Neovim configuration with LSP support, file navigation, Git integration, and more.

## Features

1. LSP (Language Server Protocol) support
   - Code completion
   - Diagnostics
   - Go-to-definition
   - References
   - Hover information

2. File Navigation
   - Telescope for fuzzy finding
   - NvimTree file explorer
   - Buffer management

3. Git Integration
   - Git signs
   - Git blame
   - Lazygit integration

4. Terminal Integration
   - Floating terminal
   - Language-specific REPLs (Node, Python)

5. Code Editing
   - Treesitter for syntax highlighting
   - Auto-pairs
   - Move lines/blocks with shortcuts
   - Formatting support

6. UI Enhancements
   - Custom statusline with lualine
   - Buffer tabs
   - Which-key for keybinding help
   - Zen mode

7. Database Integration
   - vim-dadbod for database management

8. Diagnostics and Troubleshooting
   - Trouble.nvim for error navigation
   - Spectre for search and replace

## Keyboard Shortcuts

### General
- `<Space>` - Leader key
- `<C-h/j/k/l>` - Navigate between windows
- `<C-Up/Down/Left/Right>` - Resize windows
- `<C-d>/<C-u>` - Scroll down/up (centered)
- `<leader>z` - Toggle Zen mode
- `<leader>f` - Format code

### File Navigation
- `<leader>e` - Toggle NvimTree
- `<leader>ff` - Find files
- `<leader>fg` - Live grep
- `<leader>fb` - List buffers
- `<leader>fh` - Help tags
- `<leader>fo` - Old files
- `;f` - Find files (no ignore, no hidden)
- `;h` - Find files (hidden)
- `;l` - Live grep
- `;o` - Old files
- `;b` - File browser
- `;g` - Live grep with args

### Buffer Management
- `<S-l>` - Next buffer
- `<S-h>` - Previous buffer
- `<leader>c` - Close buffer

### LSP
- `gd` - Go to definition
- `gr` - Go to references
- `K` - Show hover information
- `<leader>rn` - Rename
- `<leader>ca` - Code action
- `<leader>df` - Show diagnostics
- `[d]/]d` - Previous/next diagnostic

### Git
- `<leader>gg` - Open Git
- `<leader>gd` - Git diff
- `<leader>gb` - Git blame
- `<leader>lg` - Toggle Lazygit

### Terminal
- `<leader>t` - Toggle terminal
- `<C-\>` - Toggle terminal (alternative)
- `<Esc>` - Exit terminal mode
- `<leader>tn` - Toggle Node REPL
- `<leader>tp` - Toggle Python REPL

### Code Navigation
- `<C-j>/<C-k>` - Move line down/up
- `<C-h>/<C-l>` - Move character left/right
- `J/K` - Move selected text down/up (visual mode)

### Diagnostics/Trouble
- `<leader>xx` - Toggle Trouble
- `<leader>xw` - Workspace diagnostics
- `<leader>xd` - Document diagnostics
- `<leader>xq` - Quickfix list
- `<leader>xl` - Location list
- `gR` - LSP references

### Search and Replace
- `<leader>S` - Toggle Spectre
- `<leader>sw` - Search current word
- `<leader>sp` - Search in current file

### Database
- `<leader>db` - Toggle DB UI
- `<leader>df` - Find DB buffer
- `<leader>dr` - Rename DB buffer
- `<leader>dl` - Show last query

### Testing
- `<leader>tt` - Run nearest test
- `<leader>tf` - Run current file tests
- `<leader>td` - Debug nearest test
- `<leader>ts` - Toggle test summary
- `<leader>to` - Open test output
