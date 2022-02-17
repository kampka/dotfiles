local M = {}

M.setup = function(use)
  use({
    'takac/vim-hardtime',
    config = function()
      vim.g.hardtime_default_on = 1
    end
  })
end

return M
