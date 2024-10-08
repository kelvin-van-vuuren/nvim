---@type ChadrcConfig
local M = {}

-- Path to overriding theme and highlights files
-- local highlights = require("highlights")
local overrides = require("configs.overrides")

M.ui = {
	theme = "onedark",

	-- hl_override = {
	-- 	Comment = { italic = true },
	-- 	["@comment"] = { italic = true },
	-- },
}

M.ui = overrides.ui

return M
