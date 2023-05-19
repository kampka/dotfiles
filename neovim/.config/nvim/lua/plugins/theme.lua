-- a variant of the Nord theme geared towards better results
-- with neovim, especially features like lsp, treesitter etc.

local M = {
	"shaunsingh/nord.nvim",
	lazy = false,
	priority = 999,
}

function M.config()
	local nord = require("nord")
	nord.set()
end

return M

--return {
--	"catppuccin/nvim",
--	name = "catppuccin",
--	config = function()
--		require("catppuccin").setup({
--			flavour = "frappe",
--		})
--	end,
--}
