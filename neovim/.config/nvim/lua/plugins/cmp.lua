local M = {
	"hrsh7th/nvim-cmp",
	events = "InsertEnter",
	dependencies = {
		{ "hrsh7th/cmp-buffer" },
		{ "hrsh7th/cmp-nvim-lsp" },
		{ "hrsh7th/cmp-path" },
		{ "hrsh7th/cmp-vsnip" },
		{ "hrsh7th/vim-vsnip" },
		{ "hrsh7th/cmp-emoji" },
		{
			{
				"zbirenbaum/copilot-cmp",
				dependencies = { "copilot.lua" },
				opts = {},
				config = function(_, opts)
					local copilot_cmp = require("copilot_cmp")
					copilot_cmp.setup(opts)
				end,
			},
		},
	},
	config = function()
		local cmp = require("cmp")
		cmp.setup({
			sources = {
				{ name = "copilot", priority = 2 },
				{ name = "nvim_lsp", priority = 10 },
				{ name = "buffer" },
				{ name = "vsnip" },
				{ name = "path" },
				{ name = "emoji" },
			},
			snippet = {
				expand = function(args)
					-- Comes from vsnip
					vim.fn["vsnip#anonymous"](args.body)
				end,
			},
			formatting = {
				format = require("plugins.lsp.kind").cmp_format(),
			},
			experimental = {
				ghost_text = {
					hl_group = "LspCodeLens",
				},
			},
			mapping = {
				-- None of this made sense to me when first looking into this since there
				-- is no vim docs, but you can't have select = true here _unless_ you are
				-- also using the snippet stuff. So keep in mind that if you remove
				-- snippets you need to remove this select
				["<CR>"] = cmp.mapping.confirm({ select = true }),
				["<Tab>"] = function(fallback)
					if cmp.visible() then
						cmp.select_next_item()
					else
						fallback()
					end
				end,
				["<S-Tab>"] = function(fallback)
					if cmp.visible() then
						cmp.select_prev_item()
					else
						fallback()
					end
				end,
			},
		})
	end,
}

return M
