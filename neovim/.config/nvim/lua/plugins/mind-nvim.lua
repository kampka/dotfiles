local M = {
	"phaazon/mind.nvim",
	branch = "v2.2",
	dependencies = {
		"declancm/git-scripts.nvim",
		"nvim-lua/plenary.nvim",
	},
	cmd = "MindOpenMain",
	config = function()
		local mind = require("mind")
		mind.setup()

		local git = require("git-scripts")
		git.setup({
			commit_on_save = true,
			warnings = false,
		})
	end,
}

return M
