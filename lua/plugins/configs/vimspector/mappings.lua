local map = require("utils").map

-- map("n", "<leader>dl", "<Plug>VimspectorStepInto")
map("n", "<leader>dl", ":call vimspector#StepInto()<CR>")
-- map("n", "<leader>dj", "<Plug>VimspectorStepOver")
map("n", "<leader>dj", ":call vimspector#StepOver()<CR>")
--map("n", "<leader>dk", "<Plug>VimspectorStepOut")
map("n", "<leader>dk", ":call vimspector#StepOut()<CR>")
map("n", "<leader>d<space>", ":call vimspector#Continue()<CR>", { noremap = true })

map("n", "<leader>drc", ":call vimspector#RunToCursor()<CR>")
map("n", "<leader>dbp", ":call vimspector#ToggleBreakpoint()<CR>")

map("n", "<leader>m", ":MaximizerToggle!<CR>", { noremap = true })
map("n", "<leader>dd", ":call vimspector#Launch()<CR>", { noremap = true })
map("n", "<leader>de", ":call vimspector#Reset()<CR>", { noremap = true })
