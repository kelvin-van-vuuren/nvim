local merge_tb = vim.tbl_deep_extend

local on_attach = require("plugins.configs.lspconfig").on_attach
local capabilities = require("plugins.configs.lspconfig").capabilities

local lspconfig = require "lspconfig"

local servers = { "html", "cssls", "tsserver", "clangd" }

for _, lsp in ipairs(servers) do
    local opts = {
        on_attach = on_attach,
        capabilities = capabilities,
    }

    local exists, settings = pcall(require, "custom.plugins.lsp.server-settings." .. lsp)
    if exists then
        opts = merge_tb("force", settings, opts)
    end

    lspconfig[lsp].setup(opts)
end


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
