local api = vim.api
local cmd = vim.cmd
local fn = vim.fn
local g = vim.g
local opt = vim.opt
local wo = vim.wo
local global_opt = vim.opt_global

g["mapleader"] = ","

local indent = 2

opt.tabstop = indent
opt.shiftwidth = indent
opt.softtabstop = indent
opt.expandtab = true

opt.fileformat = "unix"

-- ignore case in search pattern like / or ?
global_opt.ignorecase = true
-- ... unless upper case characters are part of the search string
global_opt.smartcase = true

-- show tab line when there are at least two tabs
global_opt.showtabline = 1

-- write the swap file to disk after 500 milliseconds of inactivity (crash-recovery)
global_opt.updatetime = 500

-- briefly show a matching pair if a match was inserted, eg. matching parens
global_opt.showmatch = true

-- ignore these file patterns when expanding paths
global_opt.wildignore = { ".git", "*/node_modules/*", "*/target/*", ".metals", ".bloop" }

-- don't wrap lines longer than the window
global_opt.wrap = false

-- highlight the line the cursor is currently on
opt.cursorline = true

-- always show the sign column
opt.signcolumn = "yes"

-- always show current line number and relative line numbers
wo.number = true
wo.relativenumber = true

-- configure nvim diagnostics (requires nvim 0.6)
vim.diagnostic.config({ virtual_text = false })

-- Store backups. Not everything is under version control, and the eventual
-- 'git clean' might remove things I don't mean to remove
local backupdir = vim.fn.stdpath("cache") .. "/backup"
vim.o.backup = true
vim.o.backupdir = backupdir

-- Allow undoing after a file is closed.
local undodir = vim.fn.stdpath("cache") .. "/undo"
vim.o.undofile = true
vim.o.undodir = undodir

vim.o.undolevels = 1000

-- Ensure directories exist
vim.cmd([[
if !isdirectory(expand(&backupdir))
  call mkdir(expand(&backupdir), "p")
endif
if !isdirectory(expand(&undodir))
  call mkdir(expand(&undodir), "p")
endif
]])

local base_group = api.nvim_create_augroup("base", { clear = true })

api.nvim_create_autocmd({ "BufReadPost", "BufNewFile" }, {
	pattern = { "*.md", "*.txt", "COMMIT_EDITMSG" },
	command = "set wrap linebreak nolist spell spelllang=en_us complete+=kspell",
	group = base_group,
})

-- Turn of hlsearch if the cursor moves after searching
vim.on_key(function(char)
	if vim.fn.mode() == "n" then
		vim.opt.hlsearch = vim.tbl_contains({ "<CR>", "n", "N", "*", "#", "?", "/" }, vim.fn.keytrans(char))
	end
end, vim.api.nvim_create_namespace("auto_hlsearch"))

-- Key mappings
vim.api.nvim_set_keymap("n", "<C-u>", "<C-u>zz", { noremap = true })
vim.api.nvim_set_keymap("n", "<C-d>", "<C-d>zz", { noremap = true })
