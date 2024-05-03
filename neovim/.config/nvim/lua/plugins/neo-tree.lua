local M = {
	"nvim-neo-tree/neo-tree.nvim",
	branch = "v3.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-tree/nvim-web-devicons",
		"MunifTanjim/nui.nvim",
	},
	init = function()
		vim.cmd([[ let g:neo_tree_remove_legacy_commands = 1 ]])
	end,
	cmd = "Neotree",
	keys = {
		{
			"<leader>ft",
			function()
				require("neo-tree.command").execute({
					toggle = true,
				})
			end,
			desc = "NeoTree",
		},
	},
	config = {
		filesystem = {
			follow_current_file = true,
			hijack_netrw_behavior = "open_current",
		},
	},
}

return M
