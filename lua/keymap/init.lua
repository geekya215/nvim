local keymap = require("core.keymap")
local nmap, imap, cmap, xmap = keymap.nmap, keymap.imap, keymap.cmap, keymap.xmap
local silent, noremap = keymap.silent, keymap.noremap
local opts = keymap.new_opts
local cmd = keymap.cmd

-- Use space as leader key
vim.g.mapleader = " "

-- leaderkey
nmap { " ", "", opts(noremap) }
xmap { " ", "", opts(noremap) }

-- usage example
nmap {
  -- noremal remap
  -- close buffer
  { "<C-x>k", cmd("bdelete"), opts(noremap, silent) },
  -- save
  { "<C-s>", cmd("write"), opts(noremap) },
  -- yank
  { "Y", "y$", opts(noremap) },
  -- buffer jump
  { "]b", cmd("bn"), opts(noremap) },
  { "[b", cmd("bp"), opts(noremap) },
  -- remove trailing white space
  { "<Leader>t", cmd("TrimTrailingWhitespace"), opts(noremap) },
  -- window jump
  { "<C-h>", "<C-w>h", opts(noremap) },
  { "<C-l>", "<C-w>l", opts(noremap) },
  { "<C-j>", "<C-w>j", opts(noremap) },
  { "<C-k>", "<C-w>k", opts(noremap) },
  { "J", "5j", opts(noremap) },
  { "K", "5k", opts(noremap) },
}

imap {
  -- insert mode
  { "<C-h>", "<Bs>", opts(noremap) },
  { "<C-e>", "<End>", opts(noremap) },
}

-- commandline remap
cmap { "<C-b>", "<Left>", opts(noremap) }
-- usage of plugins
nmap {
  -- plugin manager: Lazy.nvim
  { "<Leader>pu", cmd("Lazy update"), opts(noremap, silent) },
  { "<Leader>pi", cmd("Lazy install"), opts(noremap, silent) },

  -- Telescope
  { "<Leader>b", cmd("Telescope buffers"), opts(noremap, silent) },
  { "<Leader>fa", cmd("Telescope live_grep"), opts(noremap, silent) },
  { "<Leader>ff", cmd("Telescope find_files"), opts(noremap, silent) },

  -- NvimTree
  { "<Leader>e", cmd("NvimTreeToggle"), opts(noremap, silent) },

  -- FlyBuf
  { "<Leader>w", cmd("FlyBuf"), opts(noremap, silent) },
  
}

local keymap = vim.keymap.set

-- LSP finder - Find the symbol's definition
-- If there is no definition, it will instead be hidden
-- When you use an action in finder like "open vsplit",
-- you can use <C-t> to jump back
keymap("n", "gh", "<cmd>Lspsaga lsp_finder<CR>")

-- Code action
keymap({"n","v"}, "<leader>ca", "<cmd>Lspsaga code_action<CR>")

-- Rename all occurrences of the hovered word for the entire file
keymap("n", "gr", "<cmd>Lspsaga rename<CR>")

-- Rename all occurrences of the hovered word for the selected files
keymap("n", "gr", "<cmd>Lspsaga rename ++project<CR>")

-- Peek definition
-- You can edit the file containing the definition in the floating window
-- It also supports open/vsplit/etc operations, do refer to "definition_action_keys"
-- It also supports tagstack
-- Use <C-t> to jump back
keymap("n", "gp", "<cmd>Lspsaga peek_definition<CR>")

-- Go to definition
keymap("n","gd", "<cmd>Lspsaga goto_definition<CR>")

-- Peek type definition
-- You can edit the file containing the type definition in the floating window
-- It also supports open/vsplit/etc operations, do refer to "definition_action_keys"
-- It also supports tagstack
-- Use <C-t> to jump back
keymap("n", "gt", "<cmd>Lspsaga peek_type_definition<CR>")

-- Go to type definition
keymap("n","gt", "<cmd>Lspsaga goto_type_definition<CR>")


-- Show line diagnostics
-- You can pass argument ++unfocus to
-- unfocus the show_line_diagnostics floating window
keymap("n", "<leader>sl", "<cmd>Lspsaga show_line_diagnostics<CR>")

-- Show buffer diagnostics
keymap("n", "<leader>sb", "<cmd>Lspsaga show_buf_diagnostics<CR>")

-- Show workspace diagnostics
keymap("n", "<leader>sw", "<cmd>Lspsaga show_workspace_diagnostics<CR>")

-- Show cursor diagnostics
keymap("n", "<leader>sc", "<cmd>Lspsaga show_cursor_diagnostics<CR>")

-- Diagnostic jump
-- You can use <C-o> to jump back to your previous location
keymap("n", "[e", "<cmd>Lspsaga diagnostic_jump_prev<CR>")
keymap("n", "]e", "<cmd>Lspsaga diagnostic_jump_next<CR>")

-- Diagnostic jump with filters such as only jumping to an error
keymap("n", "[E", function()
  require("lspsaga.diagnostic"):goto_prev({ severity = vim.diagnostic.severity.ERROR })
end)
keymap("n", "]E", function()
  require("lspsaga.diagnostic"):goto_next({ severity = vim.diagnostic.severity.ERROR })
end)

-- Toggle outline
keymap("n","<leader>o", "<cmd>Lspsaga outline<CR>")

-- Hover Doc
-- If there is no hover doc,
-- there will be a notification stating that
-- there is no information available.
-- To disable it just use ":Lspsaga hover_doc ++quiet"
-- Pressing the key twice will enter the hover window
keymap("n", "K", "<cmd>Lspsaga hover_doc<CR>")

-- If you want to keep the hover window in the top right hand corner,
-- you can pass the ++keep argument
-- Note that if you use hover with ++keep, pressing this key again will
-- close the hover window. If you want to jump to the hover window
-- you should use the wincmd command "<C-w>w"
keymap("n", "K", "<cmd>Lspsaga hover_doc ++keep<CR>")

-- Call hierarchy
keymap("n", "<Leader>ci", "<cmd>Lspsaga incoming_calls<CR>")
keymap("n", "<Leader>co", "<cmd>Lspsaga outgoing_calls<CR>")

-- Floating terminal
keymap({"n", "t"}, "<A-d>", "<cmd>Lspsaga term_toggle<CR>")
