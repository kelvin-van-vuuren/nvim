local colors = require("colors").get()
local lsp = require("feline.providers.lsp")
local lsp_severity = vim.diagnostic.severity

local style = {
	left = " ",
	right = " ",
	vi_mode_icon = "  ",
	position_icon = " ",
}

-- Initialize the components table
local components = {
	active = {},
	inactive = {},
}

table.insert(components.active, {})
table.insert(components.active, {})
table.insert(components.active, {})

local mode_colors = {
	["n"] = { "NORMAL ", colors.nord_blue },
	["no"] = { "N-PENDING", colors.red },
	["i"] = { "INSERT ", colors.dark_purple },
	["ic"] = { "INSERT", colors.dark_purple },
	["t"] = { "TERMINAL", colors.green },
	["v"] = { "VISUAL ", colors.cyan },
	["V"] = { "V-LINE ", colors.cyan },
	[""] = { "V-BLOCK", colors.cyan },
	["R"] = { "REPLACE", colors.orange },
	["Rv"] = { "V-REPLACE", colors.orange },
	["s"] = { "SELECT ", colors.red },
	["S"] = { "S-LINE ", colors.red },
	[""] = { "S-BLOCK", colors.red },
	["c"] = { "COMMAND", colors.pink },
	["cv"] = { "COMMAND", colors.pink },
	["ce"] = { "COMMAND", colors.pink },
	["r"] = { "PROMPT ", colors.teal },
	["rm"] = { "MORE   ", colors.teal },
	["r?"] = { "CONFIRM", colors.teal },
	["!"] = { "SHELL   ", colors.green },
}

local mode_hl = function()
	return {
		fg = colors.statusline_bg,
		bg = mode_colors[vim.fn.mode()][2],
	}
end

components.active[1][1] = {
	provider = style.vi_mode_icon,
	hl = mode_hl,
}

components.active[1][2] = {
	provider = function()
		return " " .. mode_colors[vim.fn.mode()][1] .. " "
	end,
	hl = mode_hl,
}

components.active[1][3] = {
	provider = style.right,
	hl = function()
		return {
			fg = mode_colors[vim.fn.mode()][2],
			bg = colors.one_bg,
		}
	end,
}

components.active[1][4] = {
	provider = function()
		local filename = vim.fn.expand("%:t")
		local extension = vim.fn.expand("%:e")
		local icon = require("nvim-web-devicons").get_icon(filename, extension)
		if icon == nil then
			icon = " "
			return icon
		end
		return " " .. icon .. " " .. filename .. " "
	end,
	hl = {
		fg = colors.white,
		bg = colors.lightbg,
	},

	right_sep = { str = style.right, hl = { fg = colors.lightbg, bg = colors.lightbg2 } },
}

components.active[1][5] = {
	provider = function()
		local dir_name = vim.fn.fnamemodify(vim.fn.getcwd(), ":t")
		return "  " .. dir_name .. " "
	end,
	hl = {
		fg = colors.grey_fg2,
		bg = colors.lightbg2,
	},
	right_sep = {
		str = style.right,
		hi = {
			fg = colors.lightbg2,
			bg = colors.statusline_bg,
		},
	},
}

components.active[1][6] = {
	provider = "git_diff_added",
	hl = {
		fg = colors.grey_fg2,
		bg = colors.statusline_bg,
	},
	icon = " ",
}
-- diffModfified
components.active[1][7] = {
	provider = "git_diff_changed",
	hl = {
		fg = colors.grey_fg2,
		bg = colors.statusline_bg,
	},
	icon = "   ",
}
-- diffRemove
components.active[1][8] = {
	provider = "git_diff_removed",
	hl = {
		fg = colors.grey_fg2,
		bg = colors.statusline_bg,
	},
	icon = "  ",
}

components.active[1][9] = {
	provider = "diagnostic_errors",
	enabled = function()
		return lsp.diagnostics_exist(lsp_severity.ERROR)
	end,

	hl = { fg = colors.red },
	icon = "  ",
}

components.active[1][10] = {
	provider = "diagnostic_warnings",
	enabled = function()
		return lsp.diagnostics_exist(lsp_severity.WARN)
	end,
	hl = { fg = colors.yellow },
	icon = "  ",
}

components.active[1][11] = {
	provider = "diagnostic_hints",
	enabled = function()
		return lsp.diagnostics_exist(lsp_severity.HINT)
	end,
	hl = { fg = colors.grey_fg2 },
	icon = "  ",
}

components.active[1][12] = {
	provider = "diagnostic_info",
	enabled = function()
		return lsp.diagnostics_exist(lsp_severity.INFO)
	end,
	hl = { fg = colors.green },
	icon = "  ",
}

components.active[2][1] = {
	provider = function()
		local Lsp = vim.lsp.util.get_progress_messages()[1]

		if Lsp then
			local msg = Lsp.message or ""
			local percentage = Lsp.percentage or 0
			local title = Lsp.title or ""
			local spinners = {
				"",
				"",
				"",
			}

			local success_icon = {
				"",
				"",
				"",
			}

			local ms = vim.loop.hrtime() / 1000000
			local frame = math.floor(ms / 120) % #spinners

			if percentage >= 70 then
				return string.format(" %%<%s %s %s (%s%%%%) ", success_icon[frame + 1], title, msg, percentage)
			end

			return string.format(" %%<%s %s %s (%s%%%%) ", spinners[frame + 1], title, msg, percentage)
		end

		return ""
	end,
	hl = { fg = colors.green },
}

components.active[3][1] = {
	provider = function()
		if next(vim.lsp.buf_get_clients()) ~= nil then
			return "  LSP"
		else
			return ""
		end
	end,
	hl = { fg = colors.grey_fg2, bg = colors.statusline_bg },
}

components.active[3][2] = {
	provider = " " .. style.left,
	hl = {
		fg = colors.orange,
		bg = colors.statusline_bg,
	},
}

components.active[3][3] = {
	provider = "git_branch",
	hl = {
		fg = colors.statusline_bg,
		bg = colors.orange,
	},
	icon = "  ",
}

components.active[3][4] = {
	provider = " " .. style.left,
	hl = {
		fg = colors.statusline_bg,
		bg = colors.orange,
	},
}

-- components.active[3][5] = {
-- 	provider = style.left,
-- 	hl = {
-- 		fg = colors.grey,
-- 		bg = colors.one_bg,
-- 	},
-- }

components.active[3][5] = {
	provider = style.left,
	hl = {
		fg = colors.green,
		bg = colors.one_bg,
	},
}

components.active[3][6] = {
	provider = style.position_icon,
	hl = {
		fg = colors.black,
		bg = colors.green,
	},
}

components.active[3][7] = {
	provider = function()
		local current_line = vim.fn.line(".")
		local total_line = vim.fn.line("$")
		local result, _ = math.modf((current_line / total_line) * 100)
		return " " .. result .. "%%"
	end,

	hl = {
		fg = colors.green,
		bg = colors.one_bg,
	},
}

components.active[3][8] = {
	provider = "scroll_bar",
	left_sep = " ",
	hl = {
		fg = colors.blue,
		style = "bold",
	},
}

components.active[3][9] = {
	provider = "   ",
	hl = {
		fg = colors.green,
		bg = colors.one_bg,
	},
}
require("feline").setup({
	theme = {
		bg = colors.statusline_bg,
		fg = colors.fg,
	},
	components = components,
})
