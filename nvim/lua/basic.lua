vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

vim.cmd('syntax enable')
vim.cmd('filetype on')

vim.o.background = 'dark'

-- see init.lua
if vim.g.transparent then
    vim.api.nvim_set_hl(0, "LazyNormal", { fg = "#c0caf5" })
    vim.api.nvim_set_hl(0, "NormalFloat", { fg = "#c0caf5" })
    vim.api.nvim_set_hl(0, "FloatBorder", { fg = "#29a4bd" })
    vim.api.nvim_set_hl(0, "DiffChange", { bg = "#4A4D2E" })
    vim.api.nvim_set_hl(0, "DiffText", { bg = "#60643D" })
    vim.api.nvim_set_hl(0, "DiffAdd", { bg = "#30514C" })
    vim.api.nvim_set_hl(0, "DiffDelete", { bg = "#5B3C3F" })
    vim.api.nvim_set_hl(0, "CursorLine", { bg = "#474C65" })
    vim.api.nvim_set_hl(0, "NonText", { fg = "#787FA4" })
    vim.api.nvim_set_hl(0, "@comment", { fg = "#787FA4" })
    vim.api.nvim_set_hl(0, "Comment", { fg = "#666D8D" })
    vim.api.nvim_set_hl(0, "GrugFarInputPlaceholder", { fg = "#666D8D" })
    vim.api.nvim_set_hl(0, "GrugFarHelpHeader", { fg = "#666D8D" })
    vim.api.nvim_set_hl(0, "BufferTabpageFill", { fg = "#737aa2" })
    vim.api.nvim_set_hl(0, "NotifyERRORBorder", { fg = "#DE4949" })
    vim.api.nvim_set_hl(0, "NotifyWARNBorder", { fg = "#D78D44" })
    vim.api.nvim_set_hl(0, "DiagnosticUnnecessary", { fg = "#646984" })
end

vim.o.mouse = ''
vim.o.number = true
vim.o.relativenumber = true
vim.o.termguicolors = true
vim.o.signcolumn = 'yes'
vim.o.cursorline = true
vim.o.encoding = 'utf-8'
vim.o.backup = false
vim.o.writebackup = false
vim.o.updatetime = 300
vim.o.showcmd = true

vim.o.ts = 4
vim.o.expandtab = true
vim.o.softtabstop = 4
vim.o.shiftwidth = 4
vim.o.smartindent = true
vim.cmd('autocmd FileType javascript setlocal tabstop=2 shiftwidth=2 expandtab')
vim.cmd('autocmd FileType go setlocal noexpandtab')

vim.o.ignorecase = true
vim.o.smartcase = true

-- 启用 list 选项以显示空白字符
vim.opt.list = true

-- 设置 listchars 选项
-- :h ibl.config.indent.char
-- vim.opt.listchars = {
--     tab = '▎ ', -- 表示 tab 的符号
--     trail = '·', -- 表示行尾多余空格的符号
--     nbsp = '␣', -- 表示非断空格的符号
--     eol = '', -- 表示行尾的符号
--     extends = '>', -- 表示超过行末的字符
--     precedes = '<', -- 表示超过行首的字符
--     space = '·' -- 表示空格的符号
-- }

vim.opt.listchars = {
    tab = '▎ ', -- 表示 tab 的符号
    trail = '·', -- 表示行尾多余空格的符号
    space = '·' -- 表示空格的符号
}

-- 对于下面的文件类型, 不显示 list
vim.cmd(
    'autocmd FileType help,terminal,dashboard,packer,lspinfo,TelescopePrompt,TelescopeResults,NvimTree,Trouble,Outline,gitcommit,gitrebase,svn,hgcommit setlocal nolist')
