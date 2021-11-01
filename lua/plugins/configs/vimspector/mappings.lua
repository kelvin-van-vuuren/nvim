require("utils")

local function GoToWindow(id):
    call win_gotoid(a:id)
    MaximizerToggle
end

map("n", "<leader>dl", "<Plug>VimspectorStepInto", {})
map("n", "<leader>dj", "<Plug>VimspectorStepOver", {})
map("n", "<leader>dk", "<Plug>VimspectorStepOut", {})
map("n", "<leader>d<space>", ":call vimspector#Continue()<CR>", { noremap = true })

map("n", "<leader>drc", "<Plug>VimspectorRunToCursor", {})
map("n", "<leader>dbp", "<Plug>VimspectorToggleBreakpoint", {})

map("n", "<leader>m", ":MaximizerToggle!<CR>", { nnoremap = true })
map("n", "<leader>dd", ":call vimspector#Launch()", { nnoremap = true })
map("n", "<leader>dc", ":call GotoWindow(g:vimspector_session_windows.code)<CR>", { nnoremap = true })
map("n", "<leader>dt", ":call GotoWindow(g:vimspector_session_windows.tabpage)<CR>", { nnoremap = true })
map("n", "<leader>dv", ":call GotoWindow(g:vimspector_session_windows.variables)<CR>", { nnoremap = true })
map("n", "<leader>do", ":call GotoWindow(g:vimspector_session_windows.output)<CR>", { nnoremap = true })
map("n", "<leader>de", ":call vimspector#Reset()<CR>", { nnoremap = true })

