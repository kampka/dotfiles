-- gitsigns shows git decorations in buffers, like blame, changed lines, etc.
local M = {}

M.setup = function(use)
  use({
    "lewis6991/gitsigns.nvim",
    requires = {
      "nvim-lua/plenary.nvim",
    },
    config = function()
      require('gitsigns').setup({
        current_line_blame = true,
        current_line_blame_opts = {
          virt_text_pos = 'right_align', -- 'eol' | 'overlay' | 'right_align'
        },
      })
    end
  })
end

return M
