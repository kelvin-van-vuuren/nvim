local overrides = require("custom.plugins.overrides")

return {

	["goolord/alpha-nvim"] = { disable = false }, -- enables dashboard

	-- Override plugin definition options
	["neovim/nvim-lspconfig"] = {
		config = function()
			require("plugins.configs.lspconfig")
			require("custom.plugins.lsp")
		end,
	},

	-- overrde plugin configs
	["nvim-treesitter/nvim-treesitter"] = {
		override_options = overrides.treesitter,
	},

	["williamboman/mason.nvim"] = {
		override_options = overrides.mason,
	},

	["kyazdani42/nvim-tree.lua"] = {
		override_options = overrides.nvimtree,
	},

	["nvim-telescope/telescope.nvim"] = {
		override_options = function()
			return {
				defaults = {
					mappings = {
						i = { ["<ESC>"] = require("telescope.actions").close },
					},
				},
			}
		end,
	},

	["lewis6991/gitsigns.nvim"] = {
		override_options = overrides.gitsigns,
	},

	["NvChad/ui"] = {
		override_options = overrides.nvchad_ui,
	},

	["hrsh7th/nvim-cmp"] = {
        override_options = overrides.cmp,
    },

	-- Additional plugins

	-- escape using key combo (currently set to jk)
	["max397574/better-escape.nvim"] = {
		event = "InsertEnter",
		config = function()
			require("custom.plugins.betterescape")
		end,
	},

	-- code formatting, linting etc
	["jose-elias-alvarez/null-ls.nvim"] = {
		after = "nvim-lspconfig",
		config = function()
			require("custom.plugins.lsp.null-ls")
		end,
	},

	-- debugger
	["mfussenegger/nvim-dap"] = {
		config = function()
			require("custom.plugins.dap")
		end,
	},

	["rcarriga/nvim-dap-ui"] = {
		config = function()
			require("dapui").setup()
		end,
		requires = { "mfussenegger/nvim-dap" },
	},

	["theHamsta/nvim-dap-virtual-text"] = {
		config = function()
			require("nvim-dap-virtual-text").setup()
		end,
		requires = { "mfussenegger/nvim-dap" },
	},

	-- better bdelete, close buffers without closing windows
	["ojroques/nvim-bufdel"] = {},

	-- remove plugin
	-- ["NvChad/nvterm"] = false,
}
