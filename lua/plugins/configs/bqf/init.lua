vim.cmd([[
    hi default link BqfPreviewFloat Normal
    hi default link BqfPreviewBorder Normal
    hi default link BqfPreviewCursor Cursor
    hi default link BqfPreviewRange IncSearch
    hi default BqfSign ctermfg=14 guifg=Cyan
    hi BqfPreviewBorder guifg=#7eca9c 
    hi link BqfPreviewRange Search
]])

require("bqf").setup({
	auto_enable = true,
	preview = {
		win_height = 12,
		win_vheight = 12,
		delay_syntax = 80,
		border_chars = { "┃", "┃", "━", "━", "┏", "┓", "┗", "┛", "█" },
		should_preview_cb = function(bufnr)
			local ret = true
			local filename = vim.api.nvim_buf_get_name(bufnr)
			local fsize = vim.fn.getfsize(filename)
			-- file size greater than 100k can't be previewed automatically
			if fsize > 100 * 1024 then
				ret = false
			end
			return ret
		end,
	},
	func_map = {
		ptogglemode = "z,",
		stoggleup = "",
	},
	filter = {
		fzf = {
			action_for = { ["ctrl-s"] = "split" },
			extra_opts = { "--bind", "ctrl-o:toggle-all", "--prompt", "> " },
		},
	},
})
