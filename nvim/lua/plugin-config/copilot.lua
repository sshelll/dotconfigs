require('copilot').setup({
    suggestion = {
        enabled = true,
        auto_trigger = false,
        hide_during_completion = true,
        debounce = 75,
        keymap = {
            accept = "<C-c>",
            accept_word = false,
            accept_line = false,
            next = "∆", -- <M-j> on macOS
            prev = "˚", -- <M-k> on macOS
            dismiss = "˙", -- <M-h> on macOS
        },
    },
    filetypes = {
        yaml = true,
        markdown = true,
        help = false,
        gitcommit = false,
        gitrebase = false,
        hgcommit = false,
        svn = false,
        cvs = false,
        ["."] = false,
    },
})
