local M = {}

M.ui_run = function()
    local file = vim.fn.expand('%:p')
    require("util/cmd").term_exec_cmd(file)
end

return M
