-- Reset highlights
vim.cmd("hi clear")
if vim.fn.exists("syntax_on") then
    vim.cmd("syntax reset")
end
vim.g.colors_name = "github-dark"
vim.opt.background = "dark"

local function hi(group, opts)
    vim.api.nvim_set_hl(0, group, opts)
end

--------------------------------------------------------------------------------
-- UI Elements
--------------------------------------------------------------------------------
hi("Normal",       { fg = "#c9d1d9", bg = "NONE" })
hi("LineNr",       { fg = "#484f58", bg = "NONE" })
hi("CursorLine",   { bg = "#161b22" }) -- Underline removed by not setting underline = true
hi("CursorLineNr", { fg = "#f0f6fc", bold = true })
hi("Visual",       { bg = "#1f6feb" })
hi("Search",       { fg = "#0d1117", bg = "#e3b341" })
hi("VertSplit",    { fg = "#30363d", bg = "NONE" })
hi("EndOfBuffer",  { fg = "#79c0ff" })
hi("StatusLine",   { fg = "#c9d1d9", bg = "#161b22" })
hi("StatusLineNC", { fg = "#8b949e", bg = "#0d1117" })

--------------------------------------------------------------------------------
-- Standard Syntax
--------------------------------------------------------------------------------
hi("Comment",      { fg = "#8b949e", italic = true })
hi("Constant",     { fg = "#79c0ff" })
hi("String",       { fg = "#a5d6ff" })
hi("Character",    { fg = "#a5d6ff" })
hi("Number",       { fg = "#79c0ff" })
hi("Boolean",      { fg = "#79c0ff" })
hi("Float",        { fg = "#79c0ff" })

hi("Identifier",   { fg = "#ffa657" })
hi("Function",     { fg = "#d2a8ff" })
hi("Statement",    { fg = "#ff7b72" })
hi("Conditional",  { fg = "#ff7b72" })
hi("Repeat",       { fg = "#ff7b72" })
hi("Operator",     { fg = "#79c0ff" })

hi("PreProc",      { fg = "#ff7b72" })
hi("Type",         { fg = "#ff7b72" })
hi("Special",      { fg = "#79c0ff" })
hi("Underlined",   { underline = true })
hi("Error",        { fg = "#f85149", bg = "NONE" })

--------------------------------------------------------------------------------
-- Language Specific (HTML/JS)
--------------------------------------------------------------------------------
hi("htmlTagName",  { fg = "#7ee787" })
hi("htmlTag",      { fg = "#c9d1d9" })
hi("htmlArg",      { fg = "#79c0ff" })
hi("javaScript",   { fg = "#c9d1d9" })

-- Tree-sitter links (Optional: ensures modern nvim plugins use your colors)
hi("@variable",    { link = "Identifier" })
hi("@function",    { link = "Function" })
hi("@keyword",     { link = "Statement" })
hi("@constant",    { link = "Constant" })
hi("@tag",         { link = "htmlTagName" })
