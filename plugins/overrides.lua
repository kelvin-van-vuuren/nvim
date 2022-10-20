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

    -- C / C++
    "clangd",
    "clang-format",
    "cmake-language-server",
    "cpplint",
    "cpptools",

    -- shell
    "shellcheck",
    "shellharden",
    "bash-language-server",
    "bash-debug-adapter",
    "awk-language-server",

    --python
    "pyright",
    "pylint",
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
