local dap = require("dap")

-- ui
require("configs.dap.ui")

-- debuggers
local gdb = require("configs.dap.adapters.gdb")

dap.adapters.gdb = gdb.adapter

dap.configurations.c = gdb.config
dap.configurations.cpp = gdb.config
dap.configurations.rust = gdb.config
