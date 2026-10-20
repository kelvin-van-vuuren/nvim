---@type ChadrcConfig
local M = {}

local overrides = require("configs.overrides")

M.base46 = {
	theme = "onedark",

	-- hl_override = {
	-- 	Comment = { italic = true },
	-- 	["@comment"] = { italic = true },
	-- },
}

M.ui = overrides.ui

-- Packages installed by :MasonInstallAll. NvChad also adds the servers enabled
-- through vim.lsp.enable and the formatters registered with conform.
M.mason = overrides.mason

return M
