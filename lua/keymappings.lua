vim.g.mapleader = " "
vim.api.nvim_set_keymap('', ';', ':', {noremap = true})

-- save, quit and reload config file
vim.api.nvim_set_keymap('', 'S', ':w<CR>', {noremap = true})
vim.api.nvim_set_keymap('', 'Q', ':q<CR>', {noremap = true})
vim.api.nvim_set_keymap('', '<C-q>', ':qa<CR>', {noremap = true})
vim.api.nvim_set_keymap('', 'R', ':source ~/.config/nvim/init.lua<CR>', {noremap = true})

-- indent
vim.api.nvim_set_keymap('', '<', '<<', {noremap = true})
vim.api.nvim_set_keymap('', '>', '>>', {noremap = true})

-- window split, resize, and move
vim.api.nvim_set_keymap('', '<leader>s', ':vs<CR>', {noremap = true})
vim.api.nvim_set_keymap('', '<leader>h', '<C-w>h', {noremap = true})
vim.api.nvim_set_keymap('', '<leader>l', '<C-w>l', {noremap = true})
vim.api.nvim_set_keymap('', '<leader><left>', ':vertical resize-5<CR>', {noremap = true})
vim.api.nvim_set_keymap('', '<leader><right>', ':vertical resize+5<CR>', {noremap = true})

-- move
vim.api.nvim_set_keymap('', 'J', '5j', {noremap = true})
vim.api.nvim_set_keymap('', 'K', '5k', {noremap = true})

-- copy to system clipboard
vim.api.nvim_set_keymap('', 'Y', '"+y', {noremap = true, silent = true})

-- nvim-tree
vim.api.nvim_set_keymap('n', '<leader>e', ':NvimTreeToggle<CR>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<leader>r', ':NvimTreeRefresh<CR>', {noremap = true, silent = true})
local tree_cb = require'nvim-tree.config'.nvim_tree_callback
vim.g.nvim_tree_bindings = {
  ["l"] = tree_cb("edit"),
  ["h"] = tree_cb("close_node"),
}

-- bufferline
vim.api.nvim_set_keymap('n', '<leader>j', ':BufferLineCyclePrev<CR>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<leader>k', ':BufferLineCycleNext<CR>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<leader>q', ':bp<bar>bd!#<CR>', {noremap = true, silent = true})

-- compe
vim.api.nvim_set_keymap("i", "<C-Space>", "compe#complete()", {expr = true, silent=true})
vim.api.nvim_set_keymap("i", "<CR>", "compe#confirm('<CR>')", {expr = true, silent=true})
vim.api.nvim_set_keymap("i", "<C-e>", "compe#close('<C-e>')", {expr = true, silent=true})
vim.api.nvim_set_keymap("i", "<Tab>", "v:lua.tab_complete()", {expr = true})
vim.api.nvim_set_keymap("s", "<Tab>", "v:lua.tab_complete()", {expr = true})
vim.api.nvim_set_keymap("i", "<S-Tab>", "v:lua.s_tab_complete()", {expr = true})
vim.api.nvim_set_keymap("s", "<S-Tab>", "v:lua.s_tab_complete()", {expr = true})
