vim.g.mapleader = " "
vim.api.nvim_set_keymap("", ";", ":", {noremap = true})

-- save, quit and reload config file
vim.api.nvim_set_keymap("", "S", ":w<CR>", {noremap = true})
vim.api.nvim_set_keymap("", "Q", ":q<CR>", {noremap = true})
vim.api.nvim_set_keymap("", "<C-q>", ":qa<CR>", {noremap = true})

-- indent
vim.api.nvim_set_keymap("", "<", "<<", {noremap = true})
vim.api.nvim_set_keymap("", ">", ">>", {noremap = true})

-- move
vim.api.nvim_set_keymap("", "J", "5j", {noremap = true})
vim.api.nvim_set_keymap("", "K", "5k", {noremap = true})

-- copy to system clipboard
vim.api.nvim_set_keymap("", "Y", '"+y', {noremap = true, silent = true})

-- nvim-tree
vim.api.nvim_set_keymap("n", "<leader>e", ":NvimTreeToggle<CR>", {noremap = true, silent = true})

-- bufferline
vim.api.nvim_set_keymap("n", "<leader>j", ":BufferLineCyclePrev<CR>", {noremap = true, silent = true})
vim.api.nvim_set_keymap("n", "<leader>k", ":BufferLineCycleNext<CR>", {noremap = true, silent = true})
vim.api.nvim_set_keymap("n", "<leader>q", ":bp<bar>bd!#<CR>", {noremap = true, silent = true})

-- toggle term
function _G.set_terminal_keymaps()
  local opts = {noremap = true}
  vim.api.nvim_buf_set_keymap(0, "t", "<esc>", [[<C-\><C-n>]], opts)
  vim.api.nvim_buf_set_keymap(0, "t", "<C-h>", [[<C-\><C-n><C-W>h]], opts)
  vim.api.nvim_buf_set_keymap(0, "t", "<C-j>", [[<C-\><C-n><C-W>j]], opts)
  vim.api.nvim_buf_set_keymap(0, "t", "<C-k>", [[<C-\><C-n><C-W>k]], opts)
  vim.api.nvim_buf_set_keymap(0, "t", "<C-l>", [[<C-\><C-n><C-W>l]], opts)
end

-- if you only want these mappings for toggle term use term://*toggleterm#* instead
vim.cmd("autocmd! TermOpen term://* lua set_terminal_keymaps()")

local Terminal  = require("toggleterm.terminal").Terminal
local lazygit = Terminal:new({ cmd = "lazygit", hidden = true, direction = "float" })

function _lazygit_toggle()
  lazygit:toggle()
end

vim.api.nvim_set_keymap("n", "<leader>g", "<cmd>lua _lazygit_toggle()<CR>", {noremap = true, silent = true})
