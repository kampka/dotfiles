local M = {}

M.setup = function()
  local lsp_config = require("lspconfig")

  lsp_config.rnix.setup({})
end

return M
