-- default configuration
require('illuminate').configure()

-- vim.api.nvim_set_hl(0, 'IlluminatedWordText', { fg = '#D1F24F', bg = '#4D5A1A' })
-- vim.api.nvim_set_hl(0, 'IlluminatedWordText', { fg = '#FA81C6', bg = '#7C4363' })
-- vim.api.nvim_set_hl(0, 'IlluminatedWordText', { fg = '#8981EE', bg = '#3C386B' })
-- vim.api.nvim_set_hl(0, 'IlluminatedWordText', { bg = '#2F507A' })

if vim.g.transparent then
    vim.api.nvim_set_hl(0, "IlluminatedWordText", { bg = "#666D8D" })
else
    vim.api.nvim_set_hl(0, 'IlluminatedWordText', { bg = '#424D70' })
end
