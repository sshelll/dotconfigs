-- default configuration
require("illuminate").configure({
	providers = {
		"treesitter",
		"regex",
	},
	filetypes_denylist = {},
	-- solidity lsp is too weak, which cannot be used by nvim-treesitter-refactor, so we use regex here with illuminate.nvim
	-- swift is not open-source
	-- filetypes_allowlist = { "solidity", "swift", "go" },
})

-- vim.api.nvim_set_hl(0, 'IlluminatedWordText', { fg = '#D1F24F', bg = '#4D5A1A' })
-- vim.api.nvim_set_hl(0, 'IlluminatedWordText', { fg = '#FA81C6', bg = '#7C4363' })
-- vim.api.nvim_set_hl(0, 'IlluminatedWordText', { fg = '#8981EE', bg = '#3C386B' })
-- vim.api.nvim_set_hl(0, 'IlluminatedWordText', { bg = '#2F507A' })

if vim.g.transparent then
	-- vim.api.nvim_set_hl(0, "IlluminatedWordText", { bg = "#666D8D" })
	-- nvim-treesitter-refactor uses 'Visual' to highlight the words, we keep the same here
	-- vim.api.nvim_set_hl(0, "IlluminatedWord", { fg = "#D1F24F", bg = "#4D5A1A" })
	vim.api.nvim_set_hl(0, "IlluminatedWordRead", { fg = "#D1F24F", bg = "#4D5A1A" })
	vim.api.nvim_set_hl(0, "IlluminatedWordWrite", { link = "Visual" })
	-- vim.api.nvim_set_hl(0, "IlluminatedWordText", { fg = "#D1F24F", bg = "#4D5A1A" })
	-- vim.api.nvim_set_hl(0, "IlluminatedCurWord", { fg = "#D1F24F", bg = "#4D5A1A" })
else
	-- vim.api.nvim_set_hl(0, "IlluminatedWordText", { bg = "#424D70" })
	-- nvim-treesitter-refactor uses 'Visual' to highlight the words, we keep the same here
	vim.api.nvim_set_hl(0, "IlluminatedWordText", { link = "Visual" })
end
