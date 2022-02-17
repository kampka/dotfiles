local M = {}

M.setup = function()
  local lsp_config = require("lspconfig")

  lsp_config.yamlls.setup({})
end

return M
