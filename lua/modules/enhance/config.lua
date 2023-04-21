local config = {}

function config.nvim_treesitter()
  require("nvim-treesitter.configs").setup {
    ensure_installed = { "go", "rust" },

    sync_install = false,

    auto_install = true,

    ignore_install = {},

    highlight = {
      enable = true,
      disable = {},

      additional_vim_regex_highlighting = false,
    },
    textobjects = {
      select = {
        enable = true,

        lookahead = true,

        keymaps = {
          ["af"] = "@function.outer",
          ["if"] = "@function.inner",
          ["ac"] = "@class.outer",
          ["ic"] = { query = "@class.inner", desc = "Select inner part of a class region" },
          ["as"] = { query = "@scope", query_group = "locals", desc = "Select language scope" },
        },
        selection_modes = {
          ["@parameter.outer"] = "v", -- charwise
          ["@function.outer"] = "V", -- linewise
          ["@class.outer"] = "<c-v>", -- blockwise
        },
        include_surrounding_whitespace = true,
      },
    },
  }
end

function config.nvim_surround()
  require("nvim-surround").setup {}
end

function config.comment()
  require("Comment").setup {}
end

function config.lspsaga()
  require("lspsaga").setup {
    symbol_in_winbar = {
      enable = true,
      separator = " > ",
      ignore_patterns={},
      hide_keyword = true,
      show_file = true,
      folder_level = 2,
      respect_root = false,
      color_mode = true,
    },
  }
end

return config
