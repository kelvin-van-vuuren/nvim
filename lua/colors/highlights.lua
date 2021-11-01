local cmd = vim.cmd

-- blankline --
cmd "hi IndentBlanklineChar guifg=#282c34"

-- misc --
cmd "hi NvimInternalError guifg=#f9929b"
cmd "hi VertSplit guifg=#2a2e36"
cmd "hi EndOfBuffer guifg=#1e222a"

cmd "hi PmenuSel guibg=#98c379"
cmd "hi PmenuSbar guibg =#353b45"
cmd "hi PmenuThumb guibg =#81A1C1"

-- line n.o --
cmd "hi clear CursorLine"
cmd "hi cursorlinenr guifg=#abb2bf"

-- git signs --
cmd "hi DiffAdd guifg=#81A1C1 guibg = none"
cmd "hi DiffChange guifg =#3A3E44 guibg = none"
cmd "hi DiffModified guifg = #81A1C1 guibg = none"

-- NvimTree --
cmd "hi NvimTreeFolderIcon guifg = #61afef"
cmd "hi NvimTreeFolderName guifg = #61afef"

-- CoC --
cmd "highlight CocErrorSign ctermfg=Red guifg=#db4b4b"
cmd "highlight CocWarningSign ctermfg=Brown guifg=#e0af68"
cmd "highlight CocInfoSign ctermfg=Blue guifg=#0db9d7"
cmd "highlight CocHintSign guifg=#1abc9c"
cmd "highlight CocErrorVirtualText  ctermfg=Red guifg=#db4b4b guibg=#392739"
cmd "highlight CocWarningVirtualText ctermfg=Brown guifg=#e0af68 guibg=#473846"
cmd "highlight CocInfoVirtualText  ctermfg=Blue guifg=#0db9d7 guibg=#1F3B47"
cmd "highlight CocHintVirtualText  ctermfg=Blue guifg=#1abc9c guibg=#2C3E42"
cmd "highlight CocErrorHighlight cterm=undercurl gui=undercurl guisp=#db4b4b"
cmd "highlight CocWarningHighlight cterm=undercurl gui=undercurl guisp=#e0af68"
cmd "highlight CocInfoHighlight cterm=underline gui=underline guisp=#0db9d7"
cmd "highlight CocHintHighlight cterm=underline gui=underline guisp=#1abc9c"
