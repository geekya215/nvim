local package = require("core.pack").package
local conf = require("modules.enhance.config")

package {
  "nvim-treesitter/nvim-treesitter",
  event = "BufRead",
  run = ":TSUpdate",
  config = conf.nvim_treesitter,
  dependencies = {
    "nvim-treesitter/nvim-treesitter-textobjects",
  },
}

package {
  "kylechui/nvim-surround",
  version = "*",
  event = "VeryLazy",
  config = conf.nvim_surround,
}

package {
  "numToStr/Comment.nvim",
  event = { "CursorHold", "CursorHoldI" },
  config = conf.comment,
}

package {
  "glepnir/lspsaga.nvim",
  event = "LspAttach",
  config = conf.lspsaga,
  dependencies = { "nvim-tree/nvim-web-devicons" }
}
