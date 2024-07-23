require("tokyonight").setup({
    style = "storm",
    light_style = "day",
    transparent = vim.g.transparent, -- see init.lua
    styles = {
        comments = { italic = true },
        keywords = { italic = true, bold = true },
        functions = { italic = true },
        variables = {},
    },
    dim_inactive = true,
    on_colors = function(colors)
        colors.border = "#343A55"
        if vim.g.transparent then
            colors.border = "#576080"
            colors.fg_gutter = "#576080"    -- border
            colors.bg_statusline = ""       -- statusline
            colors.bg_highlight = "#3C4158" -- current line
            colors.bg_popup = "#41465E"     -- popup menu
            colors.bg_visual = "#4252A5"
        end
    end,
    on_highlights = function(hl, _)
        if vim.g.transparent then
            hl.TelescopeNormal = {}
            hl.TelescopePromptNormal = {}
            hl.TelescopePromptBorder = {}
            hl.TelescopePromptTitle = {}
            hl.TelescopeBorder = {}

            hl.NvimTreeNormal = {}
            hl.NvimTreeNormalNC = {}
            hl.NvimTreeWinSeparator = { fg = "#576080" }

            hl.TroubleNormal = { fg = "#c0caf5" }
        end
    end,
    cache = false,
    plugins = {
        all = package.loaded.lazy == nil,
        auto = true,
    },
})

vim.cmd [[colorscheme tokyonight]]
