local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true
capabilities.textDocument.completion.completionItem.resolveSupport = {
  properties = {
    'documentation',
    'detail',
    'additionalTextEdits',
  }
}

vim.g.vsnip_snippet_dir = os.getenv('HOME') .. '/.config/nvim/snippets'

require("lsp.compe")
require('lspconfig').tsserver.setup{
  capabilities = capabilities,
}
require("lsp.config")
