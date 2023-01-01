local M = {
  'phaazon/mind.nvim',
  branch = 'v2.2',
  dependencies = { 'nvim-lua/plenary.nvim' },
  cmd = 'MindOpenMain',
  config = function()
    require('mind').setup()
  end
}

return M
