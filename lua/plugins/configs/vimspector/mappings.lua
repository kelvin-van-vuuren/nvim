local map = require("utils").map

map("n", "<leader>dl", "<Plug>VimspectorStepInto")
map("n", "<leader>dj", "<Plug>VimspectorStepOver")
map("n", "<leader>dk", "<Plug>VimspectorStepOut")
map("n", "<leader>d<space>", ":call vimspector#Continue()<CR>", { noremap = true })

map("n", "<leader>drc", "<Plug>VimspectorRunToCursor")
map("n", "<leader>dbp", "<Plug>VimspectorToggleBreakpoint")

map("n", "<leader>m", ":MaximizerToggle!<CR>", { noremap = true })
map("n", "<leader>dd", ":call vimspector#Launch()<CR>", { noremap = true })
map("n", "<leader>de", ":call vimspector#Reset()<CR>", { noremap = true })
