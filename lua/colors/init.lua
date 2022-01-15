local M = {}

M.config = {
    theme = "onedark",
    italic_comments = true,
    transparency = false,
}

M.init = function()
	local base16 = require("base16")

    base16(base16.themes(M.config.theme), true)

    -- unload to force reload
    package.loaded["colors.highlights" or false] = nil
    -- then load the highlights
    require("colors.highlights")
end

-- returns a table of colors for current theme
M.get = function()
	return require("hl_themes." .. M.config.theme)
end

return M
