local M = {}

--- Execute a command in a terminal buffer.
--- @param cmd string
function M.term_exec_cmd(cmd)
    vim.api.nvim_command("TermExec cmd=\"" .. cmd .. "\"")
end

--- Run a command and show the output in a notification window or buf.
--- @param cmd string
--- @param opts RunCmdUIOpts
--- @return nil
---
--- opts = {
---     notify = {
---         keep = false,
---     },
---     buf = {
---         height = 20,
---         modifiable = false,
---     },
--- }
function M.run_cmd_ui(cmd, opts)
    if not cmd or cmd == "" then
        return
    end
    local result = vim.api.nvim_exec2(cmd, { output = true })
    local output = result.output
    if not output or output == "" then
        return
    end
    if opts.notify then
        vim.notify(
            output,
            vim.log.levels.INFO,
            {
                title = "Exec Result",
                icon = "",
                timeout = 3000,
                keep = function()
                    return opts.notify.keep or false
                end
            }
        )
    elseif opts.buf then
        local lines = require("util/common").split(output, "\n")
        local buf = vim.api.nvim_create_buf(false, true)
        vim.api.nvim_buf_set_lines(buf, 0, -1, false, lines)
        vim.api.nvim_set_option_value("modifiable", opts.buf.modifiable or false, { buf = buf })
        local height = opts.buf.height or 20
        vim.cmd('botright ' .. height .. ' split | ' .. buf .. 'buffer')
    else
        vim.api.nvim_err_writeln(output)
    end
end

--- @class RunCmdUIOpts
--- @field notify? RunCmdUIOptsNotify
--- @field buf? RunCmdUIOptsBuf
---
--- @class RunCmdUIOptsNotify
--- @field keep boolean
---
--- @class RunCmdUIOptsBuf
--- @field height? number
--- @field modifiable? boolean

return M
