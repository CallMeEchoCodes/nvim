return function()
	require("catppuccin").setup({
		flavour = "mocha",
		term_colors = true,
		transparent_background = vim.g.neovide == nil,
		integrations = {
			treesitter = true,
			nvimtree = true,
			notify = true,
			telescope = true,
			ts_rainbow = true,
		},
		show_end_of_buffer = true,
	})

	vim.cmd.colorscheme("catppuccin")
end
