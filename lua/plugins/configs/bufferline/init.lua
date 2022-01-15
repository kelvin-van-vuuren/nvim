require("plugins.configs.bufferline.mappings")

local colors = require("colors").get()

require("bufferline").setup({
	options = {
		offsets = { { filetype = "NvimTree", text = "Explorer" } },
		buffer_close_icon = "",
		modified_icon = "",
		close_icon = " ",
		left_trunc_marker = "",
		right_trunc_marker = "",
		max_name_length = 14,
		indicator_icon = "▎",
		max_prefix_length = 13,
		tab_size = 20,
		show_buffer_icons = true,
		show_buffer_close_icons = true,
		show_close_icon = true,
		show_tab_indicators = true,
		enforce_regular_tabs = false,
		separator_style = "thin",
		always_show_bufferline = true,
		diagnostics = false,
		diagnostics_update_in_insert = false,
	},
	highlights = {
		background = {
			guifg = colors.grey_fg,
			guibg = colors.black2,
		},

		-- buffers
		buffer_selected = {
			guifg = colors.white,
			guibg = colors.black,
			gui = "bold",
		},
		buffer_visible = {
			guifg = colors.light_grey,
			guibg = colors.black2,
		},

		-- for diagnostics = "nvim_lsp"
		error = {
			guifg = colors.light_grey,
			guibg = colors.black2,
		},
		error_diagnostic = {
			guifg = colors.light_grey,
			guibg = colors.black2,
		},

		-- close buttons
		close_button = {
			guifg = colors.light_grey,
			guibg = colors.black2,
		},
		close_button_visible = {
			guifg = colors.light_grey,
			guibg = colors.black2,
		},
		close_button_selected = {
			guifg = colors.white,
			guibg = colors.black,
		},
		fill = {
			guifg = colors.grey_fg,
			guibg = colors.black2,
		},
		indicator_selected = {
			guifg = colors.nord_blue,
			guibg = colors.black,
		},

		-- modified
		modified = {
			guifg = colors.red,
			guibg = colors.black2,
		},
		modified_visible = {
			guifg = colors.red,
			guibg = colors.black2,
		},
		modified_selected = {
			guifg = colors.green,
			guibg = colors.black,
		},

		-- separators
		separator = {
			guifg = colors.black2,
			guibg = colors.black2,
		},
		separator_visible = {
			guifg = colors.black2,
			guibg = colors.black2,
		},
		separator_selected = {
			guifg = colors.black2,
			guibg = colors.black2,
		},

		-- tabs
		tab = {
			guifg = colors.light_grey,
			guibg = colors.one_bg3,
		},
		tab_selected = {
			guifg = colors.black2,
			guibg = colors.nord_blue,
		},
		tab_close = {
			guifg = colors.red,
			guibg = colors.black,
		},
	},
})
