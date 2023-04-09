return function()
	require("catppuccin").setup({
		flavour = "mocha",
		term_colors = true,
		transparent_background = fasle,
		integrations = {
			treesitter = true,
			nvimtree = true,
			notify = true,
			telescope = true,
			ts_rainbow = true,
			cmp = true,
			native_lsp = {
				enabled = true,
				virtual_text = {
					errors = { "italic" },
					hints = { "italic" },
					warnings = { "italic" },
					information = { "italic" },
				},
				underlines = {
					errors = { "underline" },
					hints = { "underline" },
					warnings = { "underline" },
					information = { "underline" },
				},
			},
		},
		show_end_of_buffer = false,
		highlight_overrides = {
			mocha = function(mocha)
				return {
					PmenuSel = { bg = mocha.base, fg = "NONE" },
					Pmenu = { fg = mocha.base, bg = mocha.base },
				}
			end,
		},
	})

	vim.cmd.colorscheme("catppuccin")
end
