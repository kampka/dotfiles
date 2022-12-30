-- leap is a fast motion plugin, meaning it makes it possible to quickly
-- navigate to positions in the buffer / window area

local M = {}

M.setup = function(use)
  use({ 
    'ggandor/leap.nvim',
    config = function()
      require('leap').add_default_mappings()
    end
  })
end

return M
