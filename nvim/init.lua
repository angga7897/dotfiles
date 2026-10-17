
-- Aktifkan syntax highlighting
vim.cmd("syntax on")

-- Nomor baris
vim.opt.number = true
vim.opt.cursorline = true
vim.opt.relativenumber = true

-- Gunakan warna terminal
vim.opt.termguicolors = true
vim.opt.background = "dark"

-- copas
vim.opt.clipboard = "unnamedplus"

-- tema
-- Custom Catppuccin-like colorscheme
vim.cmd("highlight clear")
vim.g.colors_name = "my_mocha"

local colors = {
    bg       = "#1e1e2e",
    surface  = "#313244",
    text     = "#cdd6f4",
    subtext  = "#a6adc8",
    pink     = "#f5c2e7",
    mauve    = "#cba6f7",
    blue     = "#89b4fa",
    cyan     = "#89dceb",
    green    = "#a6e3a1",
    yellow   = "#f9e2af",
    red      = "#f38ba8",
    peach    = "#fab387",
}

local hl = vim.api.nvim_set_hl

-- Editor
hl(0, "Normal",       { fg = colors.text, bg = colors.bg })
hl(0, "NormalFloat",  { fg = colors.text, bg = colors.surface })
hl(0, "CursorLine",   { bg = colors.surface })
hl(0, "CursorLineNr", { fg = colors.pink, bold = true })
hl(0, "LineNr",       { fg = colors.subtext })
hl(0, "Visual",       { bg = "#45475a" })
hl(0, "Search",       { fg = colors.bg, bg = colors.yellow })
hl(0, "IncSearch",    { fg = colors.bg, bg = colors.peach })
hl(0, "VertSplit",    { fg = colors.surface })
hl(0, "StatusLine",   { fg = colors.text, bg = colors.surface })

-- Syntax highlighting
hl(0, "Comment",    { fg = colors.subtext, italic = true })
hl(0, "Constant",   { fg = colors.peach })
hl(0, "String",     { fg = colors.green })
hl(0, "Character",  { fg = colors.green })
hl(0, "Number",     { fg = colors.peach })
hl(0, "Boolean",    { fg = colors.peach })
hl(0, "Identifier", { fg = colors.text })
hl(0, "Function",   { fg = colors.blue, bold = true })
hl(0, "Statement",  { fg = colors.mauve })
hl(0, "Keyword",    { fg = colors.mauve, italic = true })
hl(0, "Type",       { fg = colors.yellow })
hl(0, "Operator",   { fg = colors.cyan })
hl(0, "PreProc",    { fg = colors.pink })
hl(0, "Error",      { fg = colors.red, bold = true })
hl(0, "Todo",       { fg = colors.bg, bg = colors.yellow, bold = true })
