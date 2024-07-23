local nodejs = {}

nodejs.ui_run = function()
    local wd = vim.fn.expand('%:p:h')
    local file = vim.fn.expand('%:p')
    require('util/cmd').run_cmd_ui('!cd ' .. wd .. ' && node ' .. file, { buf = {} })
end

return nodejs
