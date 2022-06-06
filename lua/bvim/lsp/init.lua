local status_ok, _ = pcall(require, "lspconfig")
if not status_ok then
  return
end

require("bvim.lsp.lsp-installer")
require("bvim.lsp.handlers")
