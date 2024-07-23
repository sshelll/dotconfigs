require("bookmarks").setup({
    storage_dir = "", -- Default path: vim.fn.stdpath("data").."/bookmarks,  if not the default directory, should be absolute path",
    mappings_enabled = true, -- If the value is false, only valid for global keymaps: toggle、add、delete_on_virt、show_desc
    keymap = {
        toggle = "<tab><tab>", -- Toggle bookmarks(global keymap)
        add = "mi", -- Add bookmarks(global keymap)
        jump = "<CR>", -- Jump from bookmarks(buf keymap)
        delete = "dd", -- Delete bookmarks(buf keymap)
        order = "<space><space>", -- Order bookmarks by frequency or updated_time(buf keymap)
        delete_on_virt = "dm", -- Delete bookmark at virt text line(global keymap)
        show_desc = "md", -- show bookmark desc(global keymap)
        focus_tags = "h", -- focus tags window
        focus_bookmarks = "l", -- focus bookmarks window
        toogle_focus = "<S-Tab>", -- toggle window focus (tags-window <-> bookmarks-window)
    },
    width = 0.8, -- Bookmarks window width:  (0, 1]
    height = 0.7, -- Bookmarks window height: (0, 1]
    preview_ratio = 0.45, -- Bookmarks preview window ratio (0, 1]
    tags_ratio = 0.1, -- Bookmarks tags window ratio
    fix_enable = false, -- If true, when saving the current file, if the bookmark line number of the current file changes, try to fix it.

    virt_text = "󱖯", -- Show virt text at the end of bookmarked lines, if it is empty, use the description of bookmarks instead.
    sign_icon = "", -- if it is not empty, show icon in signColumn.
    virt_pattern = { "*" }, -- Show virt text only on matched pattern
    virt_ignore_pattern = {},
    border_style = "rounded", -- border style: "single", "double", "rounded"
    hl = {
        border = "TelescopeBorder", -- border highlight
        cursorline = "guifg=#7aa2f7 guibg=#3b4261", -- cursorline highlight
    }
})

-- for tomasky/bookmarks.nvim
--
-- require('bookmarks').setup {
--     sign_priority = 8, --set bookmark sign priority to cover other sign
--     save_file = vim.fn.stdpath("data") .. "/bookmarks/data", -- bookmarks save file path
--     keywords = {
--         ["@t"] = " ", -- mark annotation startswith @t ,signs this icon as `Todo`
--         ["@w"] = " ", -- mark annotation startswith @w ,signs this icon as `Warn`
--         ["@f"] = " ", -- mark annotation startswith @f ,signs this icon as `Fix`
--         ["@n"] = " ", -- mark annotation startswith @n ,signs this icon as `Note`
--     },
--     on_attach = function()
--         local bm = require "bookmarks"
--         local map = vim.keymap.set
--         map("n", "mm", bm.bookmark_toggle) -- add or remove bookmark at current line
--         map("n", "mi", bm.bookmark_ann)    -- add or edit mark annotation at current line
--         map("n", "mc", bm.bookmark_clean)  -- clean all marks in local buffer
--         map("n", "mn", bm.bookmark_next)   -- jump to next mark in local buffer
--         map("n", "mp", bm.bookmark_prev)   -- jump to previous mark in local buffer
--         map("n", "ml", bm.bookmark_list)   -- show marked file list in quickfix window
--     end
-- }
