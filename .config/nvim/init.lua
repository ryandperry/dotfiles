vim.g.mapleader = " " -- Map leader to space
vim.o.number=true -- Show line numbers
vim.o.relativenumber=true -- Enable relative line numbers
always_show_tabline=true -- Always show status bar
vim.o.wrap=true -- Wrap text that extends beyond screen length
vim.o.ignorecase=true -- Ignore case while searching
vim.o.expandtab=true -- Change tabs to spaces
vim.o.tabstop=4 --  Number of spaces tabs count for
vim.o.shiftwidth=4 -- Size of an indent

-- ===== user commands =====

-- Writes today's date
vim.api.nvim_create_user_command('Date', function()
    local date = os.date('%F')
    vim.api.nvim_put({ date }, 'c', true, true)
end, {})

-- Writes Pomodoro Template from ~/.pomo.txt
vim.api.nvim_create_user_command('Pomo', function()
    local date = os.date('%F')
    vim.api.nvim_put({ date }, 'c', true, true)
    local pomo_template = 
        vim.fn.readfile(vim.fn.expand('~/.config/nvim/write/pomo.txt'))
    vim.api.nvim_put(pomo_template, 'l', true, true)
end, {})

-- Writes Journal Template from ~/.journal_template.txt
vim.api.nvim_create_user_command('Journal', function()
    local journal_template = 
        vim.fn.readfile(vim.fn.expand('~/.config/nvim/write/journal.txt'))
    vim.api.nvim_put(journal_template, 'l', true, true)
end, {})

-- ===== plugins =====

-- vim-plug
local vim = vim
local Plug = vim.fn['plug#']

vim.call('plug#begin')

Plug 'windwp/nvim-autopairs'
Plug 'neovim/nvim-lspconfig'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-treesitter/nvim-treesitter'
Plug 'blazkowolf/gruber-darker.nvim'
Plug 'vimwiki/vimwiki'
Plug 'justinmk/vim-dirvish'
Plug 'roginfarrer/vim-dirvish-dovish'

vim.call('plug#end')

-- Set colorscheme
vim.cmd.colorscheme("gruber-darker")

-- Configuration for nvim-autopairs
require('nvim-autopairs').setup {}

-- Set up LSP
local lspconfig = require('lspconfig')

-- Configuration for clangd (C/C++ LSP)
lspconfig.clangd.setup{}

-- Configuration for hls (Haskell LSP)
lspconfig.hls.setup{}

-- Configuration for csharp-ls (C# LSP)
-- lspconfig.csharp_ls.setup{}

-- Configuration for nvim-telescope
local builtin = require('telescope.builtin')

-- ===== mappings =====

-- Mappings for nvim-telescope
vim.keymap.set('n', '<leader>ff', builtin.find_files, 
                    { desc = 'Telescope find files' })
vim.keymap.set('n', '<leader>fg', builtin.live_grep, 
                    { desc = 'Telescope live grep' })
vim.keymap.set('n', '<leader>fb', builtin.buffers, 
                    { desc = 'Telescope buffers' })
vim.keymap.set('n', '<leader>fh', builtin.help_tags, 
                    { desc = 'Telescope help tags' })

-- Move between panes
vim.keymap.set('n', '<up>', '<C-w><up>')
vim.keymap.set('n', '<down>', '<C-w><down>')
vim.keymap.set('n', '<left>', '<C-w><left>')
vim.keymap.set('n', '<right>', '<C-w><right>')

-- Escape from terminal mode
vim.api.nvim_set_keymap('t', '<ESC>', [[<C-\><C-n>]], { noremap = true })

-- ===== vimscript =====

vim.cmd [[
    highlight CursorLine cterm=NONE ctermbg=NONE ctermfg=NONE
    highlight CursorLine guibg=NONE guifg=NONE
    set cursorline " Highlight cursor line
    filetype indent on " Automatic indentation based on file type
]]
