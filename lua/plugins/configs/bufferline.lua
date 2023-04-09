return function()
	local ctp = require("catppuccin.palettes").get_palette()

	require("bufferline").setup({
		options = {
			max_name_length = 14,
			max_prefix_length = 10,
			tab_size = 20,

			color_icons = true,
			show_buffer_icons = true,
			show_buffer_close_icons = true,
			show_buffer_default_icon = true,
			show_close_icon = true,
			show_tab_indicators = true,

			enforce_regular_tabs = true,
			persist_buffer_sort = true,
			always_show_bufferline = true,

			separator_style = "thin",

			diagnostics = "nvim_lsp",
			diagnostics_indicator = function(count)
				return "(" .. count .. ")"
			end,
			offsets = {
				{
					filetype = "NvimTree",
					text = "",
					text_align = "center",
					padding = 1,
				},
				{
					filetype = "lspsagaoutline",
					text = "Lspsaga Outline",
					text_align = "center",
					padding = 1,
				},
			},
		},

		highlights = require("catppuccin.groups.integrations.bufferline").get({
			styles = { "italic", "bold" },
		}),
	})
end