return {
	"ThePrimeagen/harpoon",
	dependencies = { "which-key.nvim" },
	event = "VeryLazy",
	config = function()
		local harpoon = require("harpoon")
		harpoon.setup({
			global_settings = {
				save_on_toggle = true,
				save_on_change = true,
			},
		})

		require("which-key").register({
			h = {
				name = "Harpoon", -- optional group name
				a = { "<cmd>lua require('harpoon.mark').add_file()<CR>", "Add mark" },
				u = { "<cmd>lua require('harpoon.ui').toggle_quick_menu()<CR>", "Menu" },
				n = { "<cmd>lua require('harpoon.ui').nav_file(1)<CR>", "Navigate to file 1" },
				r = { "<cmd>lua require('harpoon.ui').nav_file(2)<CR>", "Navigate to file 2" },
				s = { "<cmd>lua require('harpoon.ui').nav_file(3)<CR>", "Navigate to file 3" },
				g = { "<cmd>lua require('harpoon.ui').nav_file(4)<CR>", "Navigate to file 4" },
			},
		})
	end,
}
