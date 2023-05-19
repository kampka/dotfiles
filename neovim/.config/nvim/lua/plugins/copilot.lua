local M = {
	"zbirenbaum/copilot.lua",
	cmd = "Copilot",
	event = "InsertEnter",
	config = function()
		require("copilot").setup({
			copilot_node_command = vim.env.COPILOT_NODE,
		})
	end,
}

return M
