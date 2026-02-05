local cmp_autopairs = require("nvim-autopairs.completion.cmp")
local cmp = require("cmp")

local has_words_before = function()
	unpack = unpack or table.unpack
	local line, col = unpack(vim.api.nvim_win_get_cursor(0))
	return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
end

local feedkey = function(key, mode)
	vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes(key, true, true, true), mode, true)
end

-- Setup nvim-cmp
cmp.setup({
	view = {
		entries = "custom", -- can be "custom", "wildmenu" or "native"
	},
	window = {
		completion = {
			border = "rounded",
			side_padding = 0,
		},
		documentation = {
			border = "rounded",
		},
	},
	formatting = {
		fields = { "abbr", "icon", "kind", "menu" },
		format = require("lspkind").cmp_format({
			maxwidth = {
				menu = 50,
				abbr = 50,
			},
			ellipsis_char = "...",
			show_labelDetails = true,
			before = function(entry, vim_item)
				return vim_item
			end,
		}),
	},
	snippet = {
		expand = function(args)
			vim.fn["vsnip#anonymous"](args.body)
		end,
	},
	mapping = cmp.mapping.preset.insert({
		["<C-e>"] = cmp.mapping.abort(),
		["<C-u>"] = cmp.mapping.scroll_docs(-4), -- Up
		["<C-d>"] = cmp.mapping.scroll_docs(4), -- Down
		["<C-Space>"] = cmp.mapping.complete(),
		["<CR>"] = cmp.mapping.confirm({
			behavior = cmp.ConfirmBehavior.Replace,
			select = true,
		}),
		["<Tab>"] = cmp.mapping(function(fallback)
			if cmp.visible() then
				cmp.select_next_item({ behavior = cmp.SelectBehavior.Select })
			elseif vim.fn["vsnip#available"](1) == 1 then
				feedkey("<Plug>(vsnip-expand-or-jump)", "")
			elseif has_words_before() then
				cmp.complete()
			else
				fallback() -- The fallback function sends a already mapped key. In this case, it's probably `<Tab>`.
			end
		end, { "i", "s" }),
		["<S-Tab>"] = cmp.mapping(function()
			if cmp.visible() then
				cmp.select_prev_item({ behavior = cmp.SelectBehavior.Select })
			elseif vim.fn["vsnip#jumpable"](-1) == 1 then
				feedkey("<Plug>(vsnip-jump-prev)", "")
			end
		end, { "i", "s" }),
	}),
	sources = cmp.config.sources({
		{ name = "nvim_lsp", priority = 1000, group_index = 1 },
		{ name = "vsnip", priority = 999, group_index = 1 },
		{ name = "copilot", priority = 998, group_index = 1 },
		{ name = "path", priority = 997, group_index = 1 },
		{ name = "buffer", priority = 500, group_index = 1 },
		{ name = "cmp-dbee", priority = 800, group_index = 2 },
		{ name = "orgmode", priority = 800, group_index = 2 },
		{
			name = "lazydev",
			group_index = 0, -- set group index to 0 to skip loading LuaLS completions
		},
	}),
})

-- `/` cmdline setup.
cmp.setup.cmdline({ "/", "?" }, {
	mapping = cmp.mapping.preset.cmdline(),
	sources = {
		{ name = "buffer" },
	},
})

-- `:` cmdline setup.
cmp.setup.cmdline(":", {
	mapping = cmp.mapping.preset.cmdline(),
	sources = cmp.config.sources({
		{ name = "path" },
	}, {
		{
			name = "cmdline",
			option = {
				ignore_cmds = { "Man", "!" },
			},
		},
	}),
})

cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())

-- Customized Snippet
vim.g.vsnip_snippet_dir = vim.fn.stdpath("config") .. "/snippets"

-- Customization for Pmenu
-- vim.api.nvim_set_hl(0, "PmenuSel", { bg = "#282C34", fg = "NONE" })
vim.api.nvim_set_hl(0, "Pmenu", { fg = "#C5CDD9" })
