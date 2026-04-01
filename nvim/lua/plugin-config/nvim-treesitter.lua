require("nvim-treesitter").setup({
	-- Directory to install parsers and queries to (prepended to `runtimepath` to have priority)
	install_dir = vim.fn.stdpath("data") .. "/site",
})

require("nvim-treesitter").install({
	"json",
	"yaml",
	"toml",
	"html",
	"css",
	"vim",
	"lua",
	"javascript",
	"typescript",
	"tsx",
	"go",
	"gomod",
	"gosum",
	"regex",
	"markdown",
	"markdown_inline",
	"rust",
	"bash",
	"make",
	"python",
	"c",
	"java",
	"dockerfile",
	"ssh_config",
	"nginx",
	"typst",
})

vim.api.nvim_create_autocmd("FileType", {
	callback = function(ev)
		pcall(vim.treesitter.start)
	end,
})
