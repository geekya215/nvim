-- colorizer
require('colorizer').setup()

-- telescope
require('telescope').load_extension('fzy_native')

-- gitsign
require('gitsigns').setup{
  signs = {
    add          = {hl = 'GitSignsAdd'   , text = '+', numhl='GitSignsAddNr'   , linehl='GitSignsAddLn'},
    change       = {hl = 'GitSignsChange', text = '~', numhl='GitSignsChangeNr', linehl='GitSignsChangeLn'},
    delete       = {hl = 'GitSignsDelete', text = '-', numhl='GitSignsDeleteNr', linehl='GitSignsDeleteLn'},
    topdelete    = {hl = 'GitSignsDelete', text = '-', numhl='GitSignsDeleteNr', linehl='GitSignsDeleteLn'},
    changedelete = {hl = 'GitSignsChange', text = '*', numhl='GitSignsChangeNr', linehl='GitSignsChangeLn'},
  },
  keymaps = {
   noremap = true,
   buffer = true,

   ['n ]c'] = { expr = true, "&diff ? ']c' : '<cmd>lua require\"gitsigns\".next_hunk()<CR>'"},
   ['n [c'] = { expr = true, "&diff ? '[c' : '<cmd>lua require\"gitsigns\".prev_hunk()<CR>'"},

   ['n <leader>cp'] = '<cmd>lua require"gitsigns".preview_hunk()<CR>',

   ['o ih'] = ':<C-U>lua require"gitsigns".select_hunk()<CR>',
   ['x ih'] = ':<C-U>lua require"gitsigns".select_hunk()<CR>'
  },
}
