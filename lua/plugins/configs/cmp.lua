return function()
	local border = function(hl)
		return {
			{ "╭", hl },
			{ "─", hl },
			{ "╮", hl },
			{ "│", hl },
			{ "╯", hl },
			{ "─", hl },
			{ "╰", hl },
			{ "│", hl },
		}
	end

	local compare = require("cmp.config.compare")
	compare.lsp_scores = function(entry1, entry2)
		local diff
		if entry1.completion_item.score and entry2.completion_item.score then
			diff = (entry2.completion_item.score * entry2.score) - (entry1.completion_item.score * entry1.score)
		else
			diff = entry2.score - entry1.score
		end
		return (diff < 0)
	end

	local cmp = require("cmp")
	local lspkind = require("lspkind")

	cmp.setup({
		window = {
			completion = {
				border = border("Normal"),
				max_width = 80,
				max_height = 20,
			},
			documentation = {
				border = border("CmpDocBorder"),
			},
		},
		sorting = {
			priority_weight = 2,
			comparators = {
				compare.offset,
				compare.exact,
				compare.lsp_scores,
				require("cmp-under-comparator").under,
				compare.kind,
				compare.sort_text,
				compare.length,
				compare.order,
			},
		},
		formatting = {
			fields = { "kind", "abbr", "menu" },
			format = function(entry, vim_item)
				local kind = lspkind.cmp_format({
					mode = "symbol_text",
					maxwidth = 50,
				})(entry, vim_item)
				local strings = vim.split(kind.kind, "%s", { trimempty = true })
				if strings[1] ~= nil then
					kind.kind = " " .. strings[1] .. " "
				end
				if strings[2] ~= nil then
					kind.menu = "    (" .. strings[2] .. ")"
				end
				return kind
			end,
		},
		snippet = {
			expand = function(args)
				require("luasnip").lsp_expand(args.body)
			end,
		},
		mapping = {
			["<C-CR>"] = cmp.mapping.complete(),
			["<CR>"] = cmp.mapping.confirm({
				select = true,
				behavior = cmp.ConfirmBehavior.replace,
			}),
			["<Tab>"] = cmp.mapping(function(fallback)
				if cmp.visible() then
					cmp.select_next_item()
				else
					fallback()
				end
			end, { "i", "s" }),
			["<S-Tab>"] = cmp.mapping(function(fallback)
				if cmp.visible() then
					cmp.select_previous_item()
				else
					fallback()
				end
			end, { "i", "s" }),
		},
		sources = {
			{ name = "nvim_lsp" },
			{ name = "nvim_lua" },
			{ name = "luasnip" },
			{ name = "path" },
			{ name = "treesitter" },
			{ name = "spell" },
			{ name = "latex_symbols" },
		},
	})
end
