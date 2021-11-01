local fn = vim.fn
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  packer_bootstrap = fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
end

local utils = require("utils")
for _, plugin in pairs(utils.get_directories(utils.script_path() .. "configs")) do
    pcall(require, "plugins.configs."..plugin)
end

return require('packer').startup(function(use)
    use 'wbthomason/packer.nvim'

    -- Theming
    use 'kyazdani42/nvim-web-devicons'
    use 'ryanoasis/vim-devicons'
    use 'NvChad/nvim-base16.lua'

    -- LSP
    -- use { 'neoclide/coc.nvim', branch = 'release' }
    -- use 'glepnir/lspsaga.nvim'
    use 'nvim-treesitter/nvim-treesitter' --, {'do': ':TSUpdate'}
    use "neovim/nvim-lspconfig"
    use {
      "neovim/nvim-lspconfig",
      opt = true,
      setup = function()
         --require("core.utils").packer_lazy_load "nvim-lspconfig"
         -- reload the current file so lsp actually starts for it
         vim.defer_fn(function()
            vim.cmd 'if &ft == "packer" | echo "" | else | silent! e %'
         end, 0)
      end,
    }
    use "hrsh7th/nvim-cmp"
    use "hrsh7th/cmp-nvim-lsp"
    use "hrsh7th/cmp-buffer"
    use "hrsh7th/cmp-path"

    use "ray-x/lsp_signature.nvim"

    -- File tree
    use 'kyazdani42/nvim-tree.lua'

    -- Git
    use 'lewis6991/gitsigns.nvim'

    -- Status lines
    use { 'glepnir/galaxyline.nvim', branch = 'main' }
    use 'akinsho/nvim-bufferline.lua'

    -- Fuzzy finder
    use 'nvim-lua/popup.nvim'
    use 'nvim-telescope/telescope-fzy-native.nvim'
    use {
      'nvim-telescope/telescope.nvim',
      requires = { { 'nvim-lua/plenary.nvim' }, }
    }
   use "rafamadriz/friendly-snippets"
   use "hrsh7th/nvim-cmp"
   use "L3MON4D3/LuaSnip"
   use "saadparwaiz1/cmp_luasnip"
      
    -- Debugging
    use 'puremourning/vimspector'
    use 'szw/vim-maximizer'

    -- Utility
    use "terrortylor/nvim-comment"
    use 'windwp/nvim-autopairs'
    use 'ludovicchabant/vim-gutentags' 
    use "max397574/better-escape.nvim"
    -- use 'tweekmonster/startuptime.vim'

    -- Automatically set up your configuration after cloning packer.nvim
    if packer_bootstrap then
        require('packer').sync()
    end
end)
