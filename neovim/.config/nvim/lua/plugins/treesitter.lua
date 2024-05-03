-- Tree-sitter is a parser generator tool and an incremental parsing library.
-- It provides, amongst other things, fast and featureful parsing
-- for eg. more accurate syntax highlighting
local M = {
	"nvim-treesitter/nvim-treesitter",
	event = "BufReadPost",
	config = function()
		require("nvim-treesitter.install").compilers =
			{
				vim.env.NIX_TREESITTER_COMPILER,
			}, require("nvim-treesitter.configs").setup({
				query_linter = {
					enable = true,
					use_virtual_text = true,
					lint_events = { "BufWrite", "CursorHold" },
				},
				highlight = {
					enable = true,
					--disable = { 'scala' },
				},
				indent = {
					enable = true,
				},
				autopairs = {
					enable = true,
				},
			})
	end,
}

return M
