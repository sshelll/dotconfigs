-- vim.api.nvim_set_hl(0, 'MarkviewCodeblock', { bg = 'none' }) -- #2C3144

require("markview").setup({
	preview = {
		buf_ignore = { "nofile" },
		modes = { "n", "no" },
		hybrid_modes = { "n", "no" },
	},
	highlight_groups = {
		MarkviewH1 = { fg = "#f38ba8", bg = "#553e53" },
		MarkviewH2 = { fg = "#fab387", bg = "#57484b" },
		MarkviewH3 = { fg = "#f9e2af", bg = "#575455" },
		MarkviewH4 = { fg = "#a6e3a1", bg = "#425451" },
		MarkviewH5 = { fg = "#74c7ec", bg = "#364d64" },
		MarkviewH6 = { fg = "#b4befe", bg = "#464b68" },
		MarkviewCodeblock = { bg = "none" },
	},
	markdown = {
		enable = true,
		tables = require("markview.presets").tables.rounded,
		headings = {
			enable = true,
			shift_width = 1,
			heading_1 = {
				style = "icon",
				hl = "MarkviewH1",
			},
			heading_2 = {
				style = "icon",
				hl = "MarkviewH2",
			},
			heading_3 = {
				style = "icon",
				hl = "MarkviewH3",
			},
			heading_4 = {
				style = "icon",
				hl = "MarkviewH4",
			},
			heading_5 = {
				style = "icon",
				hl = "MarkviewH5",
			},
			heading_6 = {
				style = "icon",
				hl = "MarkviewH6",
			},
		},
		horizontal_rules = {
			enable = true,
			position = "overlay",
			parts = {
				{
					type = "repeating",
					repeat_amount = function() --[[@as function]]
						local textoff = vim.fn.getwininfo(vim.api.nvim_get_current_win())[1].textoff

						return math.floor((vim.o.columns - textoff - 3) / 2)
					end,
					text = "─",
					hl = {
						"MarkviewGradient1",
						"MarkviewGradient2",
						"MarkviewGradient3",
						"MarkviewGradient4",
						"MarkviewGradient5",
						"MarkviewGradient6",
						"MarkviewGradient7",
						"MarkviewGradient8",
						"MarkviewGradient9",
						"MarkviewGradient10",
					},
				},
				{
					type = "repeating",
					repeat_amount = function() --[[@as function]]
						local textoff = vim.fn.getwininfo(vim.api.nvim_get_current_win())[1].textoff

						return math.ceil((vim.o.columns - textoff - 3) / 2)
					end,

					direction = "right",
					text = "─",
					hl = {
						"MarkviewGradient1",
						"MarkviewGradient2",
						"MarkviewGradient3",
						"MarkviewGradient4",
						"MarkviewGradient5",
						"MarkviewGradient6",
						"MarkviewGradient7",
						"MarkviewGradient8",
						"MarkviewGradient9",
						"MarkviewGradient10",
					},
				},
			},
		},
		code_blocks = {
			enable = true,
			style = "language",
			position = "overlay",

			border_hl = "MarkviewCodeblock",
			default = {
				block_hl = "MarkviewCodeblock",
				pad_hl = "MarkviewCodeblock",
			},

			min_width = 100,
			pad_char = " ",
			pad_amount = 2,

			language_direction = "right",
			sign = true,
		},
		block_quotes = {
			enable = true,

			default = {
				border = "▋",
			},
			callouts = nil,
		},
		metadata_minus = {
			enable = true,
			hl = "MarkviewCodeblock",
			border_hl = "MarkviewCodeblock",
			border_top = "",
			border_bottom = "",
		},
	},
	markdown_inline = {
		checkboxes = {
			enable = true,
			checked = {
				text = " ",
				hl = "DiagnosticOk",
			},
			unchecked = {
				text = " ",
				hl = "DiagnosticError",
			},
			pending = {
				text = " ",
				hl = "DiagnosticWarn",
			},
		},
	},
	typst = {
		code_blocks = {
			enable = true,
			style = "language",
			position = "overlay",

			border_hl = "MarkviewCodeblock",
			default = {
				block_hl = "MarkviewCodeblock",
				pad_hl = "MarkviewCodeblock",
			},

			min_width = 100,
			pad_char = " ",
			pad_amount = 2,

			language_direction = "right",
			sign = true,
		},
	},
})
