local M = {
	"folke/trouble.nvim",
	dependencies = { "which-key.nvim" },
	event = "VeryLazy",
	config = function()
		trouble = require("trouble")
		trouble.setup({
			auto_open = false, -- automatically open the list when you have diagnostics
			auto_close = true, -- automatically close the list when you have no diagnostics
			use_diagnostic_signs = true,
		})

		require("which-key").register({
			t = {
				name = "Trouble", -- optional group name
				n = {
					"<cmd>lua require('trouble').next({skip_groups = true, jump = true})<CR>",
					"Jump to next item in Trouble list",
				},
				p = {
					"<cmd>lua require('trouble').previous({skip_groups = true, jump = true})<CR>",
					"Jump to previous item in Trouble list",
				},
				t = {
					"<cmd>lua require('trouble').toggle()<CR>",
					"Toggle Trouble",
				},
			},
		}, { prefix = "<leader>" })
	end,
}

return M
