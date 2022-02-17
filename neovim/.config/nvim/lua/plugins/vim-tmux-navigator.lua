M = {}

M.setup = function(use)
  use({
    'christoomey/vim-tmux-navigator',
    config = function()
      local g = vim.g
      g.tmux_navigator_no_mappings = 1
      g.tmux_navigator_disable_when_zoomed = 1

      local map = require('..functions').map
      map("n", "<C-Left>", [[<cmd>:TmuxNavigateLeft<CR>]])
      map("n", "<C-Right>", [[<cmd>:TmuxNavigateRight<CR>]])
      map("n", "<C-Up>", [[<cmd>:TmuxNavigateUp<CR>]])
      map("n", "<C-Down>", [[<cmd>:TmuxNavigateDown<CR>]])
    end
    })
end

return M
