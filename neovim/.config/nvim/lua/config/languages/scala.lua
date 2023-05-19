local M = {}

M.setup = function()
	local cmd = vim.cmd
	local api = vim.api
	vim.opt_global.shortmess:remove("F")
	metals_config = require("metals").bare_config()

	metals_config.settings = {
		showImplicitArguments = true,
		showInferredType = true,
		excludedPackages = {
			"akka.actor.typed.javadsl",
			"com.github.swagger.akka.javadsl",
			"akka.stream.javadsl",
		},
		serverProperties = {
			"-Xms8G",
			"-Xmx8G",
		},
		sbtScript = "sbt",
	}

	metals_config.init_options.statusBarProvider = "on"
	metals_config.capabilities = require("cmp_nvim_lsp").default_capabilities()

	local dap = require("dap")

	dap.configurations.scala = {
		{
			type = "scala",
			request = "launch",
			name = "Run",
			metals = {
				runType = "run",
				args = { "firstArg", "secondArg", "thirdArg" },
			},
		},
		{
			type = "scala",
			request = "launch",
			name = "Test File",
			metals = {
				runType = "testFile",
			},
		},
		{
			type = "scala",
			request = "launch",
			name = "Test Target",
			metals = {
				runType = "testTarget",
			},
		},
	}

	metals_config.on_attach = function(client, bufnr)
		require("nvim-navic").attach(client, bufnr)
		require("plugins.lsp.formatting").setup(client, bufnr)
		require("plugins.lsp.keys").setup(client, bufnr)

		vim.cmd([[autocmd CursorHold <buffer> lua vim.lsp.buf.document_highlight()]])
		vim.cmd([[autocmd CursorMoved <buffer> lua vim.lsp.buf.clear_references()]])
		vim.cmd([[autocmd BufEnter,CursorHold,InsertLeave <buffer> lua vim.lsp.codelens.refresh()]])
		vim.cmd([[autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_sync() ]])

		require("metals").setup_dap()
	end
	local nvim_metals_group = api.nvim_create_augroup("nvim-metals", { clear = true })
	api.nvim_create_autocmd("FileType", {
		pattern = { "scala", "sbt", "java" },
		callback = function()
			require("metals").initialize_or_attach(metals_config)
		end,
		group = nvim_metals_group,
	})
end

return M
