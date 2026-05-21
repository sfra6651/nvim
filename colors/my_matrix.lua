-- my_matrix: matrix-green colorscheme, softer and lower-contrast than a pure-black variant.
-- Same matrix-green identity, but desaturated and shifted toward readability:
-- background is a dark green-tinted charcoal (not pure black), foreground is a
-- warm grey-green (not pure white), and every accent green is muted so long
-- coding sessions don't strain the eyes.
-- Activate with: :colorscheme my_matrix

vim.cmd('hi clear')
if vim.fn.exists('syntax_on') then
    vim.cmd('syntax reset')
end

vim.o.background = 'dark'
vim.g.colors_name = 'my_matrix'

local c = {
    bg            = '#161616', -- very dark off-black grey (no green tint)
    bg_alt        = '#1d1d1d', -- floats, statusline, pmenu
    bg_visual     = '#2a4030', -- green selection (selection keeps the matrix accent)
    bg_cursor     = '#1c1c1c', -- subtle cursor line
    fg            = '#cccccc', -- neutral off-white (slightly below pure white, no green tint)
    fg_dim        = '#3a8050', -- saturated muted green for UI chrome
    accent_bright = '#4fd95f', -- saturated matrix green: titles, search match (UI only)
    func          = '#3da651', -- matrix green: functions and methods
    builtin       = '#56cd6f', -- darker matrix green: built-ins, control flow
    type          = '#c8d8ac', -- pale green off-white: user-defined types
    comment       = '#4a7a52', -- muted green: comments (italic) — readable but secondary
    string        = '#6caa6c', -- muted matrix green: strings
    operator      = '#cccccc', -- foreground colour: ::, <, >, &&, =, !=, etc.
    macro         = '#3dcca0', -- teal-green: macros
    preproc       = '#2f6b3f', -- dim green: #include, #define, #ifdef directives
    error         = '#d97070', -- saturated but not alarm-red
    warning       = '#dba84e', -- amber, not neon yellow
    info          = '#5cb8c8', -- saturated cyan, not laser cyan
    hint          = '#6fc88a', -- saturated matrix-tinted hint
    number        = '#b8915e', -- muted gold: numbers, booleans, null/undefined
}

local hl = vim.api.nvim_set_hl

-- Editor UI
hl(0, 'Normal',          { fg = c.fg, bg = c.bg })
hl(0, 'NormalFloat',     { fg = c.fg, bg = c.bg_alt })
hl(0, 'FloatBorder',     { fg = c.fg_dim, bg = c.bg_alt })
hl(0, 'CursorLine',      { bg = c.bg_cursor })
hl(0, 'CursorLineNr',    { fg = c.accent_bright, bold = true })
hl(0, 'LineNr',          { fg = c.fg_dim })
hl(0, 'SignColumn',      { bg = c.bg })
hl(0, 'VertSplit',       { fg = c.fg_dim })
hl(0, 'WinSeparator',    { fg = c.fg_dim })
hl(0, 'StatusLine',      { fg = c.fg, bg = c.bg_alt })
hl(0, 'StatusLineNC',    { fg = c.fg_dim, bg = c.bg_alt })
hl(0, 'Visual',          { bg = c.bg_visual })
hl(0, 'Search',          { fg = c.bg, bg = c.accent_bright })
hl(0, 'IncSearch',       { fg = c.bg, bg = c.accent_bright, bold = true })
hl(0, 'CurSearch',       { fg = c.bg, bg = c.accent_bright, bold = true })
hl(0, 'MatchParen',      { fg = c.accent_bright, bold = true, underline = true })
hl(0, 'Pmenu',           { fg = c.fg, bg = c.bg_alt })
hl(0, 'PmenuSel',        { fg = c.bg, bg = c.accent_bright })
hl(0, 'PmenuSbar',       { bg = c.bg_alt })
hl(0, 'PmenuThumb',      { bg = c.fg_dim })
hl(0, 'TabLine',         { fg = c.fg_dim, bg = c.bg_alt })
hl(0, 'TabLineSel',      { fg = c.accent_bright, bg = c.bg })
hl(0, 'TabLineFill',     { bg = c.bg_alt })
hl(0, 'Folded',          { fg = c.fg_dim, bg = c.bg_alt })
hl(0, 'FoldColumn',      { fg = c.fg_dim, bg = c.bg })
hl(0, 'NonText',         { fg = c.fg_dim })
hl(0, 'SpecialKey',      { fg = c.fg_dim })
hl(0, 'Whitespace',      { fg = c.fg_dim })
hl(0, 'Conceal',         { fg = c.fg_dim })
hl(0, 'Directory',       { fg = c.accent_bright })
hl(0, 'Title',           { fg = c.accent_bright, bold = true })
hl(0, 'ColorColumn',     { bg = c.bg_alt })
hl(0, 'Cursor',          { fg = c.bg, bg = c.accent_bright })
hl(0, 'QuickFixLine',    { bg = c.bg_visual })

