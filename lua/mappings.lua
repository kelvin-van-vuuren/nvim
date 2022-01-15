local map = require("utils").map

-- leader key
vim.g.mapleader = " "

-- clear search highlighting
map("n", "<Leader><Leader>", ":nohlsearch<CR>")

-- navigate between windows with ctrl + j, k , l, h
map("n", "<C-J>", "<C-W><C-J>")
map("n", "<C-K>", "<C-W><C-K>")
map("n", "<C-L>", "<C-W><C-L>")
map("n", "<C-H>", "<C-W><C-H>")

-- Format using null ls
map("n", "<C-f>", ":Format<CR>")

-- paste and replace highlighted text without copying replaced text into register
map("v", "<Leader>p", '"_dP')

-- close buffers
map("n", "<Leader>q", ":Bwipeout<CR>")
