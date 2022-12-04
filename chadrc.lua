local M = {}

M.ui = {
	theme_toggle = { "onedark", "one_light" },
	theme = "onedark",
	hl_add = require("custom.highlights").add_hlgroups,
}

M.plugins = require("custom.plugins")

-- check core.mappings for table structure
M.mappings = require("custom.mappings")

return M
