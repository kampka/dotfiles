-- lightspeed is a fast motion plugin, meaning it makes it possible to quickly
-- navigate to positions in the buffer / window area

local M = {}

M.setup = function(use)
  use({ 
    'ggandor/lightspeed.nvim',
    config = function()
      require('lightspeed').setup({})
    end
  })
end

return M
