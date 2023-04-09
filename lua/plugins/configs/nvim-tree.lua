return function()
	require("nvim-tree").setup({
		auto_reload_on_write = true,
		disable_netrw = false,
		hijack_cursor = true,
		hijack_netrw = true,
		hijack_unnamed_buffer_when_opening = true,
		sort_by = "case_sensitive",
		sync_root_with_cwd = true,
		renderer = {
			add_trailing = false,
			group_empty = true,
			highlight_git = false,
			full_name = false,
			highlight_opened_files = "none",
			special_files = {
				"Makefile",
				"README.md",
				"readme.md",
				"README",
				"readme",
				"README.txt",
				"readme.txt",
				"CmakeLists.txt",
				"package.json",
				"package-lock.json",
				"pnpm-lock.yaml",
				"pnpm-lock.yml",
				"Cargo.toml"
			},
			symlink_destination = true,
			indent_markers = {
				enable = true,
				icons = {
					corner = "└ ",
					edge = "│ ",
					item = "├ ",
					none = "  ",
				},
			},
			root_folder_label = ":.:s?.*?/..?",
			icons = {
				webdev_colors = true,
				git_placement = "before",
				show = {
					file = true,
					folder = true,
					folder_arrow = true,
					git = true,
				},
				padding = " ",
				symlink_arrow = " -> ",
			},
		},
		filters = {
			dotfiles = true,
			exclude = { ".DS_Store", "Thumbs.db" },
		},
		trash = {
			cmd = "gio trash",
			require_confirm = false,
		},
		git = {
			enable = true,
			ignore = true,
			show_on_dirs = true,
			timeout = 400,
		},
		actions = {
			use_system_clipboard = true,
			change_dir = {
				enable = true,
				global = false,
			},
		},
		view = {
			adaptive_size = false,
			width = 30,
			side = "left",
			number = false,
			relativenumber = false,
			float = {
				enable = false,
			},
		},
		filesystem_watchers = {
			enable = true,
			debounce_delay = 50,
		},
		log = {
			enable = false,
		}
	})
end
