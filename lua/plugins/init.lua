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
    use { 'neoclide/coc.nvim', branch = 'release' }
    use 'glepnir/lspsaga.nvim'
    use 'nvim-treesitter/nvim-treesitter' --, {'do': ':TSUpdate'}

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
      
    -- Debugging
    use 'puremourning/vimspector'
    use 'szw/vim-maximizer'

    -- Utility
    use 'windwp/nvim-autopairs'
    use 'scrooloose/nerdcommenter'
    use 'ludovicchabant/vim-gutentags' 
    use 'tweekmonster/startuptime.vim'

    -- Automatically set up your configuration after cloning packer.nvim
    if packer_bootstrap then
        require('packer').sync()
    end
end)
