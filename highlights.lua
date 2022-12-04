local M = {}

M.add_hlgroups = {
	DiagnosticUnderlineError = { undercurl = true, fg = "red" },
	DiagnosticUnderlineWarn = { undercurl = true, fg = "yellow" },
	DiagnosticUnderlineInfo = { undercurl = true, fg = "green" },
	DiagnosticUnderlineHint = { undercurl = true, fg = "purple" },
}

return M
