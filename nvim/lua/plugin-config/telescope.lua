local switch_builtin_matchers = require('telescope._extensions.switch.matcher')

require('telescope').setup {
    defaults = {
        mappings = {
            i = {
                ["<C-x>"] = false,
                ["<C-q>"] = require("telescope.actions").send_to_qflist,
            },
        },
        file_ignore_patterns = { "node_modules" },
    },
    pickers = {
        find_files = {
            layout_strategy = "vertical",
            layout_config = {
                height = 0.8,
                width = 0.5,
                prompt_position = "top",
                preview_height = 0.7,
            },
        },
        lsp_references = {
            show_line = false,
            include_declaration = false,
            include_current_line = false,
            layout_strategy = "cursor",
            layout_config = {
                height = 0.3,
                width = 0.5,
            },
        },
        lsp_implementations = {
            show_line = true,
            layout_strategy = "cursor",
            layout_config = {
                height = 0.3,
            },
        },
        lsp_document_symbols = {
            layout_strategy = "vertical"
        },
    },
    extensions = {
        fzf     = {
            fuzzy = true,                   -- false will only do exact matching
            override_generic_sorter = true, -- override the generic sorter
            override_file_sorter = true,    -- override the file sorter
            case_mode = "smart_case",       -- or "ignore_case" or "respect_case"
        },
        project = {
            display_type = "full",
            base_dirs = {
                '~/go/src',
            },
            hidden_files = true,
            theme = "cursor",
            order_by = "recent",
            search_by = "title",
            sync_with_nvim_tree = true,
        },
        gott    = {
            test_args = "-v",
            test_args_list = {
                "-v",
                "-v -vet=off",
                '-v -gcflags="all=-N -l"',
                '-v -vet=off -gcflags="all=-N -l"',
            },
            keep = function()
                return true
            end,
            render = 'default',
            theme = 'dropdown',
            display_with_buf = {
                enabled = true,
                modifiable = false,
                height = 20,
            },
        },
        switch  = {
            matchers = {
                switch_builtin_matchers.same_dir,
                switch_builtin_matchers.go_impl,
                switch_builtin_matchers.go_test,
                switch_builtin_matchers.rust_mod,
                switch_builtin_matchers.rust_mod_file,
                {
                    name = "plugin config",
                    from = "/lua/plugins.lua$",
                    to = "/lua/plugin-config/*.lua",
                },
                {
                    name = "plugin entry",
                    from = "/lua/plugin%-config/.*.lua$",
                    to = "/lua/*.lua",
                },
                {
                    name = "rust test",
                    from = "/src/(.*).rs$",
                    search = "/tests",
                },
            },
        }
    }
}

require('telescope').load_extension('bookmarks')
require("telescope").load_extension("fzf")
require('telescope').load_extension('git_diffs')
require('telescope').load_extension('notify')
require('telescope').load_extension('projects')
require('telescope').load_extension('gott')
require('telescope').load_extension('switch')

vim.g.ackhighlight = 1
