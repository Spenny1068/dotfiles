vim.g.mapleader = " "

-- sets
vim.o.syntax = "on"          
vim.o.guicursor = ""         -- fat cursor in insert mode
vim.o.mouse = 'a'  	         -- allow mouse usage in all modes
vim.o.hlsearch = true        -- highlight searched word
vim.o.incsearch = true       -- highlight while typing
vim.o.cursorline = true      -- highlight the current line
vim.o.number = true          -- show line numbers
vim.o.wrap = false           -- don't wrap lines
vim.o.ruler = true           -- show column number bottom right
vim.o.tabstop = 4            -- spaces per tab
vim.o.softtabstop = 4        -- spaces per tab while editing
vim.o.shiftwidth = 4         -- spaces per shift
vim.o.expandtab = true       -- tabs are spaces
vim.o.termguicolors = true   -- nice colors
vim.o.linebreak = true       -- avoid wrapping a line in the middle of a word
vim.o.swapfile = false       -- no swapfiles
vim.o.cindent = true
vim.o.autoindent = true      -- try best to indent
vim.o.shiftround = true      -- round indents to multiple of shiftwidth
vim.o.backup = false         -- no backup files
vim.o.history = 300          -- vim history
vim.o.backspace = "indent,eol,start"
vim.o.smartcase = true       -- case-sensitive only when query contains uppercase letter
vim.o.ignorecase = true

-- remaps
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>') -- clear highlights on search when pressing <Esc> in normal mode
vim.keymap.set('n', '<leader>v', '<C-w>v', { desc = "Vertical Split" })
vim.keymap.set('n', '<leader>h', '<C-w>h', { desc = 'Move focus to the left window' })
vim.keymap.set('n', '<leader>l', '<C-w>l', { desc = 'Move focus to the right window' })
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)
vim.keymap.set("n", "J", "mzJ`z") -- don't move curser when using J
vim.keymap.set("x", "p", "\"_dP") -- don't overwrite reg when pasting

-- Prevent { and } from affecting the jumplist
vim.api.nvim_set_keymap('n', '}', ':keepjumps normal! }<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '{', ':keepjumps normal! {<CR>', { noremap = true, silent = true })

-- * highlights occurrences without jumping
vim.api.nvim_set_keymap('n', '*', [[:let @/ = '\<' .. expand('<cword>') .. '\>'<CR>:set hlsearch<CR>]], { noremap = true, silent = true })

-- quick highlight when copying
vim.api.nvim_create_autocmd('TextYankPost', {
    desc = 'Highlight when yanking (copying) text',
    group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
    callback = function()
        vim.highlight.on_yank()
    end,
})

-- sync os & vim clipboard
vim.schedule(function() 
    vim.opt.clipboard = 'unnamedplus'
end)

if vim.o.encoding == 'latin1' and vim.fn.has('gui_running') == 1 then
  vim.o.encoding = 'utf-8'
end


