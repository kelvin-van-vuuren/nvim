local M = {}
local cmd = vim.cmd

-- Keymap helper function --
M.map = function(mode, keys, command, opt)
   local options = { noremap = true, silent = true }
   if opt then
      options = vim.tbl_extend("force", options, opt)
   end

   -- all valid modes allowed for mappings
   -- :h map-modes
   local valid_modes = {
      [""] = true,
      ["n"] = true,
      ["v"] = true,
      ["s"] = true,
      ["x"] = true,
      ["o"] = true,
      ["!"] = true,
      ["i"] = true,
      ["l"] = true,
      ["c"] = true,
      ["t"] = true,
   }

   -- helper function for M.map
   -- can gives multiple modes and keys
   local function map_wrapper(sub_mode, lhs, rhs, sub_options)
      if type(lhs) == "table" then
         for _, key in ipairs(lhs) do
            map_wrapper(sub_mode, key, rhs, sub_options)
         end
      else
         if type(sub_mode) == "table" then
            for _, m in ipairs(sub_mode) do
               map_wrapper(m, lhs, rhs, sub_options)
            end
         else
            if valid_modes[sub_mode] and lhs and rhs then
               vim.api.nvim_set_keymap(sub_mode, lhs, rhs, sub_options)
            else
               sub_mode, lhs, rhs = sub_mode or "", lhs or "", rhs or ""
               print(
                  "Cannot set mapping [ mode = '" .. sub_mode .. "' | key = '" .. lhs .. "' | cmd = '" .. rhs .. "' ]"
               )
            end
         end
      end
   end

   map_wrapper(mode, keys, command, options)
end

-- Path functions --
M.script_path = function()
   local str = debug.getinfo(2, "S").source:sub(2)
   return str:match("(.*/)")
end

M.get_directories = function(path)
    local pfile = assert(io.popen(("find '%s' -mindepth 1 -maxdepth 1 -type d -printf '%%f\\0'"):format(path), 'r'))
    local list = pfile:read('*a')
    pfile:close()

    local directories = {}

    for filename in string.gmatch(list, '[^%z]+') do
        table.insert(directories, filename)
    end

    return directories
end

-- Highlight functions --
M.fg = function(group, col)
    cmd("hi " .. group .. " guifg=" .. col)
end

M.bg = function(group, col)
    cmd("hi " .. group .. " guibg=" .. col)
end

M.fg_bg = function(group, fgcol, bgcol)
    cmd("hi " .. group .. " guifg=" .. fgcol .. " guibg= " .. bgcol)
end

return M
