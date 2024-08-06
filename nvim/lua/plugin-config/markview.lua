vim.api.nvim_set_hl(0, 'MarkviewCodeblock', { bg = 'none' }) -- #2C3144
vim.api.nvim_set_hl(0, 'MarkviewH1', { fg = '#f38ba8', bg = '#553e53' })
vim.api.nvim_set_hl(0, 'MarkviewH2', { fg = '#fab387', bg = '#57484b' })
vim.api.nvim_set_hl(0, 'MarkviewH3', { fg = '#f9e2af', bg = '#575455' })
vim.api.nvim_set_hl(0, 'MarkviewH4', { fg = '#a6e3a1', bg = '#425451' })
vim.api.nvim_set_hl(0, 'MarkviewH5', { fg = '#74c7ec', bg = '#364d64' })
vim.api.nvim_set_hl(0, 'MarkviewH6', { fg = '#b4befe', bg = '#464b68' })

require("markview").setup({
    buf_ignore = { "nofile" },
    modes = { "n", "no" },
    headings = {
        enable = true,
        shift_width = 1,
        heading_1 = {
            style = "icon",
            hl = "MarkviewH1"
        },
        heading_2 = {
            style = "icon",
            hl = "MarkviewH2"
        },
        heading_3 = {
            style = "icon",
            hl = "MarkviewH3"
        },
        heading_4 = {
            style = "icon",
            hl = "MarkviewH4"
        },
        heading_5 = {
            style = "icon",
            hl = "MarkviewH5"
        },
        heading_6 = {
            style = "icon",
            hl = "MarkviewH6"
        },
    },
    code_blocks = {
        enable = true,
        style = "language",
        position = "overlay",

        hl = "MarkviewCodeblock",

        min_width = 100,
        pad_char = " ",
        pad_amount = 2,

        language_direction = "right",
        sign = true,
    },
    checkboxes = {
        enable = true,
        checked = {
            text = " ",
            hl = "DiagnosticOk"
        },
        unchecked = {
            text = " ",
            hl = "DiagnosticError"
        },
        pending = {
            text = " ",
            hl = "DiagnosticWarn"
        }
    },
    horizontal_rules = {
        enable = true,

        position = "overlay",
        parts = {
            {
                type = "repeating",
                repeat_amount = function() --[[@as function]]
                    local textoff = vim.fn.getwininfo(vim.api.nvim_get_current_win())[1].textoff;

                    return math.floor((vim.o.columns - textoff - 3) / 2);
                end,

                text = "─",
                hl = {
                    "MarkviewGradient1", "MarkviewGradient2", "MarkviewGradient3", "MarkviewGradient4",
                    "MarkviewGradient5", "MarkviewGradient6", "MarkviewGradient7", "MarkviewGradient8",
                    "MarkviewGradient9", "MarkviewGradient10"
                }
            },
            {
                type = "repeating",
                repeat_amount = function() --[[@as function]]
                    local textoff = vim.fn.getwininfo(vim.api.nvim_get_current_win())[1].textoff;

                    return math.ceil((vim.o.columns - textoff - 3) / 2);
                end,

                direction = "right",
                text = "─",
                hl = {
                    "MarkviewGradient1", "MarkviewGradient2", "MarkviewGradient3", "MarkviewGradient4",
                    "MarkviewGradient5", "MarkviewGradient6", "MarkviewGradient7", "MarkviewGradient8",
                    "MarkviewGradient9", "MarkviewGradient10"
                }
            }
        }
    },
});
