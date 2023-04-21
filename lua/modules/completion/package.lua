local package = require("core.pack").package

local conf = require("modules.completion.config")

package {
  "williamboman/mason.nvim",
  build = ":MasonUpdate",
  config = conf.mason,
}

package {
  "neovim/nvim-lspconfig",
  config = conf.nvim_lspconfig,
}

package {
  "hrsh7th/nvim-cmp",
  event = "InsertEnter",
  config = conf.nvim_cmp,
  dependencies = {
    { "hrsh7th/cmp-nvim-lsp" },
    { "hrsh7th/cmp-path" },
    { "hrsh7th/cmp-buffer" },
    { "saadparwaiz1/cmp_luasnip" },
  },
}

package {
  "L3MON4D3/LuaSnip",
  event = "InsertCharPre",
  config = conf.lua_snip
}

package {
  "windwp/nvim-autopairs",
  config = conf.nvim_autopairs
}

package {
  "ray-x/lsp_signature.nvim",
  config = conf.lsp_signature
}
