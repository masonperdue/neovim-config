local opts = {
    noremap = true, -- Prevents recursive mappings
    silent = true,  -- Doesn't show the command in the command line
}

local keymap = vim.keymap.set

-- Window Navigation (Ctrl + hjkl)
keymap('n', '<C-h>', '<C-w>h', opts)
keymap('n', '<C-j>', '<C-w>j', opts)
keymap('n', '<C-k>', '<C-w>k', opts)
keymap('n', '<C-l>', '<C-w>l', opts)

-- Resizing Panes (Ctrl + Arrow Keys)
keymap('n', '<C-Up>',    ':resize -2<CR>',          opts)
keymap('n', '<C-Down>',  ':resize +2<CR>',          opts)
keymap('n', '<C-Left>',  ':vertical resize -2<CR>', opts)
keymap('n', '<C-Right>', ':vertical resize +2<CR>', opts)

-- Visual Mode Indenting (Stay in visual mode after shift)
keymap('v', '<', '<gv', opts)
keymap('v', '>', '>gv', opts)
