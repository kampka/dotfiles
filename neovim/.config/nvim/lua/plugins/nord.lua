-- a variant of the Nord theme geared towards better results
-- with neovim, especially features like lsp, treesitter etc.

local M = {}

M.setup = function(use)
  use ({ 
    'shaunsingh/nord.nvim',
    config = function()
      vim.cmd[[colorscheme nord]]
    end
  })
end

return M
