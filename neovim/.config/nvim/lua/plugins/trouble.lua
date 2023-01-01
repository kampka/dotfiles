local M = {
	"folke/trouble.nvim",
	cmd = { "Trouble", "TroubleToggle" },
	config = function()
		trouble = require("trouble")
		trouble.setup({
			auto_open = false, -- automatically open the list when you have diagnostics
			auto_close = true, -- automatically close the list when you have no diagnostics
			use_diagnostic_signs = true,
		})

		local map = require("utils.functions").map
		map("n", "<leader>tn", [[<cmd>lua require("trouble").next({skip_groups = true, jump = true})<CR>]])
		map("n", "<leader>tp", [[<cmd>lua require("trouble").previous({skip_groups = true, jump = true})<CR>]])
	end,
}

return M
