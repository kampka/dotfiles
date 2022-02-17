-- Tree-sitter is a parser generator tool and an incremental parsing library.
-- It provides, amongst other things, fast and featureful parsing
-- for eg. more accurate syntax highlighting
local M = {}

M.setup = function(use)
  use({
    'nvim-treesitter/nvim-treesitter',
    config = function()
      -- Use zig as the default compilers, it has a stable static compile chain
      require('nvim-treesitter.install').compilers = { "zig" }
      require('nvim-treesitter.configs').setup({
        query_linter = {
          enable = true,
          use_virtual_text = true,
          lint_events = { 'BufWrite', 'CursorHold' },
        },
        ensure_installed = 'maintained',
        ignore_install = {
          'norg' -- norg is listed as installed but fails to build with zig atm
        },
        highlight = {
          enable = true,
          disable = { 'scala' },
        },
        indent = {
          enable = true
        }
      })
    end
  })
end

return M
