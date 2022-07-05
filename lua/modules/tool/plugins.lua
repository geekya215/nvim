local plugin = require("core.pack").register_plugin
local conf = require("modules.tool.config")

plugin {"kyazdani42/nvim-tree.lua",
  cmd = "NvimTreeToggle",
  requires = "kyazdani42/nvim-web-devicons",
  config = conf.nvim_tree,
}

plugin {"lewis6991/gitsigns.nvim",
  tag = "release",
  requires = "nvim-lua/plenary.nvim",
  config = conf.gitsigns,
}

plugin {"sindrets/diffview.nvim",
  cmd = { "DiffviewOpen" },
}

plugin {"akinsho/toggleterm.nvim",
  tag = "v1.*",
  config = conf.toggleterm,
}

plugin {"stevearc/aerial.nvim",
  config = conf.aerial,
}

plugin {"folke/trouble.nvim",
  requires = "kyazdani42/nvim-web-devicons",
  cmd = { "TroubleToggle" },
}

plugin {"nvim-telescope/telescope.nvim",
  requires = "nvim-lua/plenary.nvim",
  module = "telescope",
  cmd = { "Telescope" },
}
