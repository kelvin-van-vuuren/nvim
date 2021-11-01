-- autopairs --
local _, autopairs = pcall(require, "nvim-autopairs")
local _, cmp_autopairs = pcall(require, "nvim-autopairs.completion.cmp")

autopairs.setup()

-- better escape --
require("better_escape").setup {
  mapping = { "jk" },
  timeout = 300,
}
-- not needed if you disable cmp, the above var related to cmp tooo! override default config for autopairs
local cmp = require "cmp"
cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())

-- nvim comment --
require("nvim_comment").setup()

-- lsp signature --
require("lsp_signature").setup {
    bind = true,
    doc_lines = 0,
    floating_window = true,
    fix_pos = true,
    hint_enable = true,
    hint_prefix = " ",
    hint_scheme = "String",
    hi_parameter = "Search",
    max_height = 22,
    max_width = 120, -- max_width of signature floating_window, line will be wrapped if exceed max_width
    handler_opts = {
        border = "single", -- double, single, shadow, none
    },
    zindex = 200, -- by default it will be on top of all floating windows, set to 50 send it to bottom
    padding = "", -- character to pad on left and right of signature can be ' ', or '|'  etc
}
