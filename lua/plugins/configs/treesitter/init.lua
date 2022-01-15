require("nvim-treesitter.configs").setup({
	ensure_installed = "all",
	ignore_install = { "" },
	autopairs = { enable = true },
	highlight = {
		enable = true,
		use_languagetree = true,

		-- Setting this to true will run `:h syntax` and tree-sitter at the same time.
		-- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
		-- Using this option may slow down your editor, and you may see some duplicate highlights.
		-- Instead of true it can also be a list of languages
		additional_vim_regex_highlighting = true,
	},
	indent = { enable = true },
	textobjects = { enable = true },
	context_commentstring = {
		enable = true,
		enable_autocmd = false,
	},
})
