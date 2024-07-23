local dap = require('dap')
local datapath = vim.fn.stdpath('data')

dap.adapters.delve = {
    type = 'server',
    port = '${port}',
    executable = {
        command = 'dlv',
        args = { 'dap', '-l', '127.0.0.1:${port}', '--check-go-version=false' },
    }
}

dap.adapters.delve_no_optimize = {
    type = 'server',
    port = '${port}',
    executable = {
        command = 'dlv',
        args = { '--build-flags="-gcflags=\'all=-N -l\'"', 'dap', '-l', '127.0.0.1:${port}', '--check-go-version=false' },
    }
}

dap.adapters.codelldb = {
    type = 'server',
    port = '${port}',
    executable = {
        command = 'codelldb',
        args = { '--port', '${port}' },
    }
}

dap.adapters.nlua = function(callback, config)
    callback({ type = 'server', host = config.host or "127.0.0.1", port = config.port or 8086 })
end

dap.adapters["pwa-node"] = {
    type = "server",
    host = "localhost",
    port = "${port}",
    executable = {
        command = "node",
        -- 💀 Make sure to update this path to point to your installation
        args = { datapath .. "/vscode_js_debug/js-debug/src/dapDebugServer.js", "${port}" },
    }
}

-- https://github.com/go-delve/delve/blob/master/Documentation/usage/dlv_dap.md
dap.configurations.go = {
    {
        type = "delve",
        name = "Debug",
        request = "launch",
        program = "${file}"
    },
    -- works with go.mod packages and sub packages
    {
        type = "delve",
        name = "Debug Test",
        request = "launch",
        mode = "test",
        program = "./${relativeFileDirname}"
    },
    {
        type = "delve_no_optimize",
        name = 'Debug with gcflags="all=-N -l"',
        request = "launch",
        program = "${file}"
    },
    {
        type = "delve_no_optimize",
        name = 'Debug Test with gcflags="all=-N -l"',
        request = "launch",
        mode = "test",
        program = "./${relativeFileDirname}"
    }
}

dap.configurations.lua = {
    {
        type = 'nlua',
        request = 'attach',
        name = "Attach to running Neovim instance",
    }
}

dap.configurations.javascript = {
    {
        type = "pwa-node",
        request = "launch",
        name = "Launch file",
        program = "${file}",
        cwd = "${workspaceFolder}",
    }
}

dap.configurations.cpp = {
    {
        name = "Launch file",
        type = "codelldb",
        request = "launch",
        program = function()
            return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
        end,
        cwd = '${workspaceFolder}',
        stopOnEntry = false,
    },
}

dap.configurations.rust = {
    {
        name = "Debug project",
        type = "codelldb",
        request = "launch",
        program = function()
            vim.cmd('RustBuild')
            local project = vim.fn.getcwd():match("([^/\\]+)$")
            return vim.fn.getcwd() .. '/target/debug/' .. project
        end,
        cwd = '${workspaceFolder}',
        stopOnEntry = false,
    },
}

dap.configurations.c = dap.configurations.cpp
dap.configurations.typescript = dap.configurations.javascript

dap.adapters.python = function(cb, config)
    if config.request == 'attach' then
        ---@diagnostic disable-next-line: undefined-field
        local port = (config.connect or config).port
        ---@diagnostic disable-next-line: undefined-field
        local host = (config.connect or config).host or '127.0.0.1'
        cb({
            type = 'server',
            port = assert(port, '`connect.port` is required for a python `attach` configuration'),
            host = host,
            options = {
                source_filetype = 'python',
            },
        })
    else
        local home = os.getenv('HOME')
        cb({
            type = 'executable',
            command = home .. '/py/.virtualenvs/debugpy/bin/python3',
            args = { '-m', 'debugpy.adapter' },
            options = {
                source_filetype = 'python',
            },
        })
    end
end

dap.configurations.python = {
    {
        -- The first three options are required by nvim-dap
        type = 'python', -- the type here established the link to the adapter definition: `dap.adapters.python`
        request = 'launch',
        name = "Launch file",

        -- Options below are for debugpy, see https://github.com/microsoft/debugpy/wiki/Debug-configuration-settings for supported options

        program = "${file}", -- This configuration will launch the current file if used.
        pythonPath = function()
            -- debugpy supports launching an application with a different interpreter then the one used to launch debugpy itself.
            -- The code below looks for a `venv` or `.venv` folder in the current directly and uses the python within.
            -- You could adapt this - to for example use the `VIRTUAL_ENV` environment variable.
            local cwd = vim.fn.getcwd()
            if vim.fn.executable(cwd .. '/venv/bin/python3') == 1 then
                return cwd .. '/venv/bin/python3'
            elseif vim.fn.executable(cwd .. '/.venv/bin/python3') == 1 then
                return cwd .. '/.venv/bin/python3'
            else
                return '/usr/bin/python3'
            end
        end,
    },
}
