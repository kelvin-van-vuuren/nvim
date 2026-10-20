-- Capabilities, offset encoding and filetypes come from nvim-lspconfig's
-- lsp/clangd.lua and NvChad's "*" config. Only the clangd specific parts are
-- set here.
return {
	root_markers = {
		".clangd",
		".clang-tidy",
		".clang-format",
		"compile_commands.json",
		"compile_flags.txt",
		"configure.ac", -- AutoTools
		"configure.in",
		"config.h.in",
		"Makefile",
		"meson.build",
		"meson_options.txt",
		"build.ninja",
		".git",
	},

	cmd = {
		"clangd",
		"--background-index",
		-- "--background-index-threads=1", -- Limit background threads
		"--clang-tidy",
		"--header-insertion=iwyu",
		"--completion-style=detailed",
		"--function-arg-placeholders",
		"--fallback-style=llvm",
		"--pch-storage=memory",
	},

	init_options = {
		usePlaceholders = true,
		completeUnimported = true,
		clangdFileStatus = true,
	},

	on_attach = function(client, bufnr)
		-- Formatting is done by conform (clang-format)
		client.server_capabilities.documentFormattingProvider = false
		client.server_capabilities.documentRangeFormattingProvider = false

		-- Parameter names, deduced types and designators
		vim.lsp.inlay_hint.enable(true, { bufnr = bufnr })

		local function map(lhs, rhs, desc)
			vim.keymap.set("n", lhs, rhs, { buffer = bufnr, desc = desc })
		end

		-- clangd_extensions.nvim commands
		map("<Leader>s", "<cmd>ClangdSwitchSourceHeader<CR>", "Clangd switch source/header")
		map("<Leader>cA", "<cmd>ClangdAST<CR>", "Clangd show AST")
		map("<Leader>ct", "<cmd>ClangdTypeHierarchy<CR>", "Clangd type hierarchy")
		map("<Leader>ci", "<cmd>ClangdSymbolInfo<CR>", "Clangd symbol info")
		map("<Leader>cM", "<cmd>ClangdMemoryUsage<CR>", "Clangd memory usage")
	end,
}
