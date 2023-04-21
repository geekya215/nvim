local config = {}

function config.catppuccin()
  require("catppuccin").setup {
    flavour = "mocha", -- latte, frappe, macchiato, mocha
    term_colors = true,
    transparent_background = false,
    no_italic = false,
    no_bold = false,
    styles = {
      comments = {},
      conditionals = {},
      loops = {},
      functions = {},
      keywords = {},
      strings = {},
      variables = {},
      numbers = {},
      booleans = {},
      properties = {},
      types = {},
    },
    color_overrides = {
      mocha = {
        base = "#000000",
        mantle = "#000000",
        crust = "#000000",
      },
    },
    highlight_overrides = {
      mocha = function(C)
        return {
          TabLineSel = { bg = C.pink },
          CmpBorder = { fg = C.surface2 },
          Pmenu = { bg = C.none },
          TelescopeBorder = { link = "FloatBorder" },
        }
      end,
    },
  }

  vim.cmd.colorscheme("catppuccin")
end

function config.lualine()
  local navic = require("nvim-navic")
  require("lualine").setup {
    options = {
      icons_enabled = true,
      theme = "auto",
      component_separators = { left = "", right = "" },
      section_separators = { left = "", right = "" },
      disabled_filetypes = {},
      always_divide_middle = true,
      globalstatus = false,
    },
    sections = {
      lualine_a = { "mode" },
      lualine_b = { "branch", "diff" },
      lualine_c = {
        {
          function()
            return navic.get_location()
          end,
          cond = function()
            return navic.is_available()
          end,
        },
      },
      lualine_x = { "diagnostics", "encoding", "filetype" },
      lualine_y = { "filename" },
      lualine_z = { "progress", "location" },
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
    extensions = {},
  }
end

function config.nvim_navic()
  require("nvim-navic").setup {
    highlight = true,
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
      "checkhealth",
      "help",
      "man",
    },
    buftype_exclude = { "terminal", "nofile" },
  }
end

return config
