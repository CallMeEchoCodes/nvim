-- Keybinds
vim.g.mapleader = " "

function map(mode, keystroke, out, desc)
    vim.api.nvim_set_keymap(mode, keystroke, out, {
        noremap = true,
        silent = true,
        desc = desc,
    })
end
function cmd(name, func)
    vim.api.nvim_create_user_command(name, func, {})
end

-- Tab keybinds
map('n', '<C-`>', ':BufferLineCycleNext<CR>', 'Next tab')
map('n', '<C-S-`>', ':BufferLineCyclePrev<CR>', 'Previous tab')
map('n', '<C-.>', ':BufferLineMoveNext<CR>', 'Move tab right')
map('n', '<C-,>', ':BufferLineMovePrev<CR>', 'Move tab left')
map('n', '<C-Right>', ':BufferLineCycleNext<CR>', 'Next Tab')
map('n', '<C-Left>', ':BufferLineCyclePrev<CR>', 'Previous tab')
map('n', '<C-W>', ':bd<CR>', 'Close buffer')
map('n', '<C-T>', ':enew<CR>', 'New buffer')

-- Functions
cmd('FindProjects', function()
    require("telescope").extensions.projects.projects({})
end)
cmd('FileHistory', function()
    require("telescope.builtin").oldfiles()
end)
cmd('PromptGoLine', function()
    local line = vim.fn.input("Go to line: ")
    if tonumber(line, 10) ~= nil then
        vim.cmd(":" .. line)
    else
        print("Not a number")
    end
end)

-- Other keybinds
map('n', '<C-O>', ':NvimTreeToggle<CR>', 'Toggle tree view')
map('n', '<C-D>', ':ToggleTerm direction=horizontal<CR>', 'Toggle terminal')
map('n', '<C-G>', ':PromptGoLine<CR>', 'Go to line')
map('n', '<leader>fr', ':FindProjects<CR>', 'Find projects')
map('n', '<leader>fh', ':FileHistory<CR>', 'Search File History')

map('n', '<C-/>', ':let @/ = ""<CR>', 'Clear search query')
map('n', '<C-Up>', 'g<Up>', 'Go up visual line')
map('n', '<C-Down>', 'g<Down>', 'Go down visual line')
map('n', '<C-Backspace>', 'db', 'Backspace word')
map('n', '<C-Delete>', 'dw', 'Delete word')
map('n', '<C-F>', '/', 'Search')
map('n', '<C-U>', ':set nowrap!<CR>', 'Toggle word wrapping')
map('n', '<C-S>', ':w<CR>', 'Save')
