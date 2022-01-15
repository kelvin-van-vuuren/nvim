require("lspconfig")
require("plugins.configs.lsp.lsp-installer")

local signs = {
	{ name = "DiagnosticSignError", icon = "" },
	{ name = "DiagnosticSignInfo", icon = "" },
	{ name = "DiagnosticSignHint", icon = "" }, 
	{ name = "DiagnosticSignWarn", icon = "" },
}

for _, sign in ipairs(signs) do
	--vim.fn.sign_define(sign.name, { texthl = sign.name, text = sign.icon, numhl = "DiagnosticDefault" .. sign.name })
	vim.fn.sign_define(sign.name, { texthl = sign.name, text = sign.icon, numhl = "" })
end

local config = {
	virtual_text = {
		prefix = "",
		spacing = 0,
	},
	signs = {
		active = signs,
	},
	underline = true,
	update_in_insert = false, -- update diagnostics whist in insert mode
	severity_sort = true,
	float = {
		focusable = false,
		style = "minimal",
		border = "single",
		source = "always",
		header = "",
		prefix = "",
	},
}
vim.diagnostic.config(config)

vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
	border = "single",
})

vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, {
	border = "single",
})

require("plugins.configs.lsp.null-ls")
