-- a variant of the Nord theme geared towards better results
-- with neovim, especially features like lsp, treesitter etc.

--local M = {
--	"shaunsingh/nord.nvim",
--	lazy = false,
--	priority = 999,
--}
--
--function M.config()
--	local nord = require("nord")
--	nord.set()
--end
--
--return M

return {
	"catppuccin/nvim",
	lazy = false,
	priority = 999,
	name = "catppuccin",
	config = function()
		require("catppuccin").setup({
			flavour = "frappe",
		})
		vim.cmd.colorscheme("catppuccin")
	end,
}
