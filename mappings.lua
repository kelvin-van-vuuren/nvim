local M = {}

M.general = {
  n = {
    [";"] = { ":", "command mode", opts = { nowait = true } },
    ["<Leader><Leader>"] = { ":nohlsearch<CR>" }, -- clear searrch highlighting
    ["C-f"] = { ":Format<CR>" },
  },
}

M.telescope = {
    n = {
        ["<C-p>"] = { ":Telescope git_files <CR>" },
        ["<leader>pf"] = { "<cmd> Telescope find_files <CR>", "find files" },
        ["<leader>pfa"] = { "<cmd> Telescope find_files follow=true no_ignore=true hidden=true <CR>", "find all" },
        ["<leader>pg"] = { "<cmd> Telescope live_grep prompt_prefix=🔍<CR>", "live grep" },
        ["<leader>pb"] = { "<cmd> Telescope buffers <CR>", "find buffers" },
        ["<leader>ph"] = { "<cmd> Telescope help_tags <CR>", "help page" },
        ["<leader>po"] = { "<cmd> Telescope oldfiles <CR>", "find oldfiles" },
        ["<leader>pk"] = { "<cmd> Telescope keymaps <CR>", "show keys" },
    }
}

M.nvterm = {
  plugin = true,

  t = {
    -- toggle in terminal mode
    ["<C-\\>"] = {
      function()
        require("nvterm.terminal").toggle "float"
      end,
      "toggle floating term",
    },

    ["<leader-h>"] = {
      function()
        require("nvterm.terminal").toggle "horizontal"
      end,
      "toggle horizontal term",
    },

    ["<leader-v>"] = {
      function()
        require("nvterm.terminal").toggle "vertical"
      end,
      "toggle vertical term",
    },
  },

  n = {
    -- toggle in normal mode
    ["<C-\\>"] = {
      function()
        require("nvterm.terminal").toggle "float"
      end,
      "toggle floating term",
    },

    ["<leader-h>"] = {
      function()
        require("nvterm.terminal").toggle "horizontal"
      end,
      "toggle horizontal term",
    },

    ["<leader-v>"] = {
      function()
        require("nvterm.terminal").toggle "vertical"
      end,
      "toggle vertical term",
    },

    -- new

    -- ["<leader>h"] = {
    --   function()
    --     require("nvterm.terminal").new "horizontal"
    --   end,
    --   "new horizontal term",
    -- },
    --
    -- ["<leader>v"] = {
    --   function()
    --     require("nvterm.terminal").new "vertical"
    --   end,
    --   "new vertical term",
    -- },
  },
}

return M
