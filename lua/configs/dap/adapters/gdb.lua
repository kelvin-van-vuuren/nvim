-- GDB's built in DAP interpreter (GDB 14+).

local M = {}

local function program()
	return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
end

local function args()
	return vim.split(vim.fn.input("Program arguments: "), " ", { trimempty = true })
end

M.adapter = {
	type = "executable",
	command = "gdb",
	args = { "--interpreter=dap", "--eval-command", "set print pretty on" },
}

M.config = {
	{
		name = "Launch (gdb)",
		type = "gdb",
		request = "launch",
		program = program,
		args = args,
		cwd = "${workspaceFolder}",
		stopAtBeginningOfMainSubprogram = false,
	},
	{
		name = "Select and attach to process (gdb)",
		type = "gdb",
		request = "attach",
		program = program,
		pid = function()
			local name = vim.fn.input("Executable name (filter): ")
			return require("dap.utils").pick_process({ filter = name })
		end,
		cwd = "${workspaceFolder}",
	},
	{
		name = "Attach to gdbserver :1234 (gdb)",
		type = "gdb",
		request = "attach",
		target = "localhost:1234",
		program = program,
		cwd = "${workspaceFolder}",
	},
}

return M