-- Messages
hl(0, 'ErrorMsg',        { fg = c.error })
hl(0, 'WarningMsg',      { fg = c.warning })
hl(0, 'ModeMsg',         { fg = c.fg })
hl(0, 'MoreMsg',         { fg = c.fg })
hl(0, 'Question',        { fg = c.accent_bright })

-- Diagnostics
hl(0, 'DiagnosticError', { fg = c.error })
hl(0, 'DiagnosticWarn',  { fg = c.warning })
hl(0, 'DiagnosticInfo',  { fg = c.info })
hl(0, 'DiagnosticHint',  { fg = c.hint })
hl(0, 'DiagnosticUnderlineError', { undercurl = true, sp = c.error })
hl(0, 'DiagnosticUnderlineWarn',  { undercurl = true, sp = c.warning })
hl(0, 'DiagnosticUnderlineInfo',  { undercurl = true, sp = c.info })
hl(0, 'DiagnosticUnderlineHint',  { undercurl = true, sp = c.hint })

-- Diff / git
hl(0, 'DiffAdd',         { bg = '#1a2c1f' })
hl(0, 'DiffChange',      { bg = '#1a242a' })
hl(0, 'DiffDelete',      { fg = c.error, bg = '#2a1a1a' })
hl(0, 'DiffText',        { bg = '#1f3340' })
hl(0, 'GitSignsAdd',     { fg = c.accent_bright })
hl(0, 'GitSignsChange',  { fg = c.warning })
hl(0, 'GitSignsDelete',  { fg = c.error })

-- Standard syntax groups
hl(0, 'Comment',         { fg = c.comment, italic = true })
hl(0, 'String',          { fg = c.string })
hl(0, 'Character',       { fg = c.string })

hl(0, 'Number',          { fg = c.number })
hl(0, 'Float',           { fg = c.number })
hl(0, 'Boolean',         { fg = c.number })

hl(0, 'Identifier',      { fg = c.fg })

hl(0, 'Function',        { fg = c.func, bold = true })

hl(0, 'Statement',       { fg = c.builtin })
hl(0, 'Conditional',     { fg = c.builtin })
hl(0, 'Repeat',          { fg = c.builtin })
hl(0, 'Label',           { fg = c.builtin })
hl(0, 'Exception',       { fg = c.builtin })
hl(0, 'Keyword',         { fg = c.fg })
hl(0, 'Operator',        { fg = c.operator })

hl(0, 'PreProc',         { fg = c.preproc })
hl(0, 'Include',         { fg = c.preproc })
hl(0, 'Define',          { fg = c.macro })
hl(0, 'Macro',           { fg = c.macro })
hl(0, 'PreCondit',       { fg = c.preproc })

hl(0, 'Type',            { fg = c.type })
hl(0, 'Structure',       { fg = c.fg })
hl(0, 'StorageClass',    { fg = c.builtin })
hl(0, 'Typedef',         { fg = c.builtin })

