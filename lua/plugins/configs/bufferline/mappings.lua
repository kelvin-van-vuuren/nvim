local map = require("utils").map

-- MAPPINGS
map("n", "<S-t>", [[<Cmd>tabnew<CR>]]) -- new tab
map("n", "<S-x>", [[<Cmd>bdelete<CR>]]) -- close tab

-- move between tabs
map("n", "<TAB>", [[<Cmd>BufferLineCycleNext<CR>]], opt)
map("n", "<S-TAB>", [[<Cmd>BufferLineCyclePrev<CR>]], opt)
