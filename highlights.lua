-- To find any highlight groups: "<cmd> Telescope highlights"
-- Each highlight group can take a table with variables fg, bg, bold, italic, etc
-- base30 variable names can also be used as colors

local M = {}

---@type Base46HLGroupsList
M.override = {
  Comment = { italic = true },
  ['@function'] = { bold = true, italic = true },
  ['@function.call'] = { bold = true, italic = true },
  IncSearch = { bold = true },
  Search = { link = 'IncSearch' },
}

---@type HLTable
M.add = {
  DiagnosticUnderlineHint = { underdashed = true, sp = 'purple' },
  DiagnosticUnderlineInfo = { underline = true, sp = 'LightBlue' },
  DiagnosticUnderlineWarn = { undercurl = true, sp = 'yellow' },
  DiagnosticUnderlineError = { undercurl = true, sp = 'red' },
  TelescopeMatching = { link = 'IncSearch' },
  -- Navic
  -- NavicIconsFile = { link = '' },
  NavicIconsModule = { link = 'CmpItemKindModuleDefault' },
  NavicIconsNamespace = { link = '@lsp.type.namespace' },
  NavicIconsPackage = { link = '' },
  NavicIconsClass = { link = '@lsp.type.class' },
  NavicIconsMethod = { link = '@method' },
  NavicIconsProperty = { link = '@lsp.type.property' },
  NavicIconsField = { link = '@field' },
  NavicIconsConstructor = { link = '@constructor' },
  NavicIconsEnum = { link = '@lsp.type.enum' },
  NavicIconsInterface = { link = '@lsp.type.interface' },
  NavicIconsFunction = { link = '@function' },
  NavicIconsVariable = { link = '@variable' },
  NavicIconsConstant = { link = '@constant' },
  NavicIconsString = { link = '@string' },
  NavicIconsNumber = { link = '@number' },
  NavicIconsBoolean = { link = '@boolean' },
  NavicIconsArray = { link = '' },
  NavicIconsObject = { link = '' },
  NavicIconsKey = { link = '@keyword' },
  NavicIconsNull = { link = 'javaScriptNull' },
  NavicIconsEnumMember = { link = '@lsp.type.enumMember' },
  NavicIconsStruct = { link = '@lsp.type.struct' },
  NavicIconsEvent = { link = 'CmpItemKindEventDefault' },
  NavicIconsOperator = { link = '@operator' },
  NavicIconsTypeParameter = { link = '@lsp.type.typeParameter' },
  NavicText = { link = '@text' },
  -- NavicSeparator = { link = '' },
  LspInlayHint = { link = 'Comment' },
}

return M
