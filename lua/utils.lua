map = vim.api.nvim_set_keymap

local overrides, M = {}, {}

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

M.createOverrides = function(module)
   local O = {}

   O.get = function(name, default)
      local current = default
      if overrides[module] and overrides[module][name] then
         if type(overrides[module][name]) == "function" then
            current = overrides[module][name]
         elseif type(overrides[module][name]) == "table" then
            for _, override in pairs(overrides[module][name]) do
               current = override(current)
            end
         end
      end
      return current
   end

   return O
end

M.override = function(module, name, overwrite)
   if overrides[module] == nil then
      overrides[module] = {}
   end
   if overrides[module][name] == nil then
      overrides[module][name] = {}
   end
   table.insert(overrides[module][name], overwrite)
end

return M
