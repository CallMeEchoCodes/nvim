return function()
	local function diff_source()
		local gitsigns = vim.b.gitsigns_status_dict
		if gitsigns then
			return {
				added = gitsigns.added,
				modified = gitsigns.changed,
				removed = gitsigns.removed,
			}
		end
	end

	local function get_cwd()
		local cwd = vim.fn.getcwd()
		local home = require("core.global").home
		if cwd:find(home, 1, true) == 1 then
			cwd = "~" .. cwd:sub(#home + 1)
		end
		return cwd
	end
	require("lualine").setup({
		options = {
			icons_enabled = true,
			theme = "catppuccin",
			disabled_filetypes = {},
			component_separators = "|",
			section_separators = { left = "", right = "" },
		},
		sections = {
			lualine_a = { { "mode" } },
			lualine_b = { { "branch" }, { "diff", source = diff_source } },
			lualine_x = { { get_cwd } },
			lualine_z = { "progress", "location" },
			lualine_y = {
				{ "filetype", colored = true, icon_only = true },
				{ "encoding" },
				{
					"fileformat",
					icons_enabled = true,
					symbols = {
						unix = "LF",
						dos = "CRLF",
						mac = "CR",
					},
				},
			},
		},
		inactive_sections = {
			lualine_a = {},
			lualine_b = {},
			lualine_c = { "filename" },
			lualine_x = { "location" },
			lualine_y = {},
			lualine_z = {},
		},
		extensions = {
			"nvim-tree",
			"fugitive",
			"toggleterm",
		},
	})
end
