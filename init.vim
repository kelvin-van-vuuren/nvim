call plug#begin()

"Theming
Plug 'kyazdani42/nvim-web-devicons'
Plug 'ryanoasis/vim-devicons'
Plug 'siduck76/nvim-base16.lua'

"lsp
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'glepnir/lspsaga.nvim'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'fedorenchik/qt-support.vim'

"file tree
Plug 'kyazdani42/nvim-tree.lua'

"git
Plug 'lewis6991/gitsigns.nvim'

"status lines
Plug 'glepnir/galaxyline.nvim' , {'branch': 'main'}
Plug 'akinsho/nvim-bufferline.lua'

"fuzzy finder
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-fzy-native.nvim'

"debugging
Plug 'puremourning/vimspector'
Plug 'szw/vim-maximizer'

"utility
Plug 'windwp/nvim-autopairs'
Plug 'scrooloose/nerdcommenter'
Plug 'ludovicchabant/vim-gutentags' "ctag management
Plug 'tweekmonster/startuptime.vim'

call plug#end()

let mapleader = " "

if exists('+termguicolors')
  let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
  let $NVIM_TUI_ENABLE_TRUE_COLOR=1
  set termguicolors
endif

"lua vim.g.tokyonight_italic_functions = true
let g:dashboard_default_executive ='telescope'

syntax enable
lua << EOF
local base16 = require 'base16'
base16(base16.themes["onedark"], true)
EOF
"colorscheme tokyonight

" switch between source and header:
nnoremap <F4> :e %:p:s,.h$,.X123X,:s,.cpp$,.h,:s,.X123X$,.cpp,<CR>

"Save as sudo with w!! (when lacking root)
cmap w!! w !sudo tee % >/dev/null

"Buttons for going to previous/next file (buffer)
map <C-[> :bprevious<CR>
map <C-]> :bnext<CR>
"Show a list of files (buffers) that are open
map <F2> :buffers<CR>
"Yank (copy) contents of current file (buffer) - also to X11 clipboard
map <F5> :%y+<CR>
"Show name of file and path relative to current working directory
map <F6> :echo @%<CR>
"Show current working directory
map <F7> :pwd<CR>
"Close current buffer
map <F12> :bd!<CR>

nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

vnoremap <leader>p "_dP

augroup highlight_yank
    autocmd!
    autocmd TextYankPost * silent! lua require'vim.highlight'.on_yank({timeout = 80})
augroup END

"[gutentags] Don't pollute project dirs
let g:gutentags_cache_dir = '~/.vim/tags/'

function! s:JbzCppMan()
    let old_isk = &iskeyword
    setl iskeyword+=:
    let str = expand("<cword>")
    let &l:iskeyword = old_isk
    execute 'Man ' . str
endfunction
command! JbzCppMan :call s:JbzCppMan()

au FileType cpp nnoremap <buffer>K :JbzCppMan<CR>

highlight CocErrorSign ctermfg=Red guifg=#db4b4b
highlight CocWarningSign ctermfg=Brown guifg=#e0af68
highlight CocInfoSign ctermfg=Blue guifg=#0db9d7
highlight CocHintSign guifg=#1abc9c
highlight CocErrorVirtualText  ctermfg=Red guifg=#db4b4b guibg=#392739
highlight CocWarningVirtualText ctermfg=Brown guifg=#e0af68 guibg=#473846
highlight CocInfoVirtualText  ctermfg=Blue guifg=#0db9d7 guibg=#1F3B47
highlight CocHintVirtualText  ctermfg=Blue guifg=#1abc9c guibg=#2C3E42
highlight CocErrorHighlight cterm=undercurl gui=undercurl guisp=#db4b4b
highlight CocWarningHighlight cterm=undercurl gui=undercurl guisp=#e0af68
highlight CocInfoHighlight cterm=underline gui=underline guisp=#0db9d7
highlight CocHintHighlight cterm=underline gui=underline guisp=#1abc9c
