local config = {}

function config.nvim_lsp_installer()
  require("nvim-lsp-installer").setup {
  }
end

function config.nvim_lsp()
  vim.cmd([[packadd cmp-nvim-lsp]])
  local lspconfig = require("lspconfig")
  local util = require("lspconfig/util")
  local navic = require("nvim-navic")

  -- Mappings.
  -- See `:help vim.diagnostic.*` for documentation on any of the below functions
  local opts = { noremap=true, silent=true }
  vim.keymap.set("n", ",e", vim.diagnostic.open_float, opts)
  vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, opts)
  vim.keymap.set("n", "]d", vim.diagnostic.goto_next, opts)
  vim.keymap.set("n", ",q", vim.diagnostic.setloclist, opts)

  -- Use an on_attach function to only map the following keys
  -- after the language server attaches to the current buffer
  local on_attach = function(client, bufnr)
    -- Enable completion triggered by <c-x><c-o>
    vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")

    -- Mappings.
    -- See `:help vim.lsp.*` for documentation on any of the below functions
    local bufopts = { noremap=true, silent=true, buffer=bufnr }
    vim.keymap.set("n", "gD", vim.lsp.buf.declaration, bufopts)
    vim.keymap.set("n", "gd", vim.lsp.buf.definition, bufopts)
    vim.keymap.set("n", "K", vim.lsp.buf.hover, bufopts)
    vim.keymap.set("n", "gi", vim.lsp.buf.implementation, bufopts)
    -- vim.keymap.set("n", "<C-k>", vim.lsp.buf.signature_help, bufopts)
    vim.keymap.set("n", ",wa", vim.lsp.buf.add_workspace_folder, bufopts)
    vim.keymap.set("n", ",wr", vim.lsp.buf.remove_workspace_folder, bufopts)
    vim.keymap.set("n", ",wl", function()
      print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
    end, bufopts)
    vim.keymap.set("n", ",D", vim.lsp.buf.type_definition, bufopts)
    vim.keymap.set("n", ",rn", vim.lsp.buf.rename, bufopts)
    vim.keymap.set("n", ",ca", vim.lsp.buf.code_action, bufopts)
    vim.keymap.set("n", "gr", vim.lsp.buf.references, bufopts)
    vim.keymap.set("n", ",f", vim.lsp.buf.formatting, bufopts)
    navic.attach(client, bufnr)
  end

  -- Add additional capabilities supported by nvim-cmp
  local capabilities = vim.lsp.protocol.make_client_capabilities()
  capabilities = require("cmp_nvim_lsp").update_capabilities(capabilities)

  local lsp_flags = {
    -- This is the default in Nvim 0.7+
    debounce_text_changes = 150,
  }

  lspconfig.gopls.setup {
    on_attach = on_attach,
    capabilities = capabilities,
    lsp_flags = lsp_flags,
    cmd = {"gopls", "serve"},
    filetypes = {"go", "gomod"},
    root_dir = util.root_pattern("go.work", "go.mod", ".git"),
    settings = {
      gopls = {
        analyses = {
          unusedparams = true,
        },
        staticcheck = true,
      },
    },
  }
end

function config.nvim_cmp()
  local cmp = require("cmp")
  cmp.setup {
    snippet = {
      expand = function(args)
        require("luasnip").lsp_expand(args.body)
      end,
    },
    mapping = cmp.mapping.preset.insert({
      ["<C-d>"] = cmp.mapping.scroll_docs(-4),
      ["<C-f>"] = cmp.mapping.scroll_docs(4),
      ["<C-Space>"] = cmp.mapping.complete(),
      ["<CR>"] = cmp.mapping.confirm {
        behavior = cmp.ConfirmBehavior.Replace,
        select = true,
      },
      ["<Tab>"] = cmp.mapping(function(fallback)
        if cmp.visible() then
          cmp.select_next_item()
        elseif require("luasnip").expand_or_jumpable() then
          require("luasnip").expand_or_jump()
        else
          fallback()
        end
      end, { "i", "s" }),
      ["<S-Tab>"] = cmp.mapping(function(fallback)
        if cmp.visible() then
          cmp.select_prev_item()
        elseif require("luasnip").jumpable(-1) then
          require("luasnip").jump(-1)
        else
          fallback()
        end
      end, { "i", "s" }),
    }),

    sources = cmp.config.sources({
      { name = "nvim_lsp" },
      { name = "path"},
      { name = "luasnip" },
    }, {
      { name = "buffer" },
    }),

    formatting = {
      format = require("lspkind").cmp_format({
        mode = "symbol_text", -- show only symbol annotations
        maxwidth = 50, -- prevent the popup from showing more than provided characters (e.g 50 will not show more than 50 characters)
        menu = {
          nvim_lsp = "[LSP]",
          nvim_lua = "[Lua]",
          path = "[Path]",
          buffer = "[Buffer]",
        },
      })
    },

    window = {
      completion = cmp.config.window.bordered(),
      documentation = cmp.config.window.bordered()
    },
  }
end

function config.lua_snip()
  require("luasnip")
end

function config.nvim_autopairs()
  require("nvim-autopairs").setup {}
  -- If you want insert `(` after select function or method item
  local cmp_autopairs = require("nvim-autopairs.completion.cmp")
  local cmp = require("cmp")

  cmp.event:on(
    "confirm_done",
    cmp_autopairs.on_confirm_done()
  )
end

function config.lsp_signature()
  require("lsp_signature").setup {
    bind = true, -- This is mandatory, otherwise border config won't get registered.
    handler_opts = {
      border = "rounded",
    },
    hint_prefix = "",
  }
end

return config
