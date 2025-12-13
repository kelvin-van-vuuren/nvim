require("nvchad.autocmds")

-- highlight yank
vim.cmd([[
augroup highlight_yank
    autocmd!
    autocmd TextYankPost * silent! lua require'vim.highlight'.on_yank({timeout = 80})
augroup END
]])

-- wrap git commit body message lines at 72 characters
vim.cmd([["
    augroup gitsetup
        autocmd!
        autocmd FileType gitcommit
                \ autocmd CursorMoved,CursorMovedI * 
                        \ let &l:textwidth = line('.') == 1 ? 50 : 72
augroup end
"]])

local enable_providers = {
	"python3_provider",
	-- and so on
}

for _, plugin in pairs(enable_providers) do
	vim.g["loaded_" .. plugin] = nil
	vim.cmd("runtime " .. plugin)
end

vim.g.python3_host_prog = "/bin/python3"
