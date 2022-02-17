vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  -- let packer manage and update itself
  use({ 'wbthomason/packer.nvim' })

  require('plugins.nord').setup(use)
  require('plugins.gitsigns').setup(use)
  require('plugins.treesitter').setup(use)
  require('plugins.lightspeed').setup(use)
  require('plugins.lualine').setup(use)
  require('plugins.telescope').setup(use)
  require('plugins.hardtime').setup(use)
  require('plugins.trouble').setup(use)
  require('plugins.cmp').setup(use)
  require('plugins.vim-tmux-navigator').setup(use)
  require('plugins.lspconfig').setup(use)
  require('plugins.lsp-ts-utils').setup(use)

  -- strip railing whitespace on lines you touched
  -- use({ 'thirtythreeforty/lessspace.vim' })

  -- undotree lets you browse the undo history with diffs
  use({ 'mbbill/undotree' })

  -- fugitive is THE git integration for vim 
  use({ 'tpope/vim-fugitive' })

  -- dev icons 🤷
  use({ 'kyazdani42/nvim-web-devicons' })

  -- adds a set of functions for working with
  -- sandwich objects like brakets or quotes
  use({ 'machakann/vim-sandwich' })


  -- show virtual line indentation markers
  use({ "lukas-reineke/indent-blankline.nvim" })

  -- polyglot is a collection of basics for many different languages
  use({ 'sheerun/vim-polyglot' })

  --
  use({ 'mfussenegger/nvim-dap' })
  use({ 
    'ckipp01/scala-utils.nvim',
    requires = { 'nvim-lua/plenary.nvim' }
  })
  use({
    'scalameta/nvim-metals',
    requires = { 'nvim-lua/plenary.nvim' }
  })

  -- Apply .editorconfig settings if available
  use({ 'gpanders/editorconfig.nvim' })
end)
