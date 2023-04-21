local package = require("core.pack").package
local conf = require("modules.ui.config")

package { 
  "catppuccin/nvim",
  name = "catppuccin",
  config = conf.catppuccin
}

package {
  "nvim-lualine/lualine.nvim",
  config = conf.lualine
}

package {
  "SmiteshP/nvim-navic",
  dependencies = "neovim/nvim-lspconfig",
  config = conf.navic,
}

package {
  "lukas-reineke/indent-blankline.nvim",
  event = "BufRead",
  config = conf.indent_blankline,
}
