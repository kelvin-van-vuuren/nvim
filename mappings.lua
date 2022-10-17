local M = {}

M.general = {
  n = {
    [";"] = { ":", "command mode", opts = { nowait = true } },
    ["<Leader><Leader>"] = { ":nohlsearch<CR>" }, -- clear searrch highlighting
    ["C-f"] = { ":Format<CR>" },
    ["<Leader>s"] = { ":ClangdSwitchSourceHeader<CR>" },
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
    },

    i = {
        ["<Esc>"] = { '<cmd>lua require("telescope.actions").close(vim.api.nvim_get_current_buf()) <CR>'}
    }
}


M.vimspector = {
    n = {
        -- map("n", "<leader>dl", "<Plug>VimspectorStepInto")
        ["<leader>dl"] = { ":call vimspector#StepInto()<CR>", "debugger step into" },
        ["<leader>dj"] = { ":call vimspector#StepOver()<CR>", "debugger step over" },
        ["<leader>dk"] =  { ":call vimspector#StepOut()<CR>", "debugger step out" },
        ["<leader>d<space>"] = {":call vimspector#Continue()<CR>", "debugger continue" },
        ["<leader>drc"] = { ":call vimspector#RunToCursor()<CR>", "debugger run to cursor" },
        ["<leader>dbp"] = { ":call vimspector#ToggleBreakpoint()<CR>", "debugger toggle breakpoint" },
        ["<leader>dd"] = { "<cmd> vimspector#Launch()<CR>", "debugger launch" },
        ["<leader>de"] = { ":call vimspector#Reset()<CR>", "debugger reset" },
        -- map("n", "<leader>m", ":MaximizerToggle!<CR>", { noremap = true })
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

M.nvimtree = {
    n = {
        ["<C-a>"] = { "<cmd> NvimTreeToggle <CR>", "toggle nvimtree" },
    }
}

M.lspconfig = {
    n = {
        ["gl"] = { '<cmd>lua vim.diagnostic.open_float(0, { scope = "line", border = "single" })<CR>' },
    }


}

M.null_ls = {
    n = {
        ["<C-f>"] = { '<cmd>lua require("custom.plugins.null-ls").lsp_formatting(vim.api.nvim_get_current_buf()) <CR>', 'Format current file using null-ls'}
    }
}

return M
