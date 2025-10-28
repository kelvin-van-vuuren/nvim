local on_attach = require("nvchad.configs.lspconfig").on_attach
local on_init = require("nvchad.configs.lspconfig").on_init
local capabilities = require("nvchad.configs.lspconfig").capabilities

local servers = { "ts_ls", "clangd", "gopls", "pyright" }

vim.lsp.enable(servers)

-- for _, lsp in ipairs(servers) do
-- 	local opts = {
-- 		on_init = on_init,
-- 		on_attach = on_attach,
-- 		capabilities = capabilities,
-- 	}
--
-- 	local exists, settings = pcall(require, "configs.lsp.server-settings." .. lsp)
-- 	if exists then
-- 		opts = merge_tb("force", settings, opts)
-- 	end
--
vim.lsp.config("clangd", {
	on_attach = function(client, bufnr)
		client.server_capabilities.documentFormattingProvider = false
		client.server_capabilities.documentRangeFormattingProvider = false
		on_attach(client, bufnr)
	end,
	on_init = on_init,
	capabilities = capabilities,
})

local config = {
	virtual_text = false,
	underline = true,
	update_in_insert = false,
	severity_sort = true,
	float = {
		focusable = false,
		style = "minimal",
		border = "single",
		source = "always",
	},
}

vim.diagnostic.config(config)
