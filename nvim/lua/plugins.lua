--initalize everything
local vim = vim
local execute = vim.api.nvim_command
local fn = vim.fn

--Packer setup
local install_path = fn.stdpath('data')..'/site/pack/packer/opt/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
    execute('!git clone https://github.com/wbthomason/packer.nvim '..install_path)
    execute 'packadd packer.nvim'
end
vim.cmd('packadd packer.nvim')
local packer = require'packer'
local util = require'packer.util'
packer.init({
  package_root = util.join_paths(vim.fn.stdpath('data'), 'site', 'pack')
})

--ALL plugins setup
packer.startup(function(use)
	 --LSP Interface
         use 'nvim-lua/plenary.nvim' -- required for lsp
         use 'neovim/nvim-lspconfig'
         use('jose-elias-alvarez/null-ls.nvim')
     --LSP Completion
         use {'ms-jpq/coq_nvim',branch='coq'}
         use {'ms-jpq/coq.artifacts', branch = 'artifacts' }
         --slower but backup
         --use 'hrsh7th/nvim-cmp' -- auto complete plugin
         --use 'hrsh7th/cmp-nvim-lsp' -- LSP source for nvim-cmp
         --use 'saadparwaiz1/cmp_luasnip' -- Snippets source for nvim-cmp
     --LSP Dignostics 
         use {
           "folke/trouble.nvim",
           requires = "kyazdani42/nvim-web-devicons",
           config = function() --TODO make this the defacto setup place 
            require("trouble").setup { }
           end
         }
         use 'folke/lsp-colors.nvim'
     --Syntax highlihgitng 
         use {
            'nvim-treesitter/nvim-treesitter',
            run = function() require('nvim-treesitter.install').update({ with_sync = true }) end,
         }
     --Extra
         use 'airblade/vim-gitgutter'

     --DB access
         use 'tpope/vim-dadbod'
         use 'kristijanhusak/vim-dadbod-ui'
     --FileMng 
         use  'ThePrimeagen/harpoon'
         use { "junegunn/fzf", run = ":call fzf#install()" }
         use { "junegunn/fzf.vim" }

     --Styling 
         use 'bluz71/vim-nightfly-guicolors'
         use 'Th3Whit3Wolf/one-nvim'
         use 'kyazdani42/nvim-web-devicons'
         use  'nvim-lualine/lualine.nvim'
end)


