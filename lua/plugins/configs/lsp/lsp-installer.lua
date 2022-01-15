local lsp_installer = require("nvim-lsp-installer")

lsp_installer.settings({
	ui = {
		icons = {
			server_installed = "✓",
			server_pending = "➜",
			server_uninstalled = "✗",
		},
	},
})

-- Register a handler that will be called for all installed servers.
-- Alternatively, you may also register handlers on specific server instances instead (see example below).
lsp_installer.on_server_ready(function(server)
	local opts = {
		on_attach = require("plugins.configs.lsp.handlers").on_attach,
		capabilities = require("plugins.configs.lsp.handlers").capabilities,
	}

	if server.name == "ccls" then
		local ccls_opts = require("plugins.configs.lsp.server-settings.ccls")
		opts = vim.tbl_deep_extend("force", ccls_opts, opts)
	end

	-- use b0o/SchemaStore.nvim instead of importing schemas manually
	if server.name == "jsonls" then
		local jsonls_opts = require("plugins.configs.lsp.server-settings.jsonls")
		opts = vim.tbl_deep_extend("force", jsonls_opts, opts)
	end

	if server.name == "sumneko_lua" then
		local sumneko_opts = require("plugins.configs.lsp.server-settings.sumneko_lua")
		opts = vim.tbl_deep_extend("force", sumneko_opts, opts)
	end

	if server.name == "pyright" then
		local pyright_opts = require("plugins.configs.lsp.server-settings.pyright")
		opts = vim.tbl_deep_extend("force", pyright_opts, opts)
	end

	-- This setup() function is exactly the same as lspconfig's setup function.
	-- Refer to https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md
	server:setup(opts)
end)
