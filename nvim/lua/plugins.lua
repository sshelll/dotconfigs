local pluglist = {
    {
        "sphamba/smear-cursor.nvim",
        enabled = false,
        config = function()
            require("plugin-config/smear-cursor")
        end
    },
    {
        "nvzone/timerly",
        dependencies = {
            "nvzone/volt",
        },
        opts = {}
    },
    {
        'uga-rosa/ccc.nvim',
        opts = {
            highlighter = {
                auto_enable = true,
                lsp = true,
            },
        },
    },
    {
        'MagicDuck/grug-far.nvim',
        opts = {},
    },
    {
        'norcalli/nvim-colorizer.lua',
        enabled = false,
        config = function()
            require 'colorizer'.setup()
        end
    },
    {
        'javiorfo/nvim-soil',
        dependencies = { 'javiorfo/nvim-nyctophilia' },
        lazy = true,
        ft = "plantuml",
        opts = {
            puml_jar = "plantuml",
            image = {
                darkmode = true, -- Enable or disable darkmode
                format = "svg",  -- Choose between png or svg
                execute_to_open = function(img)
                    return "open -a Arc" .. img
                end
            }
        }
    },
    {
        "folke/lazydev.nvim",
        ft = "lua",
        opts = {
            library = {
                "luvit-meta/library",
            },
        },
    },
    { "Bilal2453/luvit-meta", lazy = true },
    {
        "CopilotC-Nvim/CopilotChat.nvim",
        branch = "canary",
        dependencies = {
            { "zbirenbaum/copilot.lua" }, -- or github/copilot.vim
            { "nvim-lua/plenary.nvim" },  -- for curl, log wrapper
        },
        opts = {
            prompts = {
                Explain = {
                    prompt = '/COPILOT_EXPLAIN 解释一下选中的文本 / 代码',
                },
                Review = {
                    prompt = '/COPILOT_REVIEW Review 一下选中的文本 / 代码',
                    callback = function() end
                },
            }
        },
    },
    {
        "kevinhwang91/nvim-ufo",
        event = 'VeryLazy',
        dependencies = {
            "kevinhwang91/promise-async",
        },
        config = function()
            require('plugin-config/nvim-ufo')
        end
    },
    {
        "ziontee113/icon-picker.nvim",
        config = function()
            require("icon-picker").setup({ disable_legacy_commands = true })
        end
    },
    {
        "kndndrj/nvim-dbee",
        lazy = true,
        dependencies = {
            "MunifTanjim/nui.nvim",
        },
        build = function()
            require("dbee").install("go")
        end,
        config = function()
            require("dbee").setup()
        end,
    },
    {
        "folke/noice.nvim",
        event = "VeryLazy",
        opts = {
            -- add any options here
        },
        dependencies = {
            "MunifTanjim/nui.nvim",
            "rcarriga/nvim-notify",
        },
        config = function()
            require('plugin-config/noice')
        end
    },
    {
        "rgroli/other.nvim",
        lazy = false,
        event = "VeryLazy",
        config = function()
            require('plugin-config/other')
        end
    },
    {
        "kylechui/nvim-surround",
        version = "*", -- Use for stability; omit to use `main` branch for the latest features
        event = "VeryLazy",
        config = function()
            require("nvim-surround").setup()
        end
    },
    {
        "b0o/incline.nvim",
        event = 'VeryLazy',
        dependencies = { 'lewis6991/gitsigns.nvim', 'nvim-tree/nvim-web-devicons' },
        config = function()
            require('plugin-config/incline')
        end
    },
    {
        'simrat39/rust-tools.nvim',
        enabled = false,
        dependencies = { 'nvim-lua/plenary.nvim', 'mfussenegger/nvim-dap' },
        event = 'VeryLazy',
        config = function()
            require('plugin-config/rust-tools')
        end
    },
    {
        'mrcjkb/rustaceanvim',
        version = '^5', -- Recommended
        lazy = false,   -- This plugin is already lazy
    },
    {
        'nvim-orgmode/orgmode',
        dependencies = {
            { 'nvim-treesitter/nvim-treesitter', lazy = true },
        },
        event = 'VeryLazy',
        config = function()
            require('plugin-config/orgmode')
        end,
    },
    {
        'akinsho/toggleterm.nvim',
        version = "*",
        config = true,
    },
    {
        "olexsmir/gopher.nvim",
        dependencies = { -- dependencies
            "nvim-lua/plenary.nvim",
            "nvim-treesitter/nvim-treesitter",
        },
        config = function()
            require('plugin-config/gopher')
        end
    },
    {
        'gbprod/yanky.nvim',
        event = 'VeryLazy',
        config = function()
            require('plugin-config/yanky')
        end
    },
    {
        'MeanderingProgrammer/markdown.nvim',
        enabled = false,
        main = "render-markdown",
        dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-tree/nvim-web-devicons' },
        config = function()
            require('plugin-config/markdown')
        end
    },
    {
        'richardbizik/nvim-toc',
        ft = 'markdown',
        opts = {},
    },
    {
        "OXY2DEV/markview.nvim",
        enabled = true,
        ft = "markdown",
        lazy = false,
        dependencies = {
            "nvim-treesitter/nvim-treesitter",
            "nvim-tree/nvim-web-devicons"
        },
        config = function()
            require('plugin-config/markview')
        end
    },
    {
        'Wansmer/treesj',
        dependencies = { 'nvim-treesitter' },
        config = function()
            require('treesj').setup({ --[[ your config ]] })
        end,
    },
    {
        'ashfinal/qfview.nvim',
        event = 'VeryLazy',
        config = function()
            require('qfview').setup()
        end,
    },
    {
        'tpope/vim-dispatch',
        event = 'VeryLazy',
    },
    {
        'folke/flash.nvim',
        event = 'VeryLazy',
        opts = {},
        keys = {
            { "<leader>e", mode = { "n", "x", "o" }, function() require("flash").jump() end,       desc = "Flash" },
            { "S",         mode = { "n", "x", "o" }, function() require("flash").treesitter() end, desc = "Flash Treesitter" },
        },
        config = function()
            vim.cmd('hi FlashCursor guifg=yellow guibg=black')
        end
    },
    {
        'sshelll/gott.nvim',
        event = 'VeryLazy',
        config = function()
            require('gott').setup()
        end,
    },
    {
        'sshelll/telescope-switch.nvim',
        dependencies = { 'nvim-telescope/telescope.nvim' },
        lazy = true,
    },
    {
        'sshelll/telescope-gott.nvim',
        dependencies = {
            'nvim-telescope/telescope.nvim',
            'nvim-lua/plenary.nvim',
        },
        lazy = true,
    },
    {
        'rcarriga/nvim-notify',
        lazy = false,
        config = function()
            require('plugin-config/nvim-notify')
        end
    },
    {
        'paopaol/telescope-git-diffs.nvim',
        dependencies = { 'nvim-telescope/telescope.nvim' },
        lazy = true,
    },
    {
        'numToStr/Comment.nvim',
        event = 'VeryLazy',
        config = function()
            require('plugin-config/comment')
        end
    },
    {
        'Mofiqul/vscode.nvim',
        lazy = true,
    },
    {
        'nvimdev/dashboard-nvim',
        lazy = false,
        dependencies = { 'nvim-tree/nvim-web-devicons' },
        config = function()
            require('plugin-config/dashboard')
        end
    },
    {
        'ahmedkhalf/project.nvim',
        lazy = false,
        config = function()
            require('plugin-config/project')
        end
    },
    {
        'RRethy/vim-illuminate',
        event = 'VeryLazy',
        config = function()
            require('plugin-config/illuminate')
        end
    },
    {
        'nvim-telescope/telescope-fzf-native.nvim',
        build = 'make',
        dependencies = { 'nvim-telescope/telescope.nvim' }
    },
    {
        'lewis6991/gitsigns.nvim',
        event = 'VeryLazy',
        config = function()
            require('plugin-config/gitsigns')
        end
    },
    {
        'nvim-telescope/telescope-ui-select.nvim',
        dependencies = { 'nvim-telescope/telescope.nvim' }
    },
    {
        'stevearc/dressing.nvim',
        dependencies = { 'nvim-telescope/telescope.nvim' },
        config = function()
            require('plugin-config/dressing')
        end
    },
    {
        'mrjones2014/legendary.nvim',
        lazy = false,
        priority = 1000,
        config = function()
            require('plugin-config/legendary')
        end
    },
    {
        'kkharji/sqlite.lua',
        lazy = false,
    },
    {
        'mfussenegger/nvim-dap-python',
        dependencies = { 'mfussenegger/nvim-dap' },
        lazy = true,
        config = function()
            require('dap-python').setup('~/py/.virtualenvs/debugpy/bin/python3')
        end
    },
    {
        'theHamsta/nvim-dap-virtual-text',
        dependencies = { 'mfussenegger/nvim-dap' },
        opts = {},
    },
    {
        'rcarriga/nvim-dap-ui',
        dependencies = { "mfussenegger/nvim-dap", "nvim-neotest/nvim-nio" },
        config = function()
            require('plugin-config/dap-ui')
        end
    },
    {
        'mfussenegger/nvim-dap',
        lazy = true,
        dependencies = { 'nvim-telescope/telescope.nvim' },
        config = function()
            require('plugin-config/dap')
        end
    },
    {
        'mfussenegger/nvim-jdtls',
        dependencies = { 'mfussenegger/nvim-dap' },
        lazy = true,
    },
    {
        "folke/tokyonight.nvim",
        lazy = false,
        priority = 1000,
        config = function()
            require('plugin-config/tokyo-night')
        end
    },
    {
        "lukas-reineke/indent-blankline.nvim",
        main = "ibl",
        config = function()
            require('plugin-config/indent-blankline')
        end
    },
    {
        'github/copilot.vim',
        event = 'VeryLazy',
        config = function()
            vim.keymap.set('i', '<C-c>', 'copilot#Accept("\\<CR>")', {
                expr = true,
                replace_keycodes = false
            })
            vim.g.copilot_no_tab_map = true
        end
    },
    {
        'aklt/plantuml-syntax',
        lazy = true,
    },
    {
        'weirongxu/plantuml-previewer.vim',
        lazy = true,
    },
    {
        'iamcco/markdown-preview.nvim',
        run = 'cd app && yarn install',
        lazy = true,
    },
    {
        'cocopon/iceberg.vim',
        lazy = true,
    },
    {
        'rhysd/clever-f.vim',
        event = 'VeryLazy',
    },
    {
        'crusj/bookmarks.nvim',
        branch = 'main',
        dependencies = { 'nvim-web-devicons', 'nvim-telescope/telescope.nvim' },
        config = function()
            require("plugin-config/bookmarks")
        end
    },
    {
        'sindrets/diffview.nvim',
        event = 'VeryLazy',
    },
    {
        'romgrk/barbar.nvim',
        lazy = false,
        config = function()
            require('plugin-config/barbar')
        end
    },
    {
        'nvim-lua/plenary.nvim',
        lazy = false,
    },
    {
        'nvim-telescope/telescope.nvim',
        branch = '0.1.x',
        dependencies = { 'nvim-lua/plenary.nvim' },
        config = function()
            require('plugin-config/telescope')
        end
    },
    {
        'folke/todo-comments.nvim',
        event = 'VeryLazy',
        config = function()
            require('plugin-config/todo-comments')
        end
    },
    {
        'Pocco81/true-zen.nvim',
        event = 'VeryLazy',
    },
    {
        'karb94/neoscroll.nvim',
        event = 'VeryLazy',
        config = function()
            require('plugin-config/neoscroll')
        end
    },
    {
        'dstein64/nvim-scrollview',
        event = 'VeryLazy',
        config = function()
            require('scrollview').setup({
                excluded_filetypes = { 'NvimTree' },
                current_only = true,
                base = 'right',
                column = 1,
                signs_on_startup = { 'cursor' },
                diagnostics_severities = { vim.diagnostic.severity.ERROR }
            })
        end
    },
    {
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",
        config = function()
            require('plugin-config/nvim-treesitter')
        end
    },
    {
        'nvim-treesitter/nvim-treesitter-context',
        event = 'VeryLazy',
        config = function()
            require('plugin-config/nvim-treesitter-ctx')
        end
    },
    {
        'nvim-treesitter/nvim-treesitter-textobjects',
        event = 'VeryLazy',
        config = function()
            require('plugin-config/nvim-treesitter-text-obj')
        end
    },
    {
        'nvim-lualine/lualine.nvim',
        lazy = false,
        dependencies = {
            'nvim-tree/nvim-web-devicons',
        },
        config = function()
            require('plugin-config/lualine')
        end
    },
    {
        'nvim-tree/nvim-tree.lua',
        lazy = false,
        config = function()
            require('plugin-config/nvimtree')
        end
    },
    {
        'rhysd/vim-go-impl',
        event = 'VeryLazy',
    },
    {
        'neovim/nvim-lspconfig',
        lazy = false,
        config = function()
            require('plugin-config/nvim-lspconfig')
        end
    },
    {
        "williamboman/mason.nvim",
        lazy = false,
        config = function()
            require('plugin-config/mason')
        end
    },
    {
        "williamboman/mason-lspconfig.nvim",
        lazy = false,
        dependencies = {
            'saadparwaiz1/cmp_luasnip',
            'neovim/nvim-lspconfig',
            'hrsh7th/nvim-cmp',
            'williamboman/mason.nvim',
        },
        config = function()
            require('plugin-config/mason-lspconfig')
        end
    },
    {
        'hrsh7th/nvim-cmp',
        event = { "InsertEnter", "CmdlineEnter" },
        dependencies = {
            'neovim/nvim-lspconfig',
            {
                'MattiasMTS/cmp-dbee',
                ft = { 'sql', 'mysql', 'plsql' },
            },
        },
        config = function()
            require('plugin-config/nvim-cmp')
        end
    },
    {
        'hrsh7th/cmp-path',
        dependencies = { 'hrsh7th/nvim-cmp' },
        event = 'VeryLazy'
    },
    {
        'hrsh7th/cmp-cmdline',
        dependencies = { 'hrsh7th/nvim-cmp' },
        event = 'VeryLazy'
    },
    {
        'hrsh7th/cmp-buffer',
        dependencies = { 'hrsh7th/nvim-cmp' },
        event = 'VeryLazy'
    },
    {
        'hrsh7th/cmp-nvim-lsp',
        dependencies = { 'hrsh7th/nvim-cmp' },
        event = 'VeryLazy'
    },
    {
        'hrsh7th/cmp-nvim-lua',
        dependencies = { 'hrsh7th/nvim-cmp' },
        event = 'VeryLazy'
    },
    {
        'saadparwaiz1/cmp_luasnip',
        dependencies = { 'hrsh7th/nvim-cmp' },
        lazy = 'VeryLazy',
    },
    {
        'simrat39/symbols-outline.nvim',
        event = 'VeryLazy',
        config = function()
            require('plugin-config/symbols-outline')
        end
    },
    {
        'folke/trouble.nvim',
        opts = {},
        keys = {
            {
                "<leader>dd",
                "<cmd>Trouble diagnostics toggle<cr>",
                desc = "Diagnostics (Trouble)",
            },
        },
    },
    {
        'windwp/nvim-autopairs',
        event = "InsertEnter",
        opts = {},
    },
    {
        'hrsh7th/vim-vsnip',
        lazy = false,
        dependencies = { 'hrsh7th/nvim-cmp' },
    },
    {
        'hrsh7th/vim-vsnip-integ',
        lazy = false,
        dependencies = { 'hrsh7th/nvim-cmp' },
    },
    {
        'hrsh7th/cmp-vsnip',
        lazy = false,
        dependencies = { 'hrsh7th/nvim-cmp' },
    },
    {
        'nvim-tree/nvim-web-devicons',
        lazy = false,
        config = function()
            require('plugin-config/devicons')
        end
    },
    {
        'kdheepak/lazygit.nvim',
        event = 'VeryLazy',
        config = function()
            require('plugin-config/lazygit')
        end
    },
    {
        "NeogitOrg/neogit",
        dependencies = {
            "nvim-lua/plenary.nvim",         -- required
            "sindrets/diffview.nvim",        -- optional - Diff integration
            "nvim-telescope/telescope.nvim", -- optional
        },
        config = true
    },
    {
        'mg979/vim-visual-multi',
        branch = 'master',
        event = 'VeryLazy',
    },
}

local opts = {
    install = {
        colorscheme = { "tokyonight" }
    },
    ui = {
        border = 'rounded',
        title = 'lazy.nvim'
    },
}


require('lazy').setup(pluglist, opts)
