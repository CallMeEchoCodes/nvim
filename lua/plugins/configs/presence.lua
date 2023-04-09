return function()
	require("presence").setup({
		main_image = "file",
		enable_line_number = false,
		show_time = false,
		neovim_image_text = "Neovim",
		blacklist = {
			"NvimTree",
		},
	})
end
