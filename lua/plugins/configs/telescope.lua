return function()
	require("telescope").setup({
		defaults = {
			initial_mode = "insert",
			scroll_strategy = "limit",
			results_title = false,
			layout_strategy = "horizontal",
			path_display = { "absolute" },
			file_ignore_patterns = { ".git/", ".cache", "%.class", "%.pdf", "%.mkv", "%.mp4", "%.zip" },
			layout_config = {
				horizontal = {
					preview_width = 0.5,
				},
			},
		},
		pickers = {
			keymaps = {
				theme = "dropdown",
			},
		},
	})
	require("telescope").load_extension("zoxide")
	require("telescope").load_extension("notify")
	require("telescope").load_extension("projects")
end
