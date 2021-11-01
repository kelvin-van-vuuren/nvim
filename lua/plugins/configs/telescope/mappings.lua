require("utils")

map('n', '<Leader>ps', ':Telescope live_grep <CR>', { noremap = true, silent = true })
map('n', '<C-p>', ':Telescope git_files <CR>', { noremap = true, silent = true })
map('n', '<Leader>pf', ':Telescope find_files <CR>', { noremap = true, silent = true })
map('n', '<Leader>pg', ':Telescope live_grep prompt_prefix=🔍 <CR>', { noremap = true, silent = true })
map('n', '<Leader>pb', ':Telescope buffers <CR>', { noremap = true, silent = true })
--nnoremap <leader>vrc :lua require('kelvin.telescope').search_dotfiles()<CR>
