return {
	cmd = {
		-- see clangd --help-hidden
		"clangd",
		-- by default, clang-tidy use -checks=clang-diagnostic-*,clang-analyzer-*
		-- to add more checks, create .clang-tidy file in the root directory
		-- and add Checks key, see https://clang.llvm.org/extra/clang-tidy/
		"--clang-tidy",
		"--background-index",
		"--completion-style=bundled",
		"--header-insertion=iwyu",
		"--enable-config",
	},
	-- TODO: figure out what is this
	init_options = {
		clangdFileStatus = true, -- Provides information about activity on clangd’s per-file worker thread
		usePlaceholders = true,
		completeUnimported = true,
		semanticHighlighting = true,
	},
}
