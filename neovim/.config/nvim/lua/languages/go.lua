local M = {}

M.setup = function()
  local lsp_config = require("lspconfig")

  lsp_config.gopls.setup({
   cmd = { "gopls", "serve" },
    settings = {
      gopls = { analyses = { unusedparams = true }, staticcheck = true },
    },
  })
end

return M
