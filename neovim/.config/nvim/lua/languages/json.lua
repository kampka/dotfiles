local M = {}

M.setup = function()
  local lsp_config = require("lspconfig")

  lsp_config.jsonls.setup({})
end

return M
