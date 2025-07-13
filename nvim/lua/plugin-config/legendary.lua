local dap, dapui = require("dap"), require("dapui")
local telescope_builtin = require('telescope.builtin')

require('legendary').setup({
    keymaps = {
        {
            itemgroup = 'ai',
            description = 'ai keymaps',
            icon = 'function() ',
            keymaps = {
                { '<leader>ai', function() vim.cmd('AvanteToggle') end, description = 'toggle avante window', mode = { 'n' } },
                { '<leader>am', function() vim.cmd('AvanteModels') end, description = 'change avante models', mode = { 'n' } },
            }
        },
        {
            itemgroup = 'basic',
            description = 'basic keymaps',
            icon = '',
            keymaps = {
                { '<F12>',     function() vim.cmd('vertical res+3') end, description = 'incr vertical window width' },
                { '<F11>',     function() vim.cmd('vertical res-1') end, description = 'decr vertical window width' },
                { '<F10>',     function() vim.cmd('res+3') end,          description = 'incr horizontal window width' },
                { '<F9>',      function() vim.cmd('res-1') end,          description = 'decr horizontal window width' },
                { 'p',         '"0p',                                    description = 'paste from the first nvim buffer' },
                { '<leader>p', 'p',                                      description = 'paste last',                      mode = { 'n', 'v' } },
                { '<leader>y', '"+y',                                    description = 'copy to os',                      mode = { 'n', 'v' } },
                { '<D-c>',     '"+y',                                    description = 'copy to os',                      mode = { 'n', 'v' } },
                { '<D-v>',     '"+p',                                    description = 'paste from os',                   mode = { 'n', 'v', 'i' } },
                { '<leader>v', '"+p',                                    description = 'paste from os',                   mode = { 'n', 'v' } },
                { '<leader>l', function() vim.cmd('noh') end,            description = 'no highlight',                    mode = { 'n' } },
                { '<C-w>N',    '<C-\\><C-n>',                            description = 'change terminal mode',            mode = { 't' } },
            },
        },
        {
            itemgroup = 'search',
            description = 'keymaps for search',
            icon = '',
            keymaps = {
                { '<C-p>',      telescope_builtin.live_grep,                                                           description = 'search in the current work dir with Telescope' },
                { '<C-f>',      telescope_builtin.current_buffer_fuzzy_find,                                           description = 'search in the current buffer with Telescope' },
                { '<leader>k',  function() vim.cmd('Legendary') end,                                                   description = 'open legendary search box' },
                { '<leader>td', function() vim.cmd('TodoTelescope') end,                                               description = 'search todo items with Telescope' },
                { '<leader>tf', telescope_builtin.find_files,                                                          description = 'search files with Telescope' },
                { '<leader>tm', function() vim.cmd('Telescope bookmarks') end,                                         description = 'search bookmarks with Telescope' },
                { '<leader>z',  function() require("nvim-tree.api").tree.find_file({ open = true, focus = true }) end, description = 'nvim tree find file', },
            },
        },
        {
            itemgroup = 'golang',
            description = 'keymaps for golang',
            icon = '',
            keymaps = {
                -- { '<F2>', function() require('notify').dismiss({ pending = false, silent = false }) end, description = 'clear notifications', },
                { '<F2>', function() require('snacks').notifier.hide() end, description = 'clear notifications', },
                {
                    '<F5>',
                    function()
                        local filename = vim.fn.expand('%:t')
                        if string.find(filename, '_test.go') then
                            vim.cmd('GottFile -v')
                        end
                    end,
                    description = 'run all go tests in the current file with -v flag',
                },
            },
        },
        {
            itemgroup = 'git',
            description = 'keymaps for git',
            icon = '',
            keymaps = {
                { '<leader>gg', function() vim.cmd('LazyGit') end,      description = 'open lazygit window' },
                { '<leader>bb', require('gitsigns').blame,              description = 'show git blame' },
                { '<leader>gd', function() vim.cmd('DiffviewOpen') end, description = 'open diffview' },
            },
        },
        {
            itemgroup = 'dap',
            description = 'keymaps for dap',
            icon = '',
            keymaps = {
                { '<leader>da', function() dap.toggle_breakpoint() end, description = 'toggle breakpoint' },
                { '<leader>ds', function() dap.step_into() end,         description = 'step into' },
                { '<leader>dw', function() dap.step_over() end,         description = 'step over' },
                { '<leader>do', function() dap.step_out() end,          description = 'step out' },
                { '<leader>dt', function() dap.run_to_cursor() end,     description = 'run to cursor' },
                { '<leader>dq', function() dap.disconnect() end,        description = 'disconnect' },
                { '<leader>dr', function() dap.clear_breakpoints() end, description = 'clean breakpoints' },
                { '<leader>de', function() dapui.eval() end,            description = 'eval',             mode = { 'n', 'v' } },
                {
                    '<leader>dc',
                    function()
                        local filetype = vim.bo.filetype
                        if filetype == 'lua' then
                            require('osv').run_this()
                        elseif filetype == 'rust' and require('dap').session() == nil then
                            vim.cmd.RustLsp('debuggables')
                        else
                            dap.continue()
                        end
                    end,
                    description = 'continue',
                },
            },
        },
        {
            itemgroup = 'barbar',
            description = 'keymaps for barbar',
            icon = '',
            keymaps = {
                { '≤', function() vim.cmd('BufferPrevious') end, description = 'previous buffer' },
                { '≥', function() vim.cmd('BufferNext') end, description = 'next buffer' },
                { '“', function() vim.cmd('tabprevious') end, description = 'previous tab' },
                { '‘', function() vim.cmd('tabnext') end, description = 'next tab' },
                { 'œ', function() vim.cmd('BufferClose') end, description = 'close buffer' },
                { 'π', function() vim.cmd('BufferPin') end, description = 'pin buffer' },
                { 'ç', function() vim.cmd('BufferCloseAllButCurrentOrPinned') end, description = 'close all buffers but pinned' },
            },
        },
        {
            itemgroup = 'others',
            description = 'other keymaps',
            icon = '',
            keymaps = {
                { '<leader>tt', function() vim.cmd('ToggleTerm size=20 direction=horizontal') end, description = 'toggle a terminal emulator at bottom' },
                { '<F3>',       function() require("nvim-tree.api").tree.toggle() end,             description = 'toggle NvimTree', },
                { 'md',         function() vim.cmd('Markview toggle') end,                         description = 'toggle markdown preview' }
            },
        },
        {
            itemgroup = 'ide',
            description = 'keymaps for ide',
            icon = '',
            keymaps = {
                { '<leader>s',  function() require("telescope").extensions.switch.switch() end, description = 'toggle other relative files' },
                { '<leader>to', function() require("neotest").output_panel.toggle() end,        description = 'toggle neotest output panel' },
                { '<leader>tc', function() require("neotest").output_panel.clear() end,         description = 'clear neotest output panel' },
                {
                    '<leader>rr',
                    function()
                        local fileType = vim.bo.filetype
                        if fileType == 'go' then
                            require('util/golang').ui_run()
                        elseif fileType == 'javascript' then
                            require('util/nodejs').ui_run()
                        elseif fileType == 'sh' then
                            require('util/bash').ui_run()
                        elseif fileType == 'lua' then
                            require("util/cmd").run_cmd_ui('!lua ' .. vim.fn.expand('%:p'), { buf = {} })
                        elseif fileType == 'rust' then
                            vim.cmd.RustLsp('runnables')
                        else
                            local err = fileType .. ' is not supported'
                            vim.api.nvim_err_writeln(err)
                        end
                    end,
                    description = 'run file with ui',
                },
                {
                    '<leader>rt',
                    function()
                        local fileType = vim.bo.filetype
                        if fileType == 'go' then
                            require('telescope').extensions.gott.gott()
                        elseif fileType == 'rust' then
                            vim.cmd.RustLsp('testables')
                        elseif fileType == 'java' then
                            local args = require('util/common').readInput('test class (y/N): ')
                            if not args.canceled and args == 'y' then
                                require('jdtls').test_class()
                            else
                                require('jdtls').test_nearest_method()
                            end
                            require('dap').repl.open()
                        end
                    end,
                    description = 'run test',
                },
                {
                    '<leader>gt',
                    function()
                        local fileType = vim.bo.filetype
                        if fileType == 'go' then
                            vim.cmd('GoTestAdd')
                        end
                    end,
                    description = 'generate test for the current function',
                },
            }
        }
    },
    commands = {
        {
            itemgroup = 'search',
            description = 'commands for search',
            icon = '',
            commands = {
                { ':SearchGitCommits', function() require('telescope').extensions.git_diffs.diff_commits() end, description = 'search git commits and open it in diffview' },
                {
                    ':SearchProjects',
                    function()
                        local projects = require('telescope').extensions.projects.projects
                        local layout = {
                            layout_config = {
                                width = 0.5,
                                height = 0.4,
                            },
                            previewer = false,
                            display_type = 'full',
                        }
                        local theme = require('telescope.themes').get_dropdown(layout)
                        projects(theme)
                    end,
                    description = 'search projects'
                },
                {
                    ':TelescopeIgnore',
                    function()
                        local result = {}
                        local i = 0
                        repeat
                            i = i + 1
                            local ignore = require('util/common').readInput('ignore(' .. i .. '): ')
                            table.insert(result, "--glob")
                            table.insert(result, ignore.input or '')
                        until ignore.canceled
                        require('telescope.builtin').live_grep({
                            additional_args = function()
                                return result
                            end
                        })
                    end,
                    description = 'telescope live_grep with ignore pattern',
                }
            }
        },
        {
            itemgroup = 'rust',
            description = 'commands for rust',
            icon = '',
            commands = {
                { ':RustBuild',        function() vim.cmd('!cargo build') end,           description = 'build rust project' },
                { ':RustBuildRelease', function() vim.cmd('!cargo build --release') end, description = 'build rust project with release flag' }
            },
        },
    },
    funcs = {
        {
            itemgroup = 'golang',
            description = 'functions for golang',
            icon = '',
            funcs = {
                { description = 'go impl with ui', function() require('util/golang').ui_impl() end },
            }
        },
        {
            itemgroup = 'time',
            description = 'functions for time',
            icon = '',
            funcs = {
                {
                    description = 'milli timestamp to date',
                    function()
                        local c = require('util/common')
                        local input = c.inputOrDefault(vim.fn.strftime('%s'), 'timestamp: ')
                        local timestamp = tonumber(input)
                        local date = os.date('%Y-%m-%d %H:%M:%S', timestamp / 1000)
                        vim.api.nvim_out_write(date .. '\n')
                    end
                },
                {
                    description = 'date to milli timestamp',
                    function()
                        local c = require('util/common')
                        local fmt = '%Y-%m-%d %H:%M:%S'
                        local input = c.inputOrDefault(vim.fn.strftime(fmt),
                            string.format('date(%s, default now): ', fmt))
                        local date = input
                        local timestamp = os.time({
                            year = date:sub(1, 4),
                            month = date:sub(6, 7),
                            day = date:sub(9, 10),
                            hour = date:sub(12, 13),
                            min = date:sub(15, 16),
                            sec = date:sub(18, 19),
                        })
                        vim.api.nvim_out_write(timestamp * 1000 .. '\n')
                    end
                },
            }
        }
    },
    extensions = {
        nvim_tree = true,
        diffview = true,
    },
    select_prompt = 'legendary',
    include_legendary_cmds = false,
})
