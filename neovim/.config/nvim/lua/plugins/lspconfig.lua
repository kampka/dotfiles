local M = {}

M.setup = function(use)
  use({ 
    'neovim/nvim-lspconfig',
    config = function()
      local map = require('..functions').map

      map("n", "gD", [[<cmd>lua vim.lsp.buf.definition()<CR>]])
      map("n", "K", [[<cmd>lua vim.lsp.buf.hover()<CR>]])
      map("n", "<leader>sh", [[<cmd>lua vim.lsp.buf.signature_help()<CR>]])
      map("n", "gi", [[<cmd>lua vim.lsp.buf.implementation()<CR>]])
      map("n", "gr", [[<cmd>lua vim.lsp.buf.references()<CR>]])
      map("n", "<leader>rn", [[<cmd>lua vim.lsp.buf.rename()<CR>]])
      map("n", "<leader>ca", [[<cmd>lua vim.lsp.buf.code_action()<CR>]])
      map("n", "<leader>d", [[<cmd>lua vim.diagnostic.setloclist()<CR>]]) -- buffer diagnostics only
      map("n", "<leader>nd", [[<cmd>lua vim.diagnostic.goto_next()<CR>]])
      map("n", "<leader>pd", [[<cmd>lua vim.diagnostic.goto_prev()<CR>]])
      map("n", "<leader>ld", [[<cmd>lua vim.diagnostic.open_float(0, {scope = "line"})<CR>]])
      map("n", "<leader>cl", [[<cmd>lua vim.lsp.codelens.run()<CR>]])
      map("n", "<leader>o", [[<cmd>lua vim.lsp.buf.formatting()<CR>]])
    end
  })
end

return M
