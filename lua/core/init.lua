local o, g = vim.o, vim.g

-- Terminal cursor
-- o.guicursor = ""

-- Line numbers
o.number = true
o.relativenumber = true
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

-- Use terminal colours
o.termguicolors = true

-- Wrap moving cursor horizontal to next/previous lines
-- vim.opt.whichwrap:append("<>[]hl")

-- Leaders
g.mapleader = " "

-- Neovide
vim.api.nvim_set_option_value("guifont", "Fira Code,Symbols Nerd Font,Twemoji:h12", {})
g.neovide_refresh_rate = 60
g.neovide_cursor_animation_length = 0.03
g.neovide_cursor_trail_length = 0.05
g.neovide_cursor_antialiasing = true
g.neovide_transparency = 0.2
g.neovide_cursor_vfx_mode = "railgun"

-- Keybinds
function map(mode, keystroke, out)
    vim.api.nvim_set_keymap(mode, keystroke, out, {
        noremap = true,
        silent = true,
    })
end

-- Tab keybinds
map('n', '<C-`>', ':BufferLineCycleNext<CR>')
map('n', '<C-S-`>', ':BufferLineCyclePrev<CR>')
map('n', '<C-.>', ':BufferLineMoveNext<CR>')
map('n', '<C-,>', ':BufferLineMovePrev<CR>')
map('n', '<C-Right>', ':BufferLineCycleNext<CR>')
map('n', '<C-Left>', ':BufferLineCyclePrev<CR>')
map('n', '<C-W>', ':bd<CR>')
map('n', '<C-T>', ':enew<CR>')

-- Other keybinds
map('n', '<C-/>', ':let @/ = ""<CR>')
map('n', '<C-Up>', 'g<Up>')
map('n', '<C-Down>', 'g<Down>')
map('n', '<C-Backspace>', 'db')
map('n', '<C-Delete>', 'dw')
map('n', '<C-F>', '/')
map('n', '<C-O>', ':set nowrap!<CR>')
map('n', '<C-S>', ':w<CR>')

-- Plugins
require("plugins")
