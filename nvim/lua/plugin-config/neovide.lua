if vim.g.neovide then
    vim.g.neovide_cursor_vfx_mode = 'railgun'
    vim.g.neovide_hide_mouse_when_typing = true
    -- vim.o.guifont = "MesloLGS Nerd Font:h12:#h-full"
    vim.o.guifont = "JetBrainsMono Nerd Font:h12:#h-full"
    vim.g.neovide_fullscreen = true
    vim.opt.linespace = 0
    vim.g.neovide_scale_factor = 1.0
    vim.g.neovide_padding_top = 0
    vim.g.neovide_padding_bottom = 0
    vim.g.neovide_padding_right = 0
    vim.g.neovide_padding_left = 0
    vim.g.neovide_scroll_animation_length = 0.1
    vim.keymap.set('n', '<D-c>', '"+y')
    vim.keymap.set('v', '<D-c>', '"+y')
    vim.keymap.set('n', '<D-v>', '"+p')
    vim.keymap.set('v', '<D-v>', '"+p')
    vim.keymap.set('i', '<D-v>', '<ESC>l"+Pli')
end
