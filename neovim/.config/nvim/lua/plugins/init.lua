return {
	-- fugitive is THE git integration for vim
	"tpope/vim-fugitive",

	-- dev icons 🤷
	{
		"nvim-tree/nvim-web-devicons",
		config = { default = true },
	},

	-- adds a set of functions for working with
	-- sandwich objects like brakets or quotes
	"machakann/vim-sandwich",

	-- show virtual line indentation markers
	"lukas-reineke/indent-blankline.nvim",

	-- polyglot is a collection of basics for many different languages
	"sheerun/vim-polyglot",

	-- Apply .editorconfig settings if available
	"gpanders/editorconfig.nvim",

	-- a Debug Adapter Protocol client implementation
	"mfussenegger/nvim-dap",

	-- typescript integration
	"jose-elias-alvarez/typescript.nvim",

	--
	"folke/which-key.nvim",

	-- Resizes split buffers automatically on (un-) zoom etc.
	{
		"kwkarlwang/bufresize.nvim",
		lazy = false,
		config = function()
			require("bufresize").setup()
		end,
	},

	{
		"SmiteshP/nvim-navic",
		config = function()
			vim.g.navic_silence = true
			require("nvim-navic").setup({ separator = " ", highlight = true, depth_limit = 5 })
		end,
	},

	{
		"ckipp01/scala-utils.nvim",
		requires = { "nvim-lua/plenary.nvim" },
	},
	{
		"scalameta/nvim-metals",
		requires = { "nvim-lua/plenary.nvim" },
	},
	{
		"smjonas/inc-rename.nvim",
		cmd = "IncRename",
		config = true,
	},
}
