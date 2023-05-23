local M = {
	"gbprod/yanky.nvim",
	enabled = true,
	event = "VeryLazy",
	dependencies = { "kkharji/sqlite.lua" },
	opts = {
		--	highlight = { timer = 150 },
		-- ring = { storage = "sqlite" },
	},
	keys = {
		{
			"<leader>P",
			function()
				require("telescope").extensions.yank_history.yank_history({})
			end,
			desc = "Paste from Yanky",
		},
		{ "y", "<Plug>(YankyYank)", mode = { "n", "x" } },
		{ "p", "<Plug>(YankyPutAfter)", mode = { "n", "x" } },
		{ "P", "<Plug>(YankyPutBefore)", mode = { "n", "x" } },
		{ "gp", "<Plug>(YankyGPutAfter)", mode = { "n", "x" } },
		{ "gP", "<Plug>(YankyGPutBefore)", mode = { "n", "x" } },
	},
}
return M
