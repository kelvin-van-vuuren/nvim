require("plugins.configs.telescope.mappings")

local actions = require("telescope.actions")
local telescope = require("telescope")
local sorter = require("telescope.sorters")
local previewers = require("telescope.previewers")

telescope.setup({
	defaults = {
		file_sorter = sorter.get_fzy_sorter,
		prompt_prefix = " 🔍 ",
		color_devicons = true,

		file_previewer = previewers.vim_buffer_cat.new,
		grep_previewer = previewers.vim_buffer_vimgrep.new,
		qflist_previewer = previewers.vim_buffer_qflist.new,

		mappings = {
			i = {
				["<C-c>"] = actions.close,
				["<Esc>"] = actions.close,

				["<C-j>"] = actions.move_selection_next,
				["<C-k>"] = actions.move_selection_previous,

				["<CR>"] = actions.select_default,

				["<C-q>"] = actions.send_to_qflist,
			},
		},
	},
	extensions = {
		fzf = {
			fuzzy = true,
			override_generic_sorter = true,
			override_file_sorter = true,
			case_mode = "smart_case",
		},
	},
})

telescope.load_extension("fzf")
