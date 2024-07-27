require('render-markdown').setup({
    code = {
        -- Turn on / off code block & inline code rendering
        enabled = true,
        -- Turn on / off any sign column related rendering
        sign = true,
        -- Determines how code blocks & inline code are rendered:
        --  none: disables all rendering
        --  normal: adds highlight group to code blocks & inline code, adds padding to code blocks
        --  language: adds language icon to sign column if enabled and icon + name above code blocks
        --  full: normal + language
        style = 'full',
        -- Amount of padding to add to the left of code blocks
        left_pad = 0,
        -- Amount of padding to add to the right of code blocks when width is 'block'
        right_pad = 0,
        -- Width of the code block background:
        --  block: width of the code block
        --  full: full width of the window
        width = 'full',
        -- Determins how the top / bottom of code block are rendered:
        --  thick: use the same highlight as the code body
        --  thin: when lines are empty overlay the above & below icons
        border = 'thin',
        -- Used above code blocks for thin border
        above = (function()
            return '▄'
        end)(),
        -- Used below code blocks for thin border
        below = (function()
            return '▀'
        end)(),
        -- Highlight for code blocks & inline code
        highlight = 'RenderMarkdownCode',
        highlight_inline = 'RenderMarkdownCodeInline',
    },
    heading = {
        -- Turn on / off heading icon & background rendering
        enabled = true,
        -- Turn on / off any sign column related rendering
        sign = true,
        -- Replaces '#+' of 'atx_h._marker'
        -- The number of '#' in the heading determines the 'level'
        -- The 'level' is used to index into the array using a cycle
        -- The result is left padded with spaces to hide any additional '#'
        icons = { '󰼏 ', '󰎨 ', '󰼑 ', '󰎲 ', '󰼓 ', '󰼔 ' },
        -- Added to the sign column if enabled
        -- The 'level' is used to index into the array using a cycle
        signs = { '󰌕 ' },
        -- Width of the heading background:
        --  block: width of the heading text
        --  full: full width of the window
        width = 'full',
        -- The 'level' is used to index into the array using a clamp
        -- Highlight for the heading icon and extends through the entire line
        backgrounds = {
            'RenderMarkdownH1Bg',
            'RenderMarkdownH2Bg',
            'RenderMarkdownH3Bg',
            'RenderMarkdownH4Bg',
            'RenderMarkdownH5Bg',
            'RenderMarkdownH6Bg',
        },
        -- The 'level' is used to index into the array using a clamp
        -- Highlight for the heading and sign icons
        foregrounds = {
            'RenderMarkdownH1',
            'RenderMarkdownH2',
            'RenderMarkdownH3',
            'RenderMarkdownH4',
            'RenderMarkdownH5',
            'RenderMarkdownH6',
        },
    },
    bullet = {
        enabled = true,
        icons = { '', '○', '◆', '◇' },
        right_pad = 0,
        highlight = 'RenderMarkdownBullet',
    },
    checkbox = {
        enabled = true,
        unchecked = {
            icon = ' ',
            highlight = 'DiagnosticSignError',
        },
        checked = {
            icon = ' ',
            highlight = 'DiagnosticSignOk',
        },
        custom = {
            todo = { raw = '[-]', rendered = ' ', highlight = 'DiagnosticSignWarn' },
        },
    },
})

if vim.g.transparent then
    vim.api.nvim_set_hl(0, 'RenderMarkdownCode', { bg = '#242A41' })
end
