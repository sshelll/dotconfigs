local pluglist = {
    {
        "nvim-neotest/neotest",
        enabled = false,
        dependencies = {
            "nvim-neotest/nvim-nio",
            "nvim-lua/plenary.nvim",
            "antoinemadec/FixCursorHold.nvim",
            "nvim-treesitter/nvim-treesitter",
            "mrcjkb/rustaceanvim",
        },
        config = function()
            require('neotest').setup {
                adapters = {
                    require('rustaceanvim.neotest')
                },
            }
        end
    },
    {
        "zbirenbaum/copilot.lua",
        lazy = true,
        config = function()
            require('plugin-config/copilot')
        end
    },
    {
        "yetone/avante.nvim",
        event = "VeryLazy",
        lazy = false,
        version = false,
        config = function()
            require('plugin-config/avante')
        end,
        build = "make",
        dependencies = {
            "stevearc/dressing.nvim",
            "nvim-lua/plenary.nvim",
            "MunifTanjim/nui.nvim",
            "hrsh7th/nvim-cmp",
            "nvim-tree/nvim-web-devicons",
            "zbirenbaum/copilot.lua", -- for providers='copilot'
        },
    },
    {
        "jbyuki/venn.nvim",
        config = function()
            require("plugin-config/venn")
        end
    },
    {
        "Fildo7525/pretty_hover",
        event = "LspAttach",
        opts = {
            max_width = 120,
            max_height = 30,
        },
    },
    { "tiagovla/scope.nvim",  opts = {} },
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
        "folke/noice.nvim",
        event = "VeryLazy",
        opts = {},
        dependencies = {
            "MunifTanjim/nui.nvim",
            "rcarriga/nvim-notify",
        },
        config = function()
            require('plugin-config/noice')
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
        'mrcjkb/rustaceanvim',
        version = '^5', -- Recommended
        lazy = false,   -- This plugin is already lazy
        config = function()
            require('plugin-config/rustaceanvim')
        end
    },
    {
        'akinsho/toggleterm.nvim',
        version = "*",
        config = true,
    },
    {
        "olexsmir/gopher.nvim",
        ft = "go",
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
        'richardbizik/nvim-toc',
        ft = 'markdown',
        opts = {},
    },
    {
        "OXY2DEV/markview.nvim",
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
        enabled = false,
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
        'nvim-telescope/telescope.nvim',
        branch = '0.1.x',
        dependencies = {
            'nvim-lua/plenary.nvim',
            'sshelll/telescope-gott.nvim',
            'sshelll/telescope-switch.nvim',
        },
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
        dependencies = {
            "Fildo7525/pretty_hover",
        },
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
            'hrsh7th/vim-vsnip',
            'hrsh7th/vim-vsnip-integ',
            'hrsh7th/cmp-path',
            'hrsh7th/cmp-cmdline',
            'hrsh7th/cmp-buffer',
            'hrsh7th/cmp-nvim-lsp',
            'hrsh7th/cmp-nvim-lua',
            'saadparwaiz1/cmp_luasnip',
            'hrsh7th/cmp-vsnip',
            'onsails/lspkind.nvim',
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
