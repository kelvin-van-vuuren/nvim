local dap = require("dap")

-- ui
require("configs.dap.ui")

-- debuggers
local gdb = require("configs.dap.adapters.gdb")
local cppdbg = require("configs.dap.adapters.cppdbg")

dap.adapters.gdb = gdb.adapter
dap.adapters.cppdbg = cppdbg.adapter

dap.configurations.c = gdb.config
dap.configurations.cpp = cppdbg.config
dap.configurations.rust = gdb.config
