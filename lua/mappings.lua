require("nvchad.mappings")

local map = vim.keymap.set

-- General
map("n", ";", ":", { nowait = true, desc = "Command mode" })
map("x", "<Leader>p", [["_dP]], { desc = "Paste without replacing clipboard" })

-- Telescope
map("n", "<C-p>", "<cmd>Telescope git_files<CR>", { desc = "Find files in version control" })
map("n", "<Leader>pf", "<cmd>Telescope find_files<CR>", { desc = "Find files" })
map(
	"n",
	"<Leader>pfa",
	"<cmd>Telescope find_files follow=true no_ignore=true hidden=true<CR>",
	{ desc = "Find all files" }
)
map("n", "<Leader>pg", "<cmd>Telescope live_grep<CR>", { desc = "Grep files" })
map("n", "<Leader>pb", "<cmd>Telescope buffers<CR>", { desc = "Find buffers" })
map("n", "<Leader>ph", "<cmd>Telescope help_tags<CR>", { desc = "Help page" })
map("n", "<Leader>po", "<cmd>Telescope oldfiles<CR>", { desc = "Find oldfiles" })
map("n", "<Leader>pk", "<cmd>Telescope keymaps<CR>", { desc = "Show keymaps" })

-- Nvim DAP
map("n", "<Leader>dl", function()
	require("dap").step_into()
end, { desc = "Debugger step into" })
map("n", "<Leader>dj", function()
	require("dap").step_over()
end, { desc = "Debugger step over" })
map("n", "<Leader>dk", function()
	require("dap").step_out()
end, { desc = "Debugger step out" })
map("n", "<Leader>d<space>", function()
	require("dap").continue()
end, { desc = "Debugger continue" })
map("n", "<Leader>db", function()
	require("dap").toggle_breakpoint()
end, { desc = "Debugger toggle breakpoint" })
map("n", "<Leader>dd", function()
	require("dap").set_breakpoint(vim.fn.input("Breakpoint condition: "))
end, { desc = "Debugger set conditional breakpoint" })
map("n", "<Leader>de", function()
	require("dap").terminate()
end, { desc = "Debugger reset" })
map("n", "<Leader>dr", function()
	require("dap").run_last()
end, { desc = "Debugger run last" })
map("n", "<Leader>dp", function()
	require("dap").repl.toggle()
end, { desc = "Debugger toggle REPL" })
map("n", "<Leader>du", function()
	require("dapui").toggle()
end, { desc = "Debugger toggle UI" })
map({ "n", "x" }, "<Leader>dv", function()
	require("dapui").eval()
end, { desc = "Debugger evaluate expression" })

-- Terminal
map({ "n", "t" }, "<C-\\>", function()
	require("nvchad.term").toggle({ pos = "float", id = "floatTerm" })
end, { desc = "Terminal Toggle Floating term" })

-- File tree
map("n", "<C-a>", "<cmd>NvimTreeToggle<Cr>", { desc = "Toggle file tree" })

-- LSP config
map("n", "gl", function()
	vim.diagnostic.open_float({ scope = "line", border = "single" })
end, { desc = "Lsp show diagnostic" })
map("n", "<Leader>dF", function()
	vim.diagnostic.jump({ count = -1, float = true })
end, { desc = "Go to previous diagnostic" })
map("n", "<Leader>df", function()
	vim.diagnostic.jump({ count = 1, float = true })
end, { desc = "Go to next diagnostic" })
map("n", "<Leader>dt", "<cmd>Telescope diagnostics<CR>", { desc = "Telescope diagnostics" })
map("n", "<Leader>ca", vim.lsp.buf.code_action, { desc = "Lsp code action" })
map("n", "<Leader>lh", function()
	vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled({ bufnr = 0 }), { bufnr = 0 })
end, { desc = "Lsp toggle inlay hints" })

-- Conform
map("n", "<C-f>", function()
	require("conform").format({ async = true, lsp_format = "fallback" })
end, { desc = "Format current file [Conform]" })

-- Buffer delete
map("n", "<Leader>q", "<cmd>BufDel<CR>", { desc = "Close buffer" })
map("n", "<Leader>Q", "<cmd>BufDel!<CR>", { desc = "Close buffer ignore changes" })

-- Buffer line
map("n", "<TAB>", "<C-i>") -- Keep <C-i> for jump forward
map("n", "L", function()
	require("nvchad.tabufline").next()
end, { desc = "Go to next buffer" })
map("n", "H", function()
	require("nvchad.tabufline").prev()
end, { desc = "Go to previous buffer" })

-- Plenary
map("n", "<Leader>t", "<Plug>PlenaryTestFile", { desc = "Run plenary test on file" })
