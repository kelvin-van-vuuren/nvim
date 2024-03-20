local M = {}

M.treesitter = {
	ensure_installed = {
		"vim",
		"lua",
		"html",
		"css",
		"typescript",
		"c",
		"cpp",
		"python",
	},
}

M.mason = {
	ensure_installed = {
		-- lua stuff
		"lua-language-server",
		"stylua",

		-- web dev stuff
		"css-lsp",
		"html-lsp",
		"typescript-language-server",
		"deno",

		-- C / C++
		"clangd",
		"clang-format",
		"cmake-language-server",
		"cpplint",
		"cpptools",

		-- shell
		"shellcheck",
		"shellharden",
		"bash-language-server",
		"bash-debug-adapter",
		"awk-language-server",

		-- python
		"pyright",
		"pylint",

		-- go
		"delve",
		"go-debug-adapter",
		"gofumpt",
		"goimports",
		"goimports-reviser",
		"golangci-lint",
		"golangci-lint-langserver",
		"golines",
		"gomodifytags",
		"gopls",
	},
}

-- git support in nvimtree
M.nvimtree = {
	git = {
		enable = true,
	},

	renderer = {
		highlight_git = true,
		icons = {
			show = {
				git = true,
			},
		},
	},
}

M.gitsigns = {
	signs = {
		add = { hl = "GitSignsAdd", text = "+", numhl = "GitSignsAddNr" },
		change = { hl = "DiffAdd", text = "▎", numhl = "GitSignsChangeNr" },
		delete = { hl = "DiffDelete", text = "-", numhl = "GitSignsDeleteNr" },
		topdelete = { hl = "DiffDelete", text = "- ", numhl = "GitSignsDeleteNr" },
		changedelete = { hl = "DiffChangeDelete", text = "~", numhl = "GitSignsChangeNr" },
	},
}

M.ui = {
	tabufline = {
		lazyload = false,
		overriden_modules = nil,
	},
}

M.cmp = {
	formatting = {
		format = function(entry, vim_item)
			local icons = require("nvchad.icons.lspkind")
			vim_item.kind = string.format("%s %s", icons[vim_item.kind], vim_item.kind)
			vim_item.menu = ({
				luasnip = "[Luasnip]",
				nvim_lsp = "[Nvim LSP]",
				buffer = "[Buffer]",
				nvim_lua = "[Nvim Lua]",
				path = "[Path]",
			})[entry.source.name]
			return vim_item
		end,
	},
}

M.telescope = {
	defaults = {
		vimgrep_arguments = {
			"rg",
			"-L",
			"--color=never",
			"--no-heading",
			"--with-filename",
			"--line-number",
			"--column",
			"--smart-case",
			"--hidden",
		},
		mappings = {
			i = {
				["<esc>"] = function(...)
					require("telescope.actions").close(...)
				end,
			},
		},
	},
}

return M
