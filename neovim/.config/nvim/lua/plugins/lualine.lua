local M = {
	"nvim-lualine/lualine.nvim",
	event = "VeryLazy",
}

local function metals_status()
	return vim.g["metals_status"] or ""
end

function M.config()
	require("lualine").setup({
		options = {
			theme = "nord",
			icons_enabled = true,
			globalstatus = true,
			disabled_filetypes = { statusline = { "dashboard", "lazy" } },
		},
		sections = {
			lualine_a = { "mode" },
			lualine_b = { "branch", "diff" },
			lualine_c = {
				{ "diagnostics", sources = { "nvim_diagnostic" } },
				--				{ "filetype", icon_only = true, separator = "", padding = { left = 1, right = 0 } },
				--				{ "filename", path = 1, symbols = { modified = "  ", readonly = "", unnamed = "" } },
				metals_status,
				{
					function()
						local navic = require("nvim-navic")
						local ret = navic.get_location()
						return ret:len() > 2000 and "navic error" or ret
					end,
					cond = function()
						if package.loaded["nvim-navic"] then
							local navic = require("nvim-navic")
							return navic.is_available()
						end
					end,
					color = { fg = "#ff9e64" },
				},
			},
			lualine_x = { "encoding" },
			lualine_y = { "progress" },
			lualine_z = { "location" },
		},
		inactive_sections = {
			lualine_a = {},
			lualine_b = {},
			lualine_c = {},
			lualine_x = {},
			lualine_y = {},
			lualine_z = {},
		},
		extensions = { "nvim-tree" },
	})
end

return M
