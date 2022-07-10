local plugin = require("core.pack").register_plugin
local conf = require("modules.completion.config")

plugin {"williamboman/nvim-lsp-installer",
  opt = false,
  config = conf.nvim_lsp_installer,
}

plugin {"neovim/nvim-lspconfig",
  opt = true,
  event = "BufReadPre",
  config = conf.nvim_lsp,
}

plugin {"hrsh7th/nvim-cmp",
  event = "InsertEnter",
  requires = {
    { "hrsh7th/cmp-nvim-lsp", after = "nvim-lspconfig" },
    { "hrsh7th/cmp-path" , after = "nvim-cmp" },
    { "hrsh7th/cmp-buffer", after = "nvim-cmp" },
    { "saadparwaiz1/cmp_luasnip", after = "LuaSnip" },
  },
  config = conf.nvim_cmp,
}

plugin {"L3MON4D3/LuaSnip",
  event = "InsertCharPre",
  config = conf.lua_snip,
}

plugin {"windwp/nvim-autopairs",
  after = "nvim-cmp",
  config = conf.nvim_autopairs,
}

plugin {"ray-x/lsp_signature.nvim",
  opt = true,
  after = "nvim-lspconfig",
  config = conf.lsp_signature,
}
