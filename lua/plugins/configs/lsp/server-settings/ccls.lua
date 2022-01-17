return {
	init_options = {
		cache = { directory = "$HOME/.cache/ccls-cache" },
		index = {
			initialNoLinkage = true,
			onChange = true, -- this may too slow and need to be turned off for big projects
		},
	},
}
