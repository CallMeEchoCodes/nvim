return vim.schedule_wrap(function()
	vim.api.nvim_set_option_value("foldmethod", "manual", {})
	vim.api.nvim_set_option_value("foldexpr", "nvim_treesitter#foldexpr()", {})

	require("nvim-treesitter.configs").setup({
		ensure_installed = {
			"bash",
			"c",
			"cpp",
			"css",
			"cmake",
			"html",
			"javascript",
			"json",
			"make",
			"markdown",
			"markdown_inline",
			"python",
			"rust",
			"typescript",
			"yaml",
			"java",
			"c_sharp",
			"lua",
			"git_rebase",
			"gitattributes",
			"gitcommit",
			"gitignore",
			"go",
			"jq",
		},
	})
	require("nvim-treesitter.install").prefer_git = true
end)
