local map = require("utils").map

map("n", "<C-p>", ":Telescope git_files <CR>")
map("n", "<Leader>pf", ":Telescope find_files <CR>")
map("n", "<Leader>pg", ":Telescope live_grep prompt_prefix=🔍 <CR>")
map("n", "<Leader>pb", ":Telescope buffers <CR>")
