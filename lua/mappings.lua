require("utils")

vim.g.mapleader = ' '

map('n', '<Leader>h', ':set hlsearch!<CR>', { noremap = true, silent = true })

map('n', '<C-J>', '<C-W><C-J>', { noremap = true, silent = true })
map('n', '<C-K>', '<C-W><C-K>', { noremap = true, silent = true })
map('n', '<C-L>', '<C-W><C-L>', { noremap = true, silent = true })
map('n', '<C-H>', '<C-W><C-H>', { noremap = true, silent = true })

map('v', '<Leader>p', '"_dP', { noremap = true, silent = true })

local utils = require("utils")
for _, plugin in pairs(utils.get_directories(utils.script_path() .. "plugins/configs")) do
    pcall(require, "plugins.configs."..plugin..".mappings")
end