hl(0, 'Special',         { fg = c.accent_bright })
hl(0, 'SpecialChar',     { fg = c.accent_bright })
hl(0, 'Tag',             { fg = c.fg })
hl(0, 'Delimiter',       { fg = c.fg })
hl(0, 'SpecialComment',  { fg = c.comment, italic = true })
hl(0, 'Debug',           { fg = c.warning })

hl(0, 'Underlined',      { underline = true })
hl(0, 'Ignore',          { fg = c.fg_dim })
hl(0, 'Error',           { fg = c.error })
hl(0, 'Todo',            { fg = c.warning, bold = true })

hl(0, 'Constant',        { fg = c.number })

-- Treesitter
hl(0, '@comment',              { link = 'Comment' })
hl(0, '@string',               { link = 'String' })
hl(0, '@string.escape',        { fg = c.fg })
hl(0, '@number',               { link = 'Number' })
hl(0, '@boolean',              { link = 'Boolean' })

hl(0, '@keyword',              { link = 'Keyword' })
hl(0, '@keyword.return',       { fg = c.builtin })
hl(0, '@keyword.exception',    { fg = c.builtin })
hl(0, '@keyword.conditional',  { fg = c.builtin })
hl(0, '@keyword.repeat',       { fg = c.builtin })
hl(0, '@keyword.operator',     { fg = c.operator })
hl(0, '@keyword.import',       { fg = c.preproc })
hl(0, '@conditional',          { fg = c.builtin })
hl(0, '@repeat',               { fg = c.builtin })
hl(0, '@exception',            { fg = c.builtin })
hl(0, '@label',                { fg = c.builtin })

hl(0, '@function',             { link = 'Function' })
hl(0, '@function.call',        { fg = c.func })
hl(0, '@function.builtin',     { fg = c.func })
hl(0, '@function.macro',       { fg = c.macro })
hl(0, '@method',               { fg = c.func })
hl(0, '@method.call',          { fg = c.func })

hl(0, '@variable',             { fg = c.fg })
hl(0, '@variable.builtin',     { fg = c.fg })
hl(0, '@constant',             { fg = c.fg })
hl(0, '@constant.builtin',     { fg = c.number })
hl(0, '@constant.macro',       { fg = c.macro })

hl(0, '@operator',             { fg = c.operator })
hl(0, '@punctuation',          { fg = c.fg })
hl(0, '@punctuation.bracket',  { fg = c.fg })
hl(0, '@punctuation.delimiter',{ fg = c.operator })
hl(0, '@punctuation.special',  { fg = c.accent_bright })

hl(0, '@type',                 { fg = c.type })
hl(0, '@type.builtin',         { fg = c.builtin })
hl(0, '@type.definition',      { fg = c.type })
hl(0, '@type.qualifier',       { fg = c.builtin })
hl(0, '@keyword.modifier',     { fg = c.builtin })
hl(0, '@keyword.storage',      { fg = c.builtin })
hl(0, '@keyword.type.cpp',     { fg = c.builtin })
hl(0, '@keyword.modifier.cpp', { fg = c.builtin })
hl(0, '@function.builtin.zig', { fg = c.builtin }) -- @import, @sizeOf, @TypeOf, etc.
hl(0, '@keyword.type.zig',     { fg = c.builtin }) -- struct, union, enum, opaque
hl(0, '@keyword.coroutine.zig',{ fg = c.builtin }) -- async, await, suspend, resume
hl(0, '@keyword.function.zig', { fg = c.builtin }) -- fn
hl(0, '@constructor',          { fg = c.type })
hl(0, '@field',                { fg = c.fg })
hl(0, '@property',             { fg = c.fg })
hl(0, '@variable.member',      { fg = c.fg })
hl(0, '@parameter',            { fg = c.fg })
hl(0, '@attribute',            { fg = c.fg })
hl(0, '@namespace',            { fg = c.fg })

hl(0, '@preproc',              { fg = c.preproc })
hl(0, '@include',              { fg = c.preproc })
hl(0, '@define',               { fg = c.macro })
hl(0, '@keyword.directive',    { fg = c.preproc })

