-- default configuration
require("illuminate").configure({
	providers = {
		"treesitter",
		"regex",
	},
	filetypes_denylist = {},
	min_count_to_highlight = 2,
	-- solidity lsp is too weak, which cannot be used by nvim-treesitter-refactor, so we use regex here with illuminate.nvim
	-- swift is not open-source
	-- filetypes_allowlist = { "solidity", "swift", "go" },
})

-- vim.api.nvim_set_hl(0, 'IlluminatedWordText', { fg = '#D1F24F', bg = '#4D5A1A' })
-- vim.api.nvim_set_hl(0, 'IlluminatedWordText', { fg = '#FA81C6', bg = '#7C4363' })
-- vim.api.nvim_set_hl(0, 'IlluminatedWordText', { fg = '#8981EE', bg = '#3C386B' })
-- vim.api.nvim_set_hl(0, 'IlluminatedWordText', { bg = '#2F507A' })
-- vim.api.nvim_set_hl(0, "IlluminatedWordText", { bg = "#666D8D" })
-- vim.api.nvim_set_hl(0, "IlluminatedWordText", { bg = "#424D70" })

if vim.g.transparent then
	vim.api.nvim_set_hl(0, "IlluminatedWordRead", { fg = "#D1F24F", bg = "#4D5A1A" })
	vim.api.nvim_set_hl(0, "IlluminatedWordWrite", { link = "Visual" })
	vim.api.nvim_set_hl(0, "IlluminatedWordText", { fg = "#D1F24F", bg = "#4D5A1A" })
else
	vim.api.nvim_set_hl(0, "IlluminatedWordText", { link = "Visual" })
end
