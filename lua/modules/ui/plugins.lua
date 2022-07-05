local plugin = require("core.pack").register_plugin
local conf = require("modules.ui.config")

plugin {"rebelot/kanagawa.nvim",
  config = conf.kanagawa,
}

plugin {"akinsho/bufferline.nvim",
  tag = "v2.*",
  requires = "kyazdani42/nvim-web-devicons",
  config = conf.bufferline,
}

plugin {"lukas-reineke/indent-blankline.nvim",
  config = conf.indent_blankline,
}

plugin {"nvim-lualine/lualine.nvim",
  config = conf.lualine,
}

plugin {"SmiteshP/nvim-navic",
  requires = "neovim/nvim-lspconfig",
  config = conf.nvim_navic,
}
