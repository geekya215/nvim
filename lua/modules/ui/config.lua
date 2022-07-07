local config = {}

function config.kanagawa()
  require("kanagawa").setup {
    undercurl = true, -- enable undercurls
    commentStyle = { italic = true },
    functionStyle = {},
    keywordStyle = { italic = true },
    statementStyle = { bold = true },
    typeStyle = {},
    variablebuiltinStyle = { italic = true },
    specialReturn = true, -- special highlight for the return keyword
    specialException = true, -- special highlight for exception handling keywords
    transparent = false, -- do not set background color
    dimInactive = false, -- dim inactive window `:h hl-NormalNC`
    globalStatus = false, -- adjust window separators highlight for laststatus=3
    colors = {},
    overrides = {},
  }

  vim.cmd("colorscheme kanagawa")
end

function config.bufferline()
  require("bufferline").setup {
    options = {
      mode = "buffers",
      numbers = "none",
      close_command = "bdelete! %d", -- can be a string | function, see "Mouse actions"
      right_mouse_command = "bdelete! %d", -- can be a string | function, see "Mouse actions"
      left_mouse_command = "buffer %d", -- can be a string | function, see "Mouse actions"
      middle_mouse_command = nil, -- can be a string | function, see "Mouse actions"
      -- NOTE: this plugin is designed with this icon in mind,
      -- and so changing this is NOT recommended, this is intended
      -- as an escape hatch for people who cannot bear it for whatever reason
      indicator_icon = "▎",
      buffer_close_icon = "",
      modified_icon = "●",
      close_icon = "",
      left_trunc_marker = "",
      right_trunc_marker = "",
      max_name_length = 18,
      max_prefix_length = 15, -- prefix used when a buffer is de-duplicated
      tab_size = 18,
      diagnostics = "nvim_lsp",
      diagnostics_update_in_insert = false,
      diagnostics_indicator = function(count, level, diagnostics_dict, context)
        return "(" .. count .. ")"
      end,
      offsets = { { filetype = "NvimTree", text = "File Explorer", text_align = "center" } },
      color_icons = true,
      show_buffer_icons = true,
      show_buffer_close_icons = true,
      show_buffer_default_icon = true,
      show_close_icon = false,
      show_tab_indicators = true,
      persist_buffer_sort = true, -- whether or not custom sorted buffers should persist
      -- can also be a table containing 2 custom separators
      -- [focused and unfocused]. eg: { "|", "|" }
      separator_style = "thin",
      enforce_regular_tabs = false,
      always_show_bufferline = true,
      sort_by = "insert_after_current",
    },
  }
end

function config.indent_blankline()
  require("indent_blankline").setup {
    use_treesitter = true,
    space_char_blankline = " ",
    show_current_context = true,
    show_current_context_start = false,
    filetype_exclude = {
      "lspinfo",
      "packer",
      "checkhealth",
      "help",
      "man",
      "",
    },
    buftype_exclude = { "terminal", "nofile" },
  }
end

function config.lualine()
  local navic = require("nvim-navic")

  require("lualine").setup {
    options = {
      icons_enabled = true,
      theme = "auto",
      component_separators = { left = "", right = "" },
      section_separators = { left = "", right = "" },
      disabled_filetypes = { "DiffviewFiles", "Trouble", "packer" },
      always_divide_middle = true,
      globalstatus = false,
    },
    sections = {
      lualine_a = { "mode" },
      lualine_b = { "branch", "diff" },
      lualine_c = {
        {
          navic.get_location,
          cond = navic.is_available,
          padding = { left = 1, right = 0 },
        },
      },
      lualine_x = { "diagnostics", "encoding", "filetype" },
      lualine_y = { "progress" },
      lualine_z = { "location" },
    },
    inactive_sections = {
      lualine_a = {},
      lualine_b = {},
      lualine_c = { "filename" },
      lualine_x = { "location" },
      lualine_y = {},
      lualine_z = {},
    },
    tabline = {},
    extensions = { "aerial", "nvim-tree", "toggleterm" },
  }
end

function config.nvim_navic()
  local set_hl = vim.api.nvim_set_hl
  -- stylua: ignore start
  set_hl(0, "NavicIconsFile",          {default = true, bg = "#2A2A37", fg = "#ffffff"})
  set_hl(0, "NavicIconsModule",        {default = true, bg = "#2A2A37", fg = "#E46876"})
  set_hl(0, "NavicIconsNamespace",     {default = true, bg = "#2A2A37", fg = "#E46876"})
  set_hl(0, "NavicIconsPackage",       {default = true, bg = "#2A2A37", fg = "#E46876"})
  set_hl(0, "NavicIconsClass",         {default = true, bg = "#2A2A37", fg = "#7AA89F"})
  set_hl(0, "NavicIconsMethod",        {default = true, bg = "#2A2A37", fg = "#7E9CD8"})
  set_hl(0, "NavicIconsProperty",      {default = true, bg = "#2A2A37", fg = "#E6C384"})
  set_hl(0, "NavicIconsField",         {default = true, bg = "#2A2A37", fg = "#E6C384"})
  set_hl(0, "NavicIconsConstructor",   {default = true, bg = "#2A2A37", fg = "#7AA89F"})
  set_hl(0, "NavicIconsEnum",          {default = true, bg = "#2A2A37", fg = "#7AA89F"})
  set_hl(0, "NavicIconsInterface",     {default = true, bg = "#2A2A37", fg = "#7AA89F"})
  set_hl(0, "NavicIconsFunction",      {default = true, bg = "#2A2A37", fg = "#7E9CD8"})
  set_hl(0, "NavicIconsVariable",      {default = true, bg = "#2A2A37", fg = "#957FB8"})
  set_hl(0, "NavicIconsConstant",      {default = true, bg = "#2A2A37", fg = "#FFA066"})
  set_hl(0, "NavicIconsString",        {default = true, bg = "#2A2A37", fg = "#98BB6C"})
  set_hl(0, "NavicIconsNumber",        {default = true, bg = "#2A2A37", fg = "#D27E99"})
  set_hl(0, "NavicIconsBoolean",       {default = true, bg = "#2A2A37", fg = "#FFA066"})
  set_hl(0, "NavicIconsArray",         {default = true, bg = "#2A2A37", fg = "#7AA89F"})
  set_hl(0, "NavicIconsObject",        {default = true, bg = "#2A2A37", fg = "#7AA89F"})
  set_hl(0, "NavicIconsKey",           {default = true, bg = "#2A2A37", fg = "#7AA89F"})
  set_hl(0, "NavicIconsNull",          {default = true, bg = "#2A2A37", fg = "#957FB8"})
  set_hl(0, "NavicIconsEnumMember",    {default = true, bg = "#2A2A37", fg = "#957FB8"})
  set_hl(0, "NavicIconsStruct",        {default = true, bg = "#2A2A37", fg = "#7AA89F"})
  set_hl(0, "NavicIconsEvent",         {default = true, bg = "#2A2A37", fg = "#7AA89F"})
  set_hl(0, "NavicIconsOperator",      {default = true, bg = "#2A2A37", fg = "#C0A36E"})
  set_hl(0, "NavicIconsTypeParameter", {default = true, bg = "#2A2A37", fg = "#7AA89F"})
  set_hl(0, "NavicText",               {default = true, bg = "#2A2A37", fg = "#C8C093"})
  set_hl(0, "NavicSeparator",          {default = true, bg = "#2A2A37", fg = "#C8C093"})
  -- stylua: ignore end

  require("nvim-navic").setup {
    highlight = true,
  }
end

return config
