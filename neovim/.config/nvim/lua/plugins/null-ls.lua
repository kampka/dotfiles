local M = {
	"jose-elias-alvarez/null-ls.nvim",
}

function M.setup(options)
	local nls = require("null-ls")
	local formatting = nls.builtins.formatting
	local diagnostics = nls.builtins.diagnostics
	nls.setup({
		debounce = 150,
		save_after_format = false,
		sources = {
			diagnostics.mdl, -- markdown-lint
			-- formatting.eslint_d,
			formatting.deno_fmt.with({
				filetypes = { "javascript", "javascriptreact", "json", "jsonc", "typescript", "typescriptreact" },
			}),
			formatting.fish_indent,
			formatting.isort,
			formatting.shfmt,
			formatting.stylua,
			formatting.taplo,
			formatting.alejandra.with({
				condition = function(utils)
					-- hacky way that the current project is not nixos/nixpkgs,
					-- which is not currently formatted at all
					return not (utils.root_has_file({ ".version" }))
				end,
			}),
		},
		on_attach = options.on_attach,
		root_dir = require("null-ls.utils").root_pattern(".null-ls-root", ".neoconf.json", ".git"),
	})
end

function M.has_formatter(ft)
	local sources = require("null-ls.sources")
	local available = sources.get_available(ft, "NULL_LS_FORMATTING")
	return #available > 0
end

return M
