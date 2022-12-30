local M = {}

M.setup = function(use)
  use({
    'nvim-telescope/telescope.nvim',
    requires = {
      { "nvim-lua/popup.nvim" },
      { "nvim-lua/plenary.nvim" },
      { "nvim-telescope/telescope-fzy-native.nvim" },
      { "nvim-telescope/telescope-ui-select.nvim" },
      { "debugloop/telescope-undo.nvim" },
    },
    config = function()
      local actions = require("telescope.actions")
      local trouble = require("trouble.providers.telescope")
      require("telescope").setup({
        defaults = {
          file_ignore_patterns = { "target", "node_modules", "parser.c", "out" },
          prompt_prefix = "❯",
          file_previewer = require("telescope.previewers").vim_buffer_cat.new,
          grep_previewer = require("telescope.previewers").vim_buffer_vimgrep.new,
          mappings = {
            i = { ["<c-t>"] = trouble.open_with_trouble },
            n = { ["<c-t>"] = trouble.open_with_trouble },
          },
        },
        extensions = {
          undo = {
            side_by_side = true,
            layout_strategy = "vertical",
            layout_config = {
              vertical = {
                preview_cutoff = 0,
              },
            },
          },
        },
      })

     require("telescope").load_extension("fzy_native")
     require("telescope").load_extension("ui-select")
     require("telescope").load_extension("undo")

      local map = require('..functions').map
      map("n", "<leader>ff", [[<cmd>lua require"telescope.builtin".find_files({layout_strategy="vertical"})<CR>]])
      map("n", "<leader>lg", [[<cmd>lua require"telescope.builtin".live_grep({layout_strategy="vertical"})<CR>]])
      map("n", "<leader>fb", [[<cmd>lua require"telescope.builtin".file_browser({layout_strategy="vertical"})<CR>]])
      map("n", "<leader>mc", [[<cmd>lua require("telescope").extensions.metals.commands()<CR>]])
      map("n", "<leader>ds", [[<cmd>lua require("telescope.builtin").lsp_document_symbols()<CR>]])
      map("n", "<leader>ws", [[<cmd>lua require("telescope.builtin").lsp_dynamic_workspace_symbols()<CR>]])
      map("n", "<leader>u",  [[<cmd>lua require("telescope").extensions.undo.undo()<CR>]])
    end
  })
end

return M
