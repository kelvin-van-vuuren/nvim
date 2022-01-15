return {
	settings = {
		Lua = {
			diagnostics = {
				globals = { "vim" }, -- stops undefined warning when editing nvim config
			},
			workspace = {
				library = {
					[vim.fn.expand("$VIMRUNTIME/lua")] = true,
					[vim.fn.stdpath("config") .. "/lua"] = true,
				},
			},
		},
	},
}
