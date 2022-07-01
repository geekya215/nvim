require("nvim-autopairs").setup {
}
-- If you want insert `(` after select function or method item
local cmp_autopairs = require("nvim-autopairs.completion.cmp")
local handlers = require("nvim-autopairs.completion.handlers")
local cmp = require("cmp")

cmp.event:on(
  "confirm_done",
  cmp_autopairs.on_confirm_done({
    filetypes = {
      -- "*" is a alias to all filetypes
      ["*"] = {
        ["("] = {
          kind = {
            cmp.lsp.CompletionItemKind.Function,
            cmp.lsp.CompletionItemKind.Method,
          },
          handler = handlers["*"]
        }
      },
      -- Disable for tex
      tex = false
    }
  })
)
