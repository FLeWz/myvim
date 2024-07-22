vim.cmd("set expandtab")
vim.cmd("set tabstop=4")
vim.cmd("set softtabstop=4")
vim.cmd("set shiftwidth=4")
--vim.cmd("set relativenumber")
vim.cmd("set number")

vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

vim.keymap.set('i', '<C-s>', '<ESC>:w<CR>a', { desc = "Save buffer" })
vim.keymap.set('n', '<C-s>', ':w<CR>', { desc = "Save buffer" })
