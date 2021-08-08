require("kelvin.telescope")
require("kelvin.lspsaga")
require("kelvin.statusline")
require("kelvin.gitsigns")
require("kelvin.bufferline")
require("kelvin.nvimtree")
require("kelvin.treesitter")
require("kelvin.highlights")

require('nvim-autopairs').setup()

P = function(v)
  print(vim.inspect(v))
  return v
end

if pcall(require, 'plenary') then
  RELOAD = require('plenary.reload').reload_module

  R = function(name)
    RELOAD(name)
    return require(name)
  end
end
