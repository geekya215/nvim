local plugin = require("core.pack").register_plugin
local conf = require("modules.ui.config")

plugin {"rebelot/kanagawa.nvim",
  config = conf.kanagawa,
}

plugin {"akinsho/bufferline.nvim",
  tag = "v2.*",
  opt = true,
  event = "BufRead",
  requires = "kyazdani42/nvim-web-devicons",
  config = conf.bufferline,
}

plugin {"lukas-reineke/indent-blankline.nvim",
  opt = true,
  event = "BufRead",
  config = conf.indent_blankline,
}

plugin {"nvim-lualine/lualine.nvim",
  opt = true,
  after = "nvim-navic",
  config = conf.lualine,
}

plugin {"SmiteshP/nvim-navic",
  opt = true,
  after = "nvim-treesitter",
  requires = "neovim/nvim-lspconfig",
  config = conf.nvim_navic,
}
