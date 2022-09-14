vim.cmd([[
call plug#begin('~/.config/nvim/plugged')
Plug 'lewis6991/impatient.nvim'
Plug 'nvim-lualine/lualine.nvim'
Plug 'norcalli/nvim-colorizer.lua'
Plug 'folke/tokyonight.nvim', { 'branch': 'main' }
Plug 'luisiacc/gruvbox-baby', { 'branch': 'main'}
Plug 'RishabhRD/popfix'
Plug 'RishabhRD/nvim-cheat.sh'
Plug 'numToStr/Comment.nvim'
Plug 'chrisbra/unicode.vim'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'mattn/emmet-vim'
Plug 'tpope/vim-fugitive'
Plug 'lervag/vimtex', { 'for': 'tex' }
Plug 'preservim/vim-markdown', { 'for' : 'markdown' }
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'p00f/nvim-ts-rainbow'
Plug 'nvim-treesitter/nvim-treesitter-context'
Plug 'nvim-treesitter/nvim-treesitter-textobjects'
Plug 'williamboman/mason.nvim'
Plug 'williamboman/mason-lspconfig.nvim'
Plug 'neovim/nvim-lspconfig'
Plug 'ms-jpq/coq_nvim', {'branch': 'coq'}
Plug 'ms-jpq/coq.artifacts', {'branch': 'artifacts'}
Plug 'nvim-lua/plenary.nvim'
Plug 'jose-elias-alvarez/null-ls.nvim'
Plug 'windwp/nvim-autopairs'
Plug 'tpope/vim-surround'
" Plug 'honza/vim-snippets'
" Plug 'SirVer/ultisnips'
" Plug 'hrsh7th/cmp-nvim-lsp'
" Plug 'hrsh7th/cmp-buffer'
" Plug 'hrsh7th/cmp-path'
" Plug 'hrsh7th/cmp-cmdline'
" Plug 'quangnguyen30192/cmp-nvim-ultisnips'
" Plug 'hrsh7th/nvim-cmp'
" Plug 'neoclide/coc.nvim', {'branch': 'release'}
" Plug 'vimwiki/vimwiki'
" Plug 'andweeb/presence.nvim'
" Plug 'glacambre/firenvim', { 'do': { _ -> firenvim#install(0) } }
call plug#end()
]])
require("impatient")
require("ali.options")
require("ali.filetree")
require("ali.autocmds")
require("ali.keymaps")
require("ali.colorscheme")
require("ali.statusline")
require("lualine").setup(MyStatuslineConfig)

local async = vim.loop.new_async(vim.schedule_wrap(function()
	require("ali.treesitter")
	require("Comment").setup()
	require("colorizer").setup()
	require("nvim-autopairs").setup()
	require("mason").setup()
	require("ali.lsp")
	require("ali.null-ls")
end))

async:send()
