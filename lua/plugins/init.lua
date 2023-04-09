-- Load lazy
local lazy_path = vim.fn.stdpath("data") .. "lazy/lazy.nvim"
if not vim.loop.fs_stat(lazy_path) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable",
		lazy_path
	})
end

vim.opt.rtp:prepend(lazy_path)

-- Lazy settings
local lazy_settings = {
	git = {
		timeout = 300,
	},
	install = {
		colorscheme = { "catppuccin" },
	},
	ui = {
		border = "rounded",
	},
}

-- Lazy plugins
local lazy_plugins = {
	{
		"goolord/alpha-nvim",
		lazy = true,
		event = "BufWinEnter",
		config = require("plugins.configs.alpha"),
	},
	{
		"catppuccin/nvim",
		name = "catppuccin",
		config = require("plugins.configs.catppuccin"),
		priority = 99,
	},
	{
		"nvim-treesitter/nvim-treesitter",
		lazy = true,
		build = function()
			if #vim.api.nvim_list_uis() ~= 0 then
				vim.api.nvim_command("TSUpdate")
			end
		end,
		event = { "CursorHold", "CursorHoldI" },
		dependencies = {
			{ "andymass/vim-matchup" },
			{ "mrjones2014/nvim-ts-rainbow" },
		},
		config = require("plugins.configs.treesitter"),
	},
	{
		"andweeb/presence.nvim",
		config = require("plugins.configs.presence"),
		enabled = false,
	},
	{
		"akinsho/bufferline.nvim",
		version = "v3.*",
		dependencies = {
			{ "nvim-tree/nvim-web-devicons" },
		},
		lazy = true,
		event = { "BufReadPost", "BufAdd", "BufNewFile" },
		config = require("plugins.configs.bufferline"),
	},
	{
		"nvim-tree/nvim-tree.lua",
		lazy = true,
		cmd = {
			"NvimTreeToggle",
			"NvimTreeOpen",
			"NvimTreeFindFile",
			"NvimTreeFindFileToggle",
			"NvimTreeRefresh",
		},
		dependencies = {
			{ "nvim-tree/nvim-web-devicons" },
		},
		config = require("plugins.configs.nvim-tree"),
	},
	{
		"ibhagwan/smartyank.nvim",
		lazy = true,
		event = "BufReadPost",
		config = require("plugins.configs.smartyank"),
	},
	{
		"tpope/vim-fugitive",
		lazy = true,
		cmd = { "Git", "G" },
	},
	{
		"akinsho/toggleterm.nvim",
		lazy = true,
		cmd = {
			"ToggleTerm",
			"ToggleTermSetName",
			"ToggleTermToggleAll",
			"ToggleTermSendVisualLines",
			"ToggleTermSendCurrentLine",
			"ToggleTermSendVisualSelection",
		},
		config = require("plugins.configs.toggleterm"),
	},
	{
		"nvim-telescope/telescope.nvim",
		lazy = true,
		cmd = "Telescope",
		config = require("plugins.configs.telescope"),
		dependencies = {
			{ "nvim-tree/nvim-web-devicons" },
			{
				"ahmedkhalf/project.nvim",
				event = "BufReadPost",
				config = require("plugins.configs.project"),
			},
			{ "jvgrootveld/telescope-zoxide" },
			{ "nvim-lua/plenary.nvim" },
		},
	},
	{
		"rcarriga/nvim-notify",
		lazy = true,
		event = "VeryLazy",
		config = require("plugins.configs.notify"),
	},
	{
		"nvim-lualine/lualine.nvim",
		lazy = true,
		event = { "BufReadPost", "BufAdd", "BufNewFile" },
		config = require("plugins.configs.lualine")
	}
}

require("lazy").setup(lazy_plugins, lazy_settings)
