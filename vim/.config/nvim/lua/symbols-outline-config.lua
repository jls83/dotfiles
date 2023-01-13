local symbols_outline = require("symbols-outline")

local symbols = {
    File = {icon = "", hl = "CmpItemKindFile"},
    Module = {icon = "", hl = "CmpItemKindModule"},
    Class = {icon = "ﴯ", hl = "CmpItemKindClass"},
    Method = {icon = "", hl = "CmpItemKindMethod"},
    Property = {icon = "ﰠ", hl = "CmpItemKindProperty"},
    Field = {icon = "ﰠ", hl = "CmpItemKindField"},
    Constructor = {icon = "", hl = "CmpItemKindConstructor"},
    Enum = {icon = "", hl = "CmpItemKindEnum"},
    Interface = {icon = "", hl = "CmpItemKindInterface"},
    Function = {icon = "", hl = "CmpItemKindFunction"},
    Variable = {icon = "", hl = "CmpItemKindProperty"}, -- Diff
    Constant = {icon = "", hl = "CmpItemKindConstant"},
    EnumMember = {icon = "", hl = "CmpItemKindEnumMember"},
    Struct = {icon = "פּ", hl = "CmpItemKindStruct"},
    Event = {icon = "", hl = "CmpItemKindConstructor"}, -- Diff
    Operator = {icon = "", hl = "CmpItemKindKeyword"}, -- Diff
    TypeParameter = {icon = "", hl = "CmpItemKindTypeParameter"},

    -- TODO: Edit these!
    Boolean = {icon = "⊨", hl = "TSBoolean"},
    Array = {icon = "", hl = "TSConstant"},
    Object = {icon = "", hl = "TSType"},
    Key = {icon = "", hl = "TSType"},
    Null = {icon = "", hl = "TSType"},
    Namespace = {icon = "", hl = "TSNamespace"},
    Package = {icon = "", hl = "TSNamespace"},
    String = {icon = "", hl = "TSString"},
    Number = {icon = "#", hl = "TSNumber"},
}

symbols_outline.setup({
    symbols = symbols,
})
