require("smear_cursor").setup()
local prefix = "SmearCursorNormal"
vim.api.nvim_set_hl(0, prefix, {})
local range = 17
for i = 1, range do
    local group = prefix .. i
    vim.api.nvim_set_hl(0, group, {})
end
