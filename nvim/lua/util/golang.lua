local golang = {}

golang.ui_impl = function()
    vim.ui.input(
        { prompt = 'recv(f *Foo)' },
        function(recv)
            if recv == nil then
                return
            end
            vim.ui.input(
                { prompt = 'interface(io.Writer)' },
                function(interface)
                    if interface == nil then
                        return
                    end
                    vim.api.nvim_command('GoImpl ' .. recv .. ' ' .. interface)
                end
            )
        end
    )
end

golang.ui_run = function()
    local wd = vim.fn.expand('%:p:h')
    require('util/cmd').run_cmd_ui('!cd ' .. wd .. ' && go run .', { buf = {} })
end

return golang
