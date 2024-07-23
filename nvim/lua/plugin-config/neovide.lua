if vim.g.neovide then
    vim.g.neovide_cursor_vfx_mode = 'railgun'
    vim.g.neovide_hide_mouse_when_typing = true
    -- vim.o.guifont = "MesloLGS Nerd Font:h12:#h-full"
    vim.o.guifont = "JetBrainsMono Nerd Font:h11:#h-full"
    vim.g.neovide_fullscreen = true
    vim.opt.linespace = 0
    vim.g.neovide_scale_factor = 1.0
    vim.g.neovide_padding_top = 0
    vim.g.neovide_padding_bottom = 0
    vim.g.neovide_padding_right = 0
    vim.g.neovide_padding_left = 0
    vim.g.neovide_scroll_animation_length = 0.1
    vim.keymap.set('v', '<D-c>', '"+y')         -- Copy
    vim.keymap.set('n', '<D-v>', '"+P')         -- Paste normal mode
    vim.keymap.set('v', '<D-v>', '"+P')         -- Paste visual mode
    vim.keymap.set('c', '<D-v>', '<C-R>+')      -- Paste command mode
    vim.keymap.set('i', '<D-v>', '<ESC>l"+Pli') -- Paste insert mode
end
