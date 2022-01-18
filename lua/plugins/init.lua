local fn = vim.fn

-- Automatically install packer if not present already
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
	packer_bootstrap = fn.system({
		"git",
		"clone",
		"--depth",
		"1",
		"https://github.com/wbthomason/packer.nvim",
		install_path,
	})
	print("Installing packer, close and reopen neovim...")
	vim.cmd([[packadd packer.nvim]])
end

-- Load plugin configs + mappings
local utils = require("utils")
for _, plugin in pairs(utils.get_directories(utils.script_path() .. "configs")) do
	require("plugins.configs." .. plugin)
end

-- Install plugins
return require("packer").startup(function(use)
	-- Required
	use("wbthomason/packer.nvim") -- Have packer manage itself
	use("nvim-lua/popup.nvim") -- An implementation of the popup api from vim in neovim
	use("nvim-lua/plenary.nvim") -- Useful lua functions used by lots of plugins

	-- Theming
	use("kyazdani42/nvim-web-devicons") -- icons
	use("ryanoasis/vim-devicons") -- icons
	use("NvChad/nvim-base16.lua") -- colour schemes

	-- LSP
	use("neovim/nvim-lspconfig") -- enable lsp
	use("williamboman/nvim-lsp-installer") -- language server installer
	use({ "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" }) -- syntax highlighting
	use("jose-elias-alvarez/null-ls.nvim")

	-- Code Completion
	use({
		"hrsh7th/nvim-cmp", -- completion engine
		requires = { -- completion sources
			{ "hrsh7th/cmp-buffer" },
			{ "hrsh7th/cmp-nvim-lua" },
			{ "hrsh7th/cmp-path" },
			{ "hrsh7th/cmp-cmdline" },
			{ "hrsh7th/cmp-nvim-lsp" },
			{ "saadparwaiz1/cmp_luasnip" },
		},
	})

	-- Snippets
	use("L3MON4D3/LuaSnip") -- snippet engine
	use("rafamadriz/friendly-snippets") -- set of preconfigured snippets for different languages

	-- Better quickfix list
	use("kevinhwang91/nvim-bqf")

	-- File tree
	use("kyazdani42/nvim-tree.lua")

	-- Git
	use("lewis6991/gitsigns.nvim") -- git info in buffers

	-- Status lines
	use("feline-nvim/feline.nvim") -- bottom status line
	--use({ "glepnir/galaxyline.nvim", branch = "main" }) -- status line at bottom
	use("akinsho/nvim-bufferline.lua") -- shows open buffers along top

	-- Fuzzy finder
	use("nvim-telescope/telescope.nvim") -- file picker, fuzzy finder, sorter, previewer very useful
	use({ "nvim-telescope/telescope-fzf-native.nvim", run = "make" }) -- use telescope's fzf port as sorter
	--
	-- Debugging
	use("jbyuki/one-small-step-for-vimkind") -- for lua plugin debugging
	use("puremourning/vimspector") -- graphical debugger for vim
	use("szw/vim-maximizer") -- used to maximise windows (useful with vimspector)

	-- Commenting
	use("JoosepAlviste/nvim-ts-context-commentstring")
	use("numToStr/Comment.nvim")

	-- Utility
	use("akinsho/toggleterm.nvim") -- terminal
	use("moll/vim-bbye") -- better buffer deletion
	use("windwp/nvim-autopairs")
	use("ludovicchabant/vim-gutentags")
	use("max397574/better-escape.nvim") -- 'jk' to esc
	-- use 'tweekmonster/startuptime.vim'

	-- Automatically set up your configuration after cloning packer.nvim
	if packer_bootstrap then
		require("packer").sync()
	end
end)
