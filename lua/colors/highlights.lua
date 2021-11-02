local cmd = vim.cmd

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

-- Errors
cmd "hi LspDiagnosticsSignError guifg=#d47d85"
cmd "hi LspDiagnosticsSignWarning guifg=#e7c787"
cmd "hi LspDiagnosticsVirtualTextError guifg=#d47d85"
cmd "hi LspDiagnosticsVirtualTextWarning guifg=#e7c787"

-- Info
cmd "hi LspDiagnosticsSignInformation guifg=#A3BE8C"
cmd "hi LspDiagnosticsVirtualTextInformation guifg=#A3BE8C"

-- Hints
cmd "hi LspDiagnosticsSignHint guifg=#b4bbc8"
cmd "hi LspDiagnosticsVirtualTextHint guifg=#b4bbc8"

-- symbol highlighting --
cmd "hi LspReferenceRead guibg=#42464e"
cmd "hi LspReferenceText guibg=#42464e"
cmd "hi LspReferenceWrite guibg=#42464e"

vim.api.nvim_command [[autocmd CursorHold  <buffer> lua vim.lsp.buf.document_highlight()]]
vim.api.nvim_command [[autocmd CursorHoldI <buffer> lua vim.lsp.buf.document_highlight()]]
vim.api.nvim_command [[autocmd CursorMoved <buffer> lua vim.lsp.buf.clear_references()]]
