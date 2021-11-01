map = vim.api.nvim_set_keymap

local M = {}

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

return M
