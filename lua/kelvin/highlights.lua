local cmd = vim.cmd
-- blankline

cmd "hi IndentBlanklineChar guifg=#282c34"

-- misc --
cmd "hi NvimInternalError guifg=#f9929b"
cmd "hi VertSplit guifg=#2a2e36"
cmd "hi EndOfBuffer guifg=#1e222a"

cmd "hi PmenuSel guibg=#98c379"
cmd "hi PmenuSbar guibg =#353b45"
cmd "hi PmenuThumb guibg =#81A1C1"

-- line n.o
cmd "hi clear CursorLine"
cmd "hi cursorlinenr guifg=#abb2bf"

-- git signs ---
cmd "hi DiffAdd guifg=#81A1C1 guibg = none"
cmd "hi DiffChange guifg =#3A3E44 guibg = none"
cmd "hi DiffModified guifg = #81A1C1 guibg = none"

-- NvimTree
cmd "hi NvimTreeFolderIcon guifg = #61afef"
cmd "hi NvimTreeFolderName guifg = #61afef"
