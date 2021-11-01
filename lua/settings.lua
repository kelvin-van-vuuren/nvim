local set = vim.opt
local g = vim.api



set.clipboard = "unnamedplus"
set.exrc = true
set.guicursor = ""
set.relativenumber = true
set.nu = true
set.hlsearch = true
set.hidden  = true
set.incsearch = true
set.scrolloff=8
set.scl = "yes:1"
set.smarttab = true
set.cindent = true
set.tabstop = 8
set.shiftwidth = 4
set.autoindent = true
-- always uses spaces instead of tab characters
set.expandtab = true
-- [airline] Show bottom line always, hide vim mode
set.laststatus = 2
set.smd = false --noshowmode
-- Hide startup message
set.shm="c"
-- Keep undo history between sessions
set.undofile = true
--
--set.undodir = "~/.vim/undo/"
vim.cmd("set undodir=~/.vim/undo")
set.swapfile = false
set.updatetime=300

set.hidden = true
-- Some servers have issues with backup files, see #649.
set.backup = false
set.writebackup = false
set.cmdheight = 2

g.nvim_set_var("gutentags_cache_dir", '~/.vim/tags/')

vim.cmd([[
augroup highlight_yank
    autocmd!
    autocmd TextYankPost * silent! lua require'vim.highlight'.on_yank({timeout = 80})
augroup END
]])
