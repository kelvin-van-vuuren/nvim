local overrides = require "custom.plugins.overrides"

return {

  ["goolord/alpha-nvim"] = { disable = false }, -- enables dashboard

  -- Override plugin definition options
  ["neovim/nvim-lspconfig"] = {
    config = function()
      require "plugins.configs.lspconfig"
      require "custom.plugins.lsp"
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
                    } ,
                },
            }
        end,
  },

  ["lewis6991/gitsigns.nvim"] = {
    override_options = overrides.gitsigns,
  },

  -- Additional plugins

    -- escape using key combo (currently set to jk)
  ["max397574/better-escape.nvim"] = {
    event = "InsertEnter",
    config = function()
      require "custom.plugins.betterescape"
    end,
  },

  -- code formatting, linting etc
  ["jose-elias-alvarez/null-ls.nvim"] = {
    after = "nvim-lspconfig",
    config = function()
      require "custom.plugins.null-ls"
    end,
  },

    -- debugger
    ["mfussenegger/nvim-dap"] = {
        config = function()
            require "custom.plugins.nvim-dap"
        end,
    },

    ["rcarriga/nvim-dap-ui"] = {
        config = function()
            require("dapui").setup()
        end,
    },

    ["theHamsta/nvim-dap-virtual-text"] = {
        config = function ()
            require("nvim-dap-virtual-text").setup()
        end
    },

  -- remove plugin
  -- ["NvChad/nvterm"] = false,
}
