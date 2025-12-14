-- Prepare the capabilities (fix the utf-16 offset error)
local capabilities = require("nvchad.configs.lspconfig").capabilities
local clangd_capabilities = vim.deepcopy(capabilities)
clangd_capabilities.offsetEncoding = { "utf-16" }

return {
	capabilities = clangd_capabilities,

	root_markers = {
		"compile_commands.json",
		"compile_flags.txt",
		"configure.ac", -- AutoTools
		"Makefile",
		"configure.ac",
		"configure.in",
		"config.h.in",
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
		semanticHighlighting = true,
	},

	on_attach = function(client, _)
		-- 1. Disable built-in formatting (use conform instead)
		client.server_capabilities.documentFormattingProvider = false
		client.server_capabilities.documentRangeFormattingProvider = false

		-- 2. Setup Clangd Extensions
		require("clangd_extensions").setup({
			inlay_hints = {
				inline = false,
			},
			ast = {
				-- Icons for the AST view
				role_icons = {
					type = "",
					declaration = "",
					expression = "",
					specifier = "",
					statement = "",
					["template argument"] = "",
				},
				kind_icons = {
					Compound = "",
					Recovery = "",
					TranslationUnit = "",
					PackExpansion = "",
					TemplateTypeParm = "",
					TemplateTemplateParm = "",
					TemplateParamObject = "",
				},
			},
		})
	end,
}
