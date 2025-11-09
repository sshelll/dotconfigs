local capabilities = require("cmp_nvim_lsp").default_capabilities()

vim.lsp.config("move_analyzer", {
	cmd = { os.getenv("HOME") .. "/.cargo/bin/move-analyzer" },
	filetypes = { "move" },
	root_makers = { "Move.toml", ".git" },
	-- root_dir = lspconfig.util.root_pattern(".git"),
	-- root_dir = function(fname)
	-- 	local move_package_dir = lspconfig.util.root_pattern("Move.toml")(fname)
	-- 	return move_package_dir
	-- end,
	capabilities = capabilities,
})
vim.lsp.enable("move_analyzer")
-- vim.lsp.enable("solidity_ls_nomicfoundation")
vim.lsp.enable("solidity_ls")

require("mason-lspconfig").setup({
	ensure_installed = {
		"lua_ls", -- lua
		"gopls", -- go
		"bashls", -- bash
		"rust_analyzer", -- rust
		"jdtls", -- java
		"biome", -- json
		"taplo", -- toml
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
			vim.lsp.config(server_name, {
				capabilities = capabilities,
			})
		end,
		["gopls"] = function()
			vim.lsp.config.gopls.setup({
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
			vim.lsp.config.lua_ls.setup({
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
			vim.lsp.config.sqlls.setup({
				cmd = { "sql-language-server", "up", "--method", "stdio" },
				filetypes = { "sql", "mysql" },
				root_dir = vim.lsp.config.util.root_pattern(".git", vim.fn.getcwd()),
			})
		end,
		["sqls"] = function()
			vim.lsp.config.sqls.setup({
				cmd = { "sqls", "-config", "~/.config/sqls/config.yml" },
				filetypes = { "sql", "mysql" },
				root_dir = vim.lsp.config.util.root_pattern(".git", vim.fn.getcwd()),
			})
		end,
		["biome"] = function()
			vim.lsp.config.biome.setup({
				cmd = { "biome", "lsp-proxy" },
				filetypes = { "json", "jsonc" },
				root_dir = vim.lsp.config.util.root_pattern(".git", vim.fn.getcwd()),
				single_file_support = true,
			})
		end,
		["millet"] = function()
			vim.lsp.config.millet.setup({
				cmd = { "millet" },
			})
		end,
		["solc"] = function()
			vim.lsp.config.solc.setup({
				cmd = { "solc", "--lsp" },
				filetypes = { "solidity" },
				root_dir = function(bufnr, on_dir)
					local fname = vim.api.nvim_buf_get_name(bufnr)
					on_dir(require("lspconfig.util").root_pattern("hardhat.config.*", ".git")(fname))
				end,
			})
		end,
		["solidity_ls_nomicfoundation"] = function()
			vim.lsp.config.solidity.setup({
				cmd = { "nomicfoundation-solidity-language-server", "--stdio" },
				filetypes = { "solidity" },
				root_dir = function(startpath)
					return vim.fs.dirname(vim.fs.find(".git", { path = startpath, upward = true })[1])
				end,
				single_file_support = true,
			})
		end,
		["vscode-solidity-server"] = function()
			vim.lsp.config.solidity.setup({})
		end,
	},
})
