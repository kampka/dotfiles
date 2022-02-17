local M = {}

M.setup = function()
  local lsp_config = require("lspconfig")

  lsp_config.tsserver.setup({})
end

return M
