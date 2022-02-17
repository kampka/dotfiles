local M = {}

M.setup = function()
  local lsp_config = require("lspconfig")

  lsp_config.dockerls.setup({})
end

return M
