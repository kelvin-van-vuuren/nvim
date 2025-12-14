require("nvchad.configs.lspconfig").defaults()

vim.lsp.log.set_level(vim.log.levels.WARN)

local servers = { "ts_ls", "clangd", "gopls", "pyright" }

for _, lsp in ipairs(servers) do
	local opts = {}
	local exists, settings = pcall(require, "configs.lsp.server-settings." .. lsp)
	if exists then
		opts = vim.tbl_deep_extend("force", settings, opts)
	end
	vim.lsp.config(lsp, opts)
	vim.lsp.enable(lsp)
end

local diagnostics_config = {
	virtual_text = {
		spacing = 4,
		source = "if_many",
		prefix = "●",
		-- this will set set the prefix to a function that returns the diagnostics icon based on the severity
		-- prefix = "icons",
	},
	underline = true,
	update_in_insert = false,
	severity_sort = true,
	float = {
		focusable = false,
		style = "minimal",
		border = "single",
		source = "always",
	},
	inlay_hints = {
		enabled = true,
		exclude = { "vue" }, -- filetypes for which you don't want to enable inlay hints
	},
}

vim.diagnostic.config(diagnostics_config)
