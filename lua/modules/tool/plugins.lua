local plugin = require("core.pack").register_plugin
local conf = require("modules.tool.config")

plugin{"nvim-lua/plenary.nvim",
  opt = false,
}

plugin {"kyazdani42/nvim-tree.lua",
  cmd = { "NvimTreeToggle" },
  requires = "kyazdani42/nvim-web-devicons",
  config = conf.nvim_tree,
}

plugin {"lewis6991/gitsigns.nvim",
  opt = true,
  event = { "BufRead", "BufNewFile" },
  tag = "release",
  requires = "nvim-lua/plenary.nvim",
  config = conf.gitsigns,
}

plugin {"sindrets/diffview.nvim",
  opt = true,
  cmd = { "DiffviewOpen" },
}

plugin {"akinsho/toggleterm.nvim",
  tag = "v1.*",
  config = conf.toggleterm,
}

plugin {"stevearc/aerial.nvim",
  opt = true,
  after = "nvim-lspconfig",
  config = conf.aerial,
}

plugin {"folke/trouble.nvim",
  opt = true,
	cmd = { "Trouble", "TroubleToggle", "TroubleRefresh" },
  requires = "kyazdani42/nvim-web-devicons",
}

plugin {"nvim-telescope/telescope.nvim",
  opt = true,
  cmd = { "Telescope" },
  module = "telescope",
  requires = "nvim-lua/plenary.nvim",
}
