return function()
    require("toggleterm").setup({
        size = function(term)
			if term.direction == "horizontal" then
				return 15
			elseif term.direction == "vertical" then
				return vim.o.columns * 0.40
			end
		end,
        on_open = function()
			-- Prevent infinite calls from freezing neovim.
			-- Only set these options specific to this terminal buffer.
			vim.api.nvim_set_option_value("foldmethod", "manual", { scope = "local" })
			vim.api.nvim_set_option_value("foldexpr", "0", { scope = "local" })
		end,
        open_mapping = false,
        hide_numbers = true,
        shade_terminals = false,
        start_in_insert = true,
        direction = "horizontal",
        close_on_exit = true,
        shell = vim.o.shell,
    })
end