local M = {}

M.setup = function(use)
  use({
    'folke/trouble.nvim', 
    config = function()
      trouble = require('trouble')
      trouble.setup()

      local map = require('..functions').map
      map("n", "<leader>tn", [[<cmd>lua require("trouble").next({skip_groups = true, jump = true})<CR>]])
      map("n", "<leader>tp", [[<cmd>lua require("trouble").previous({skip_groups = true, jump = true})<CR>]])

    end
  })
end

return M
