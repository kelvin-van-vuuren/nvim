-- This adapter seems to work better with nvim-dap-ui
-- You will need to download and set up the cpptools extension for this to work
-- eg:
-- mkdir -p ~/.local/share/cpptools
-- cd ~/.local/share/cpptools
-- wget https://github.com/microsoft/vscode-cpptools/releases/download/1.25.3/cpptools-linux-X64.vsix
-- unzip cpptools-linux.vsix -d cpptools
-- chmod +x cpptools/extension/debugAdapters/bin/OpenDebugAD7

local M = {}

local home = os.getenv("HOME")

M.adapter = {
  id = 'cppdbg',
  type = 'executable',
  command = home .. '/.local/share/cpptools/cpptools/extension/debugAdapters/bin/OpenDebugAD7',
}

M.config = {
  {
    name = "Launch file",
    type = "cppdbg",
    request = "launch",
    program = function()
      return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
    end,
    cwd = '${workspaceFolder}',
    stopOnEntry = true,
    setupCommands = {
      {
        text = '-enable-pretty-printing',
        description = 'Enable pretty printing',
        ignoreFailures = false
      },
    },
  },
}

return M
