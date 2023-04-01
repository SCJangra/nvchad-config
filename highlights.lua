-- To find any highlight groups: "<cmd> Telescope highlights"
-- Each highlight group can take a table with variables fg, bg, bold, italic, etc
-- base30 variable names can also be used as colors

local M = {}

---@type Base46HLGroupsList
M.override = {
  Comment = { italic = true },
  ['@function'] = { bold = true, italic = true },
  ['@function.call'] = { bold = true, italic = true },
}

---@type HLTable
M.add = {
  DiagnosticUnderlineHint = { underdashed = true, sp = 'purple' },
  DiagnosticUnderlineInfo = { underline = true, sp = 'LightBlue' },
  DiagnosticUnderlineWarn = { undercurl = true, sp = 'base0A' },
  DiagnosticUnderlineError = { undercurl = true, sp = 'base08' },
}

return M
