local M = {}

M.setup = function(use)
  use({
    'stevearc/dressing.nvim',
    config = function()
      dressing = require('dressing')
      dressing.setup({

      })
    end
  })
end

return M
