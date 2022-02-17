local M = {}

M.setup = function()
  local lsp_config = require("lspconfig")

  lsp_config.html.setup({})
end

return M
