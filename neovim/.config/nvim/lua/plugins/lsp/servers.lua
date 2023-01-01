return {
	ansiblels = {},
	bashls = {},
	clangd = {},
	cssls = {},
	dockerls = {},
	tsserver = {},
	svelte = {},
	eslint = {},
	html = {},
	jsonls = {
		on_new_config = function(new_config)
			new_config.settings.json.schemas = new_config.settings.json.schemas or {}
			vim.list_extend(new_config.settings.json.schemas, require("schemastore").json.schemas())
		end,
		settings = {
			json = {
				format = {
					enable = true,
				},
				validate = { enable = true },
			},
		},
	},
	gopls = {
		settings = {
			analyses = {
				unusedparams = true,
			},
			staticcheck = true,
		},
	},
	marksman = {},
	pyright = {},
	rust_analyzer = {
		settings = {
			["rust-analyzer"] = {
				cargo = { allFeatures = true },
				checkOnSave = {
					command = "clippy",
					extraArgs = { "--no-deps" },
				},
			},
		},
	},
	yamlls = {},
	-- tailwindcss = {},

	rnix = {},
	terraformls = {},
}
