local M = {
	"zbirenbaum/copilot.lua",
	cmd = "Copilot",
	event = "InsertEnter",
	build = ":Copilot auth",
	opts = {
		suggestion = { enabled = false },
		panel = { enabled = false },
	},
	config = function()
		require("copilot").setup({
			copilot_node_command = vim.env.COPILOT_NODE,
		})
	end,
}

return M
