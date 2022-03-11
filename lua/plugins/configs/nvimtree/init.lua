local g = vim.g
g.nvim_tree_git_hl = 1 --enable file highlight for git attributes
g.nvim_tree_indent_markers = 1
g.nvim_tree_root_folder_modifier = table.concat({ ":t:gs?$?/..", string.rep(" ", 1000), "?:gs?^??" })

vim.g.nvim_tree_icons = {
	default = "",
	symlink = "",
	git = {
		unstaged = "",
		staged = "S",
		unmerged = "",
		renamed = "➜",
		deleted = "",
		untracked = "U",
		ignored = "◌",
	},
	folder = {
		default = "",
		open = "",
		empty = "",
		empty_open = "",
		symlink = "",
	},
}

require("nvim-tree").setup({
	diagnostics = {
		enable = false,
		icons = {
			hint = "",
			info = "",
			warning = "",
			error = "",
		},
	},
	git = {
		enable = true,
		ignore = true,
	},
	disable_netrw = true,
	hijack_netrw = true,
	ignore_ft_on_setup = { "dashboard" },
	auto_close = true,
	open_on_tab = false,
	hijack_cursor = true,
	update_cwd = true,
	update_focused_file = {
		enable = true,
		update_cwd = false,
	},
	view = {
		width = 30,
		height = 30,
		side = "left",
		auto_resize = true,
		number = false,
		relativenumber = false,
		signcolumn = "yes",
		mappings = require("plugins.configs.nvimtree.mappings").mappings,
	},
	show_icons = {
		git = 1,
		folders = 1,
		files = 1,
		folder_arrows = 1,
		tree_width = 30,
	},
    actions = {
        open_file = {
            quit_on_open = false,
        }
    },
})
