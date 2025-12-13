require("nvchad.autocmds")

-- highlight yanked text
vim.api.nvim_create_autocmd("TextYankPost", {
	desc = "Highlight when yanking (copying) text",
	group = vim.api.nvim_create_augroup("highlight-yank", { clear = true }),
	callback = function()
		vim.highlight.on_yank()
	end,
})

-- git commit header 50 chars and wrap body message lines at 72 characters
vim.api.nvim_create_autocmd("FileType", {
	pattern = "gitcommit",
	group = vim.api.nvim_create_augroup("GitCommitSetup", { clear = true }),
	callback = function()
		-- Create a buffer-local autocmd (note the buffer = 0)
		-- This ensures the expensive CursorMoved check ONLY runs in this specific window
		vim.api.nvim_create_autocmd({ "CursorMoved", "CursorMovedI" }, {
			buffer = 0,
			callback = function()
				-- If on line 1, width is 50. Otherwise, it's 72.
				vim.opt_local.textwidth = vim.fn.line(".") == 1 and 50 or 72
			end,
		})
	end,
})

local enable_providers = {
	"python3_provider",
	-- and so on
}

for _, plugin in pairs(enable_providers) do
	vim.g["loaded_" .. plugin] = nil
	vim.cmd("runtime " .. plugin)
end

vim.g.python3_host_prog = "/bin/python3"
