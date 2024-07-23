local dap, dapui = require("dap"), require("dapui")
dapui.setup(
    {
        controls = {
            element = "repl",
            enabled = false,
        },
        element_mappings = {},
        expand_lines = true,
        floating = {
            border = "single",
            mappings = {
                expand = { "<CR>", "<2-LeftMouse>" },
                close = { "q", "<Esc>" }
            }
        },
        force_buffers = true,
        icons = {
            collapsed = "▸",
            current_frame = "●",
            expanded = "▾",
        },
        layouts = {
            {
                elements = {
                    {
                        id = "scopes",
                        size = 0.25
                    },
                    {
                        id = "breakpoints",
                        size = 0.25
                    },
                    {
                        id = "stacks",
                        size = 0.25
                    },
                },
                position = "left",
                size = 40
            },
        },
        mappings = {
            expand = { "<CR>", "<2-LeftMouse>" },
        },
        render = {
            indent = 1,
            max_value_lines = 100
        }
    }
)
dap.listeners.after.event_initialized["dapui_config"] = function()
    dapui.open()
end
dap.listeners.before.event_terminated["dapui_config"] = function()
    dapui.close()
end
dap.listeners.before.event_exited["dapui_config"] = function()
    dapui.close()
end
