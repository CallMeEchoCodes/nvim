return function()
	local nvim_lsp = require("lspconfig")
	local mason = require("mason")
	local mason_lspconfig = require("mason-lspconfig")

	mason.setup({
		ui = {
			border = "rounded",
		},
		keymaps = {
			toggle_server_expand = "<CR>",
			install_server = "i",
			update_server = "u",
			check_server_version = "c",
			update_all_servers = "U",
			check_outdated_servers = "C",
			uninstall_server = "X",
			cancel_installation = "<C-c>",
		},
	})

	mason_lspconfig.setup({
		-- full list at https://github.com/neovim/nvim-lspconfig/tree/master/lua/lspconfig/server_configurations
		ensure_installed = {
			"bashls",
			"clangd",
			"html",
			"jsonls",
			"lua_ls",
			"pyright",
			"gopls",
			"tsserver",
			"cmake",
			"cssls",
			"csharp_ls",
		},
	})

	local capabilities = vim.lsp.protocol.make_client_capabilities()
	capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)

	local opts = {
		on_attach = function()
			require("lsp_signature").on_attach({
				bind = true,
				use_lspsaga = false,
				floating_window = true,
				fix_pos = true,
				hint_enable = true,
				hi_parameter = "Search",
				handler_opts = {
					border = "rounded",
				},
			})
		end,
		capabilities = capabilities,
	}

	local function mason_handler(lsp)
		local ok, custom_handler = pcall(require, "plugins.lsp." .. lsp_name)
		if not ok then
			nvim_lsp[lsp].setup(opts)
			return
		elseif type(custom_handler) == "function" then
			custom_handler(opts)
			vim.notify(string.format("[%s] has been setup!", lsp), vim.log.levels.INFO, { title = "nvim-lspconfig" })
		elseif type(custom_handler) == table then
			nvim_lsp[lsp_name].setup(vim.tbl_deep_extend("force", opts, custom_handler))
		else
			vim.notify(
				string.format(
					"Failed to setup [%s].\n\nServer definition under `lsp/` must return\neither a fun(opts) or a table (got '%s' instead)",
					lsp,
					type(custom_handler)
				),
				vim.log.levels.ERROR,
				{ title = "nvim-lspconfig" }
			)
		end
	end
end
