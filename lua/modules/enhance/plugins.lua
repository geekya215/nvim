local plugin = require("core.pack").register_plugin
local conf = require("modules.enhance.config")


plugin {"nvim-treesitter/nvim-treesitter",
  opt = true,
  event = "BufRead",
  run = ":TSUpdate",
  config = conf.nvim_treesitter,
}

plugin {"nvim-treesitter/nvim-treesitter-textobjects",
  after = "nvim-treesitter",
}

plugin{'numToStr/Comment.nvim',
  config = conf.comment,
}
