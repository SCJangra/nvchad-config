local m = require 'core.mappings'

local M = {}

M.disabled = {
  n = {
    ['<leader>ff'] = '',
  },
}

for _, v in pairs(m) do
  for mode, maps in pairs(v) do
    if type(maps) ~= 'table' then
      goto continue
    end

    if not M.disabled[mode] then
      M.disabled[mode] = {}
    end

    for key, _ in pairs(maps) do
      M.disabled[mode][key] = ''
    end

    ::continue::
  end
end

return M
