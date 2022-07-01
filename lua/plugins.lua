local fn = vim.fn
local install_path = fn.stdpath("data").."/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
  packer_bootstrap = fn.system({"git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path})
  print "Installing packer close and reopen Neovim..."
  vim.cmd [[packadd packer.nvim]]
end

-- Automatically reload neovim whenever plugins.lua is updated 
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]])

-- Do not display error messages when first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
  return
end

-- Have packer use a popup window
packer.init {
  display = {
    open_fn = function()
      return require("packer.util").float { border = "rounded" }
    end,
  },
}

return require("packer").startup(function(use)
  -- Packer can manage itself
  use "wbthomason/packer.nvim"
  use "nvim-lua/popup.nvim"
  use "nvim-lua/plenary.nvim"
  use {
    "kyazdani42/nvim-web-devicons",
    opt = false,
  }

  use {
    "neovim/nvim-lspconfig",
    opt = true,
    event = "BufReadPre",
    config = function()
      require("lsp.setup")
    end,
  }

  use {
    "hrsh7th/nvim-cmp",
    requires = {
      {'hrsh7th/cmp-nvim-lsp', after = 'nvim-lspconfig' },
      {'hrsh7th/cmp-path' , after = 'nvim-cmp'},
      {'hrsh7th/cmp-buffer', after = 'nvim-cmp' },
      {'saadparwaiz1/cmp_luasnip', after = "LuaSnip" },
    },
    event = "InsertEnter",
    config = function()
      require("lsp.cmp")
    end,
  }

  use {
    "L3MON4D3/LuaSnip",
    event = 'InsertCharPre',
    config = function()
      require("luasnip")
    end,
  }

  use {
    "windwp/nvim-autopairs",
    after = "nvim-cmp",
    config = function()
      require("config.nvim-autopairs")
    end,
  }

  use {
    "onsails/lspkind-nvim",
  }

  use {
    "ray-x/lsp_signature.nvim",
    opt = true,
    after = "nvim-lspconfig",
    config = function()
      require("config.lsp_signature")
    end,
  }

  use {
    "stevearc/aerial.nvim",
    opt = true,
    after = "nvim-lspconfig",
    config = function()
      require("config.aerial")
    end
  }

  use {
    "folke/trouble.nvim",
    requires = "kyazdani42/nvim-web-devicons",
    opt = true,
    cmd = {"TroubleToggle"}
  }

  use {
    "nvim-treesitter/nvim-treesitter",
    opt = true,
    run = ":TSUpdate",
    event = "BufRead",
    config = function()
      require("config.treesitter")
    end
  }

  use {
    "nvim-treesitter/nvim-treesitter-textobjects",
    opt = true,
    after = "nvim-treesitter",
  }

  use {
    "nvim-telescope/telescope.nvim",
    requires = "nvim-lua/plenary.nvim",
    opt = true,
    module = "telescope",
    cmd = { "Telescope" },
  }

  use {
    "SmiteshP/nvim-gps",
    opt = true,
    after = "nvim-treesitter",
    config = function()
      require("config.nvim-gps")
    end
  }

  use {
    "kyazdani42/nvim-tree.lua",
    opt = true,
    cmd = { "NvimTreeToggle" },
    config = function()
      require("config.nvim-tree")
    end
  }

  use {
    "lukas-reineke/indent-blankline.nvim",
    opt = true,
    event = "BufRead",
    config = function()
      require("config.indent-blankline")
    end
  }

  use {
    "akinsho/bufferline.nvim",
    tag = "v2.*",
    event = "BufRead",
    config = function()
      require("config.bufferline")
    end
  }

  use {
    "rebelot/kanagawa.nvim",
    config = function()
      require("config.kanagawa")
    end
  }

  use {
    "nvim-lualine/lualine.nvim",
    opt = true,
    after = "nvim-gps",
    config = function()
      require("config.lualine")
    end
  }

  use {
    "lewis6991/gitsigns.nvim",
    tag = "release", -- To use the latest release
    opt = true,
    event = { "BufRead", "BufNewFile" },
    config = function()
      require("config.gitsigns")
    end
  }

  use {
    "sindrets/diffview.nvim",
    opt = true,
    cmd = { "DiffviewOpen" },
  }

  use {
    "akinsho/toggleterm.nvim",
    tag = "v1.*",
    opt = true,
    -- event = "BufRead",
    config = function()
      require("config.toggleterm")
    end
  }

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if packer_bootstrap then
    require("packer").sync()
  end
end)
