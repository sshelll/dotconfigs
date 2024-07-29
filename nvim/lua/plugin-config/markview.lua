vim.api.nvim_set_hl(0, 'MarkviewCodeblock', { bg = 'none' }) -- #2C3144
require("markview").setup({
    buf_ignore = { "nofile" },
    modes = { "n", "no" },
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
            hl = "DiagnosticSignOk"
        },
        unchecked = {
            text = " ",
            hl = "DiagnosticSignError"
        },
        pending = {
            text = " ",
            hl = "DiagnosticSignWarn"
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
