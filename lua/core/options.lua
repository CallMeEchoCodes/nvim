local o, g = vim.o, vim.g

-- Terminal cursor
-- o.guicursor = ""

-- Line numbers
o.number = true
o.number = 2

-- Clipboard
o.clipboard = "unnamedplus"

-- Indentation
o.autoindent = true
o.expandtab = false
o.shiftwidth = 4
o.smartindent = true
o.tabstop = 4
o.softtabstop = 4

-- Wildcard menu
o.wildmenu = true

-- Mouse
o.mouse = "a"

-- Disable netrw
g.loaded_netrw = 1
g.loaded_netrwPlugin = 1

foldenable = true
foldlevelstart = 5

-- Use terminal colours
o.termguicolors = true

-- Wrap moving cursor horizontal to next/previous lines
vim.opt.whichwrap:append("<>[]hl")

-- Neovide
vim.api.nvim_set_option_value("guifont", "CartographCF Nerd Font,Twemoji:h12", {})
g.neovide_refresh_rate = 120
g.neovide_cursor_animation_length = 0.03
g.neovide_cursor_trail_length = 0.05
g.neovide_cursor_antialiasing = true
