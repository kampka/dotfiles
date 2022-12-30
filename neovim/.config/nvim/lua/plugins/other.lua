local M = {}

M.setup = function(use)
  use({
    'rgroli/other.nvim', 
    config = function()
      require('other-nvim').setup({
        mappings = {
          {
            pattern = "/src/main/scala/(.*)/(.*).scala$",
            target = "/src/test/scala/%1/%2Spec.scala",
            context = "test"
          }
        }
      })
    end
  })
end

return M
