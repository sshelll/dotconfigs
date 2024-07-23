require('Comment').setup {
    ---Add a space b/w comment and the line
    padding = true,
    ---Whether the cursor should stay at its position
    sticky = true,
    ---Lines to be ignored while (un)comment
    ignore = nil,
    ---LHS of toggle mappings in NORMAL mode
    toggler = {
        line = '<leader>cc',
        block = '<leader>cb',
    },
    ---LHS of operator-pending mappings in NORMAL and VISUAL mode
    opleader = {
        line = '<leader>cc',
        block = '<leader>cb',
    },
    ---Enable keybindings
    mappings = {
        basic = true,
        extra = false,
    },
    ---Function to call before (un)comment
    pre_hook = nil,
    ---Function to call after (un)comment
    post_hook = nil,
    extra = {},
}

local ft = require('Comment.ft')
ft({'mysql', 'sql'}, '#%s')
