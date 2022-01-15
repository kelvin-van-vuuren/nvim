local options =  {
    clipboard = "unnamedplus", -- access system clipboard
    guicursor = "", -- disable cursor styling
    completeopt = { "menuone", "noselect" }, -- options for insert mode completion (for cmp plugin)
    conceallevel = 0, -- so that `` is visible in markdown files
    cmdheight = 2, -- number of of screen lines to use for the command line
    ignorecase = true, -- ignore case in search patterns
    smartcase = true, -- override ignore case if search pattern has upper case characters
    termguicolors = true, -- terminal colors
    relativenumber = true, -- relative numbers from line cursor is on
    nu = true, -- precede each line with its line number
    mouse = "a", -- enable mouse support
    pumheight = 10, -- max number of items to show in popup menu
    showmode = false, -- dont show mode message, now shown using statusline plugin
    smartindent = true,
    splitright = true, -- vertical splits go to right of current window
    splitbelow = true, -- horizontal splits go below current window
    swapfile = false,
    updatetime = 300, -- faster completion
    hlsearch = true, -- highlight all matches of previous search pattern
    incsearch = true, -- highlight matches of current search pattern as it is typed
    scrolloff = 8, -- minimal number of screen lines to keep above and below the cursor.
    signcolumn = "yes", -- always show sign column
    smarttab = true,
    tabstop = 4, -- number of spaces to insert for a tab
    shiftwidth = 4, -- number of spaces inserted for each indentation
    expandtab = true, -- use spaces for tabs
    undofile = true, -- keep undo history between sessions
    backup = false, -- Some servers have issues with backup files, see #649.
    writebackup = false,
}

for key, value in pairs(options) do
    vim.opt[key] = value
end

vim.opt.shortmess:append "c" -- hide startup message
vim.api.nvim_set_var("gutentags_cache_dir", '~/.local/share/nvim/tags/') -- set tags dir

-- highlight yank
vim.cmd([[
augroup highlight_yank
    autocmd!
    autocmd TextYankPost * silent! lua require'vim.highlight'.on_yank({timeout = 80})
augroup END
]])
