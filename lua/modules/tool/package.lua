local package = require("core.pack").package
local conf = require("modules.tool.config")

package {
  "lewis6991/gitsigns.nvim",
  tag = "release",
  event = { 'BufRead', 'BufNewFile' },
  config = conf.gitsigns,
}

package {
  "nvim-telescope/telescope.nvim",
  cmd = "Telescope",
  config = conf.telescope,
  dependencies = {
    { "nvim-lua/plenary.nvim" },
  },
}

package {
  "kyazdani42/nvim-tree.lua",
  cmd = "NvimTreeToggle",
  config = conf.nvim_tree,
  dependencies = "nvim-tree/nvim-web-devicons",
}

package {
  "glepnir/flybuf.nvim",
  cmd = "FlyBuf",
  config = conf.flybuf,
}
