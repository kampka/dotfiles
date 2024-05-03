return {
	ansiblels = {},
	astro = {},
	--bashls = {},
	clangd = {},
	cssls = {},
	dockerls = {},
	kotlin_language_server = {},
	tsserver = {
		root_dir = require("null-ls.utils").root_pattern("package.json"),
	},
	denols = {
		root_dir = require("null-ls.utils").root_pattern("deno.json", "deno.jsonc"),
		init = {
			lint = true,
		},
	},
	svelte = {},
	-- eslint = {},
	html = {},
	jsonls = {
		cmd = { "vscode-json-languageserver", "--stdio" },
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
	yamlls = {
		on_new_config = function(new_config)
			new_config.settings.yaml.schemas = new_config.settings.yaml.schemas or {}
			vim.list_extend(new_config.settings.yaml.schemas, require("schemastore").yaml.schemas())
		end,
	},
	nil_ls = {},
	terraformls = {},
}
