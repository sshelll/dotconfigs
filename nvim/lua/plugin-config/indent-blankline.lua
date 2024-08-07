require("ibl").setup {
    debounce = 100,
    exclude = {
        filetypes = { "help", "terminal", "dashboard", "packer", "lspinfo", "TelescopePrompt",
            "TelescopeResults", "NvimTree", "Trouble", "Outline", "gitcommit", "gitrebase", "svn", "hgcommit", "markdown" },
        buftypes = { "terminal", "nofile", "quickfix", "prompt" },
    }
}
