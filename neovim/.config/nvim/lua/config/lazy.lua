-- bootstrap from github
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"--single-branch",
		"https://github.com/folke/lazy.nvim.git",
		lazypath,
	})
end
vim.opt.runtimepath:prepend(lazypath)

require("lazy").setup("plugins", {
	defaults = { lazy = true },
	checker = { enabled = true, frequency = 3600 * 24 * 4 },
	diff = {
		cmd = "terminal_git",
	},
	performance = {
		cache = {
			enabled = true,
		},
	},
})
