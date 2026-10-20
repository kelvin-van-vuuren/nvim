local dap = require("dap")

-- ui
require("configs.dap.ui")

-- debuggers
local gdb = require("configs.dap.adapters.gdb")
local cppdbg = require("configs.dap.adapters.cppdbg")

dap.adapters.gdb = gdb.adapter
dap.adapters.cppdbg = cppdbg.adapter

-- C and C++ get the same menu: cpptools (cppdbg) entries first, gdb's native
-- DAP entries after them.
local c_configs = vim.list_extend(vim.deepcopy(cppdbg.config), gdb.config)

dap.configurations.c = c_configs
dap.configurations.cpp = c_configs
dap.configurations.rust = gdb.config
