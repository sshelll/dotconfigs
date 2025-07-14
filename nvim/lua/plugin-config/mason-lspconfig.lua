local lspconfig = require("lspconfig")
local capabilities = require("cmp_nvim_lsp").default_capabilities()

lspconfig.move_analyzer.setup({
	cmd = { "move-analyzer" },
	filetypes = { "move" },
	root_dir = lspconfig.util.root_pattern("Move.toml", ".git"),
	capabilities = capabilities,
})

require("mason-lspconfig").setup({
	ensure_installed = {
		"lua_ls", -- lua
		"gopls", -- go
		"bashls", -- bash
		"rust_analyzer", -- rust
		"jdtls", -- java
		"biome", -- json
		"taplo", -- toml
		"ts_ls", -- typescript
		"tinymist", -- typst
		"docker_compose_language_service", -- docker-compose
		"dockerls", -- dockerfile
	},
	automatic_installation = false,
	automatic_enable = {
		exclude = {
			"rust_analyzer",
			"ts_ls",
		},
	},
	handlers = {
		function(server_name)
			lspconfig[server_name].setup({
				capabilities = capabilities,
			})
		end,
		["gopls"] = function()
			lspconfig.gopls.setup({
				cmd = { "gopls" },
				capabilities = capabilities,
				settings = {
					gopls = {
						directoryFilters = { "-vendor" },
						experimentalPostfixCompletions = true,
						analyses = {
							unusedparams = true,
							shadow = false,
						},
						staticcheck = true,
					},
				},
				init_options = {
					usePlaceholders = true,
				},
			})
		end,
		["lua_ls"] = function()
			lspconfig.lua_ls.setup({
				settings = {
					Lua = {
						diagnostics = {
							globals = { "vim" },
						},
					},
				},
			})
		end,
		["jdtls"] = function() end,
		["sqlls"] = function()
			lspconfig.sqlls.setup({
				cmd = { "sql-language-server", "up", "--method", "stdio" },
				filetypes = { "sql", "mysql" },
				root_dir = lspconfig.util.root_pattern(".git", vim.fn.getcwd()),
			})
		end,
		["sqls"] = function()
			lspconfig.sqls.setup({
				cmd = { "sqls", "-config", "~/.config/sqls/config.yml" },
				filetypes = { "sql", "mysql" },
				root_dir = lspconfig.util.root_pattern(".git", vim.fn.getcwd()),
			})
		end,
		["biome"] = function()
			lspconfig.biome.setup({
				cmd = { "biome", "lsp-proxy" },
				filetypes = { "json", "jsonc" },
				root_dir = lspconfig.util.root_pattern(".git", vim.fn.getcwd()),
				single_file_support = true,
			})
		end,
		["millet"] = function()
			lspconfig.millet.setup({
				cmd = { "millet" },
			})
		end,
	},
})
