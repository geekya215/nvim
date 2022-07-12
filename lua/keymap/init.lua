require("keymap.config")
local key = require("core.keymap")
local nmap = key.nmap
local silent, noremap = key.silent, key.noremap
local opts = key.new_opts
local cmd = key.cmd

function _G.set_terminal_keymaps()
  local opts = { noremap = true }
  vim.api.nvim_buf_set_keymap(0, "t", "<esc>", [[<C-\><C-n>]], opts)
  vim.api.nvim_buf_set_keymap(0, "t", "<C-h>", [[<C-\><C-n><C-W>h]], opts)
  vim.api.nvim_buf_set_keymap(0, "t", "<C-j>", [[<C-\><C-n><C-W>j]], opts)
  vim.api.nvim_buf_set_keymap(0, "t", "<C-k>", [[<C-\><C-n><C-W>k]], opts)
  vim.api.nvim_buf_set_keymap(0, "t", "<C-l>", [[<C-\><C-n><C-W>l]], opts)
end

-- if you only want these mappings for toggle term use term://*toggleterm#* instead
vim.cmd("autocmd! TermOpen term://*toggleterm#* lua set_terminal_keymaps()")

local Terminal = require("toggleterm.terminal").Terminal
local lazygit = Terminal:new { cmd = "lazygit", hidden = true, direction = "float" }

function _lazygit_toggle()
  lazygit:toggle()
end

nmap {
  -- packer
  { "<leader>pu", cmd("PackerUpdate"), opts(noremap, silent) },
  { "<leader>pi", cmd("PackerInstall"), opts(noremap, silent) },
  { "<leader>pc", cmd("PackerCompile"), opts(noremap, silent) },

  -- nvimtree
  { "<leader>e", cmd("NvimTreeToggle"), opts(noremap, silent) },

  -- bufferline
  { "<leader>j", cmd("BufferLineCyclePrev"), opts(noremap, silent) },
  { "<leader>k", cmd("BufferLineCycleNext"), opts(noremap, silent) },
  { "<leader>q", cmd("bp<bar>bd!#<CR>"), opts(noremap, silent) },

  -- telescope
  { "<leader>ff", cmd("Telescope find_files"), opts(noremap, silent) },

  { "<leader>g", cmd("lua _lazygit_toggle()<cr>"), opts(noremap, silent) },
}
