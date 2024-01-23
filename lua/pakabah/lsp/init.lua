local status_ok, _ = pcall(require, "lspconfig")
if not status_ok then
  return
end

require "pakabah.lsp.mason"
require("pakabah.lsp.handlers").setup()
require "pakabah.lsp.null-ls"
