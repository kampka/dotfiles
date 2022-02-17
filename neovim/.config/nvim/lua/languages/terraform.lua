local M = {}

M.setup = function()
  local lsp_config = require("lspconfig")

  lsp_config.terraformls.setup({})
end

return M
