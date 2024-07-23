vim.api.nvim_set_hl(0, 'Headline1', { fg = '#cb7676', bg = '#402626', italic = false })
vim.api.nvim_set_hl(0, 'Headline2', { fg = '#c99076', bg = '#66493c', italic = false })
vim.api.nvim_set_hl(0, 'Headline3', { link = 'DiffAdd' })
vim.api.nvim_set_hl(0, 'Headline4', { fg = '#4c9a91', bg = '#224541', italic = false })
vim.api.nvim_set_hl(0, 'Headline5', { fg = '#6893bf', bg = '#2b3d4f', italic = false })
vim.api.nvim_set_hl(0, 'Headline6', { fg = '#d3869b', bg = '#6b454f', italic = false })
require("headlines").setup {
    markdown = {
        query = vim.treesitter.query.parse(
            "markdown",
            [[
                (atx_heading [
                    (atx_h1_marker)
                    (atx_h2_marker)
                    (atx_h3_marker)
                    (atx_h4_marker)
                    (atx_h5_marker)
                    (atx_h6_marker)
                ] @headline)

                (thematic_break) @dash

                (fenced_code_block) @codeblock

                (block_quote_marker) @quote
                (block_quote (paragraph (inline (block_continuation) @quote)))
                (block_quote (paragraph (block_continuation) @quote))
                (block_quote (block_continuation) @quote)
            ]]
        ),
        headline_highlights = {
            "Headline1",
            "Headline2",
            "Headline3",
            "Headline4",
            "Headline5",
            "Headline6",
        },
        bullet_highlights = {
            "@text.title.1.marker.markdown",
            "@text.title.2.marker.markdown",
            "@text.title.3.marker.markdown",
            "@text.title.4.marker.markdown",
            "@text.title.5.marker.markdown",
            "@text.title.6.marker.markdown",
        },
        bullets = { "◉", "○", "", "" },
        codeblock_highlight = "CodeBlock",
        dash_highlight = "Dash",
        dash_string = "-",
        quote_highlight = "Quote",
        quote_string = "┃",
        fat_headlines = true,
        fat_headline_upper_string = "▃",
        fat_headline_lower_string = "🬂",
    },
}
