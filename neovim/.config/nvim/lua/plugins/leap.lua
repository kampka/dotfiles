-- leap is a fast motion plugin, meaning it makes it possible to quickly
-- navigate to positions in the buffer / window area

local M = {
  'ggandor/leap.nvim',
  lazy = false,
--  event = "VeryLazy",

  dependencies = {
    { "ggandor/flit.nvim", config = { labeled_modes = "nv" } },
  },

  config = function()
    require("leap").add_default_mappings()
  end,
}

return M
