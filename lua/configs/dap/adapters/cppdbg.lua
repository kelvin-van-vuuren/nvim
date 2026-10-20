-- Microsoft cpptools (OpenDebugAD7) adapter.
-- Installed by :MasonInstallAll (the "cpptools" package). A manual install in
-- ~/.local/share/cpptools is used as a fallback.

local M = {}

local function command()
	local mason = vim.fn.exepath("OpenDebugAD7")
	if mason ~= "" then
		return mason
	end
	return vim.fn.expand("~/.local/share/cpptools/cpptools/extension/debugAdapters/bin/OpenDebugAD7")
end

local function program()
	return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
end

local function args()
	return vim.split(vim.fn.input("Program arguments: "), " ", { trimempty = true })
end

M.adapter = {
	id = "cppdbg",
	type = "executable",
	command = command(),
}

M.config = {
	{
		name = "Launch file (cpptools)",
		type = "cppdbg",
		request = "launch",
		program = program,
		args = args,
		cwd = "${workspaceFolder}",
		stopOnEntry = true,
		setupCommands = {
			{
				text = "-enable-pretty-printing",
				description = "Enable pretty printing",
				ignoreFailures = false,
			},
		},
	},
	{
		name = "Attach to gdbserver :1234 (cpptools)",
		type = "cppdbg",
		request = "launch",
		program = program,
		cwd = "${workspaceFolder}",
		miMode = "gdb",
		miDebuggerServerAddress = "localhost:1234", -- gdbserver address
		miDebuggerPath = "/usr/bin/gdb",
		stopOnEntry = false,
		setupCommands = {
			{
				text = "-enable-pretty-printing",
				description = "Enable pretty printing",
				ignoreFailures = false,
			},
		},
	},
}

return M
