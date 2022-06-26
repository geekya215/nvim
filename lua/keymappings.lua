vim.g.mapleader = ' '
vim.api.nvim_set_keymap('', ';', ':', {noremap = true})

-- save, quit and reload config file
vim.api.nvim_set_keymap('', 'S', ':w<CR>', {noremap = true})
vim.api.nvim_set_keymap('', 'Q', ':q<CR>', {noremap = true})
vim.api.nvim_set_keymap('', '<C-q>', ':qa<CR>', {noremap = true})

-- indent
vim.api.nvim_set_keymap('', '<', '<<', {noremap = true})
vim.api.nvim_set_keymap('', '>', '>>', {noremap = true})

-- move
vim.api.nvim_set_keymap('', 'J', '5j', {noremap = true})
vim.api.nvim_set_keymap('', 'K', '5k', {noremap = true})

-- copy to system clipboard
vim.api.nvim_set_keymap('', 'Y', '"+y', {noremap = true, silent = true})

-- nvim-tree
vim.api.nvim_set_keymap('n', '<leader>e', ':NvimTreeToggle<CR>', {noremap = true, silent = true})

-- bufferline
vim.api.nvim_set_keymap('n', '<leader>j', ':BufferLineCyclePrev<CR>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<leader>k', ':BufferLineCycleNext<CR>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<leader>q', ':bp<bar>bd!#<CR>', {noremap = true, silent = true})
