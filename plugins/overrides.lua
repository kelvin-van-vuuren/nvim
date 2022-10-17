local M = {}

M.treesitter = {
  ensure_installed = {
    "vim",
    "lua",
    "html",
    "css",
    "typescript",
    "c",
  },
}

M.mason = {
  ensure_installed = {
    -- lua stuff
    "lua-language-server",
    "stylua",

    -- web dev stuff
    "css-lsp",
    "html-lsp",
    "typescript-language-server",
    "deno",
  },
}

-- git support in nvimtree
M.nvimtree = {
  git = {
    enable = true,
  },

  renderer = {
    highlight_git = true,
    icons = {
      show = {
        git = true,
      },
    },
  },
}

-- TODO: for some reason this stops custom mappings for telescope from working
-- M.telescope = {
--     mappings = {
--         i = {
--             ["<C-c>"] = require("telescope.actions").close,
--             ["<Esc>"] = require("telescope.actions").close,
--             ["<CR>"] = require("telescope.actions").select_default,
--         },
--     },
-- }

M.gitsigns = {
  signs = {
    add = { hl = "GitSignsAdd", text = "+", numhl = "GitSignsAddNr" },
    change = { hl = "DiffAdd", text = "▎", numhl = "GitSignsChangeNr" },
    delete = { hl = "DiffDelete", text = "-", numhl = "GitSignsDeleteNr" },
    topdelete = { hl = "DiffDelete", text = "- ", numhl = "GitSignsDeleteNr" },
    changedelete = { hl = "DiffChangeDelete", text = "~", numhl = "GitSignsChangeNr" },
  }
}

return M