-- Markup
hl(0, '@tag',                  { fg = c.fg })
hl(0, '@tag.attribute',        { fg = c.fg })
hl(0, '@tag.delimiter',        { fg = c.fg_dim })
hl(0, '@markup.heading',       { fg = c.accent_bright, bold = true })
hl(0, '@markup.link',          { fg = c.accent_bright, underline = true })
hl(0, '@markup.raw',           { fg = c.string })
hl(0, '@markup.list',          { fg = c.fg })
hl(0, '@markup.strong',        { bold = true })
hl(0, '@markup.italic',        { italic = true })

-- LSP semantic tokens
hl(0, '@lsp.type.type',          { fg = c.type })
hl(0, '@lsp.type.class',         { fg = c.type })
hl(0, '@lsp.type.struct',        { fg = c.type })
hl(0, '@lsp.type.enum',          { fg = c.type })
hl(0, '@lsp.type.interface',     { fg = c.type })
hl(0, '@lsp.type.typeParameter', { fg = c.type })
hl(0, '@lsp.type.property',      { fg = c.fg })
hl(0, '@lsp.type.member',        { fg = c.fg })
hl(0, '@lsp.type.field',         { fg = c.fg })
hl(0, '@lsp.type.parameter',     { fg = c.fg })
hl(0, '@lsp.type.variable',      { fg = c.fg })
hl(0, '@lsp.type.namespace',     { fg = c.fg })
hl(0, '@lsp.type.enumMember',    { fg = c.fg })
hl(0, '@lsp.type.function',      { fg = c.func })
hl(0, '@lsp.type.method',        { fg = c.func })
hl(0, '@lsp.type.macro',         { fg = c.macro })
hl(0, '@lsp.type.keyword',       { fg = c.fg })
hl(0, '@lsp.type.operator',      { fg = c.operator })
hl(0, '@lsp.type.modifier',      { fg = c.builtin })
hl(0, '@lsp.type.string',        { link = 'String' })
hl(0, '@lsp.type.number',        { link = 'Number' })
hl(0, '@lsp.type.comment',       { link = 'Comment' })
hl(0, '@lsp.typemod.variable.defaultLibrary', { fg = c.builtin })
hl(0, '@lsp.typemod.function.defaultLibrary', { fg = c.func })
hl(0, '@lsp.typemod.function.declaration',    { fg = c.func, bold = true })
hl(0, '@lsp.typemod.method.declaration',      { fg = c.func, bold = true })

-- zls reports builtins (@import, @sizeOf, ...) and error tags via these tokens
hl(0, '@lsp.type.builtin.zig',        { fg = c.builtin })
hl(0, '@lsp.type.errorTag.zig',       { fg = c.builtin })
-- zls tags control-flow / storage keywords as `keyword`, overriding treesitter's
-- @keyword.repeat/conditional/return/etc. Route them back to the builtin color.
hl(0, '@lsp.type.keyword.zig',        { fg = c.builtin })
hl(0, '@lsp.type.keywordLiteral.zig', { fg = c.number })

-- Common plugins
hl(0, 'TelescopeBorder',       { fg = c.fg_dim, bg = c.bg })
hl(0, 'TelescopeNormal',       { fg = c.fg, bg = c.bg })
hl(0, 'TelescopeSelection',    { fg = c.accent_bright, bg = c.bg_visual, bold = true })
hl(0, 'TelescopeMatching',     { fg = c.accent_bright, bold = true })
hl(0, 'TelescopePromptPrefix', { fg = c.accent_bright })

hl(0, 'NvimTreeNormal',          { fg = c.fg, bg = c.bg })
hl(0, 'NvimTreeFolderName',      { fg = c.fg })
hl(0, 'NvimTreeOpenedFolderName',{ fg = c.accent_bright, bold = true })
hl(0, 'NvimTreeRootFolder',      { fg = c.accent_bright, bold = true })
hl(0, 'NvimTreeGitDirty',        { fg = c.warning })
hl(0, 'NvimTreeGitNew',          { fg = c.accent_bright })
hl(0, 'NvimTreeIndentMarker',    { fg = c.fg_dim })
