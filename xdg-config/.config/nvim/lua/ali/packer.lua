local install_path = vim.fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
local is_bootstrap = false
if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
	is_bootstrap = true
	vim.fn.system({ "git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path })
	vim.cmd([[packadd packer.nvim]])
end

require("packer").startup(function(use)
	-- Package manager
	use("wbthomason/packer.nvim")
	use({
		"lewis6991/impatient.nvim",
	})
	use("nvim-lua/plenary.nvim")
	use({
		"stevearc/oil.nvim",
		config = function()
			require("ali.oil")
		end,
	})
	use({
		"nvim-lualine/lualine.nvim",
		config = function()
			local myConfig = require("ali.statusline")
			require("lualine").setup(myConfig)
		end,
	})
	use({
		"norcalli/nvim-colorizer.lua",
		ft = {
			"javascript",
			"typescript",
			"html",
			"css",
			"sass",
			"javascriptreact",
			"typescriptreact",
			"scss",
			"astro",
		},
		config = function()
			require("colorizer").setup()
		end,
	})
	--colorschemes
	use("shaunsingh/nord.nvim")
	use("marko-cerovac/material.nvim")
	use("ellisonleao/gruvbox.nvim")
	use({ "folke/tokyonight.nvim", branch = "main" })
	use("navarasu/onedark.nvim")
	-- use 'RishabhRD/popfix'
	-- use 'RishabhRD/nvim-cheat.sh'
	use({
		"numToStr/Comment.nvim",
		config = function()
			require("Comment").setup()
		end,
		event = "BufEnter",
	})
	use({ "chrisbra/unicode.vim" })
	use({
		"junegunn/fzf.vim",
		requires = {
			{
				"junegunn/fzf",
				run = function()
					vim.fn["fzf#install"]()
				end,
			},
		},
		config = function()
			require("ali.fzf")
		end,
	})
	use({
		"mattn/emmet-vim",
		ft = {
			"javascript",
			"typescript",
			"html",
			"css",
			"sass",
			"javascriptreact",
			"typescriptreact",
			"scss",
			"astro",
		},
	})
	use("tpope/vim-fugitive")
	use({ "lervag/vimtex", ft = { "tex" } })
	use({
		"preservim/vim-markdown",
		ft = { "markdown" },
		requires = { "godlygeek/tabular", opt = true, ft = { "markdown" } },
	})
	use({
		-- Highlight, edit, and navigate code
		"nvim-treesitter/nvim-treesitter",
		run = function()
			pcall(require("nvim-treesitter.install").update({ with_sync = true }))
		end,
		config = function()
			require("ali.treesitter")
		end,
		requires = {
			"p00f/nvim-ts-rainbow",
			"nvim-treesitter/nvim-treesitter-context",
			"nvim-treesitter/nvim-treesitter-textobjects",
		},
	})
	-- Plug 'ThePrimeagen/refactoring.nvim'
	use({
		"williamboman/mason.nvim",
		config = function()
			require("mason").setup()
		end,
	})
	use({
		"neovim/nvim-lspconfig",
		config = function()
			require("ali.lsp")
		end,
		requires = { "hrsh7th/cmp-nvim-lsp", "williamboman/mason-lspconfig.nvim" },
	})
	use({
		-- Autocompletion
		"hrsh7th/nvim-cmp",
		config = function()
			require("ali.cmp")
		end,
		requires = { "L3MON4D3/LuaSnip", "saadparwaiz1/cmp_luasnip", "hrsh7th/cmp-buffer" },
	})
	use({
		"jose-elias-alvarez/null-ls.nvim",
		config = function()
			require("ali.null-ls")
		end,
	})
	use({
		"windwp/nvim-autopairs",
		config = function()
			require("nvim-autopairs").setup()
		end,
		event = "BufEnter",
	})
	use({ "tpope/vim-surround", event = "BufEnter" })
	use({
		"lewis6991/gitsigns.nvim",
		config = function()
			require("gitsigns").setup()
		end,
	})
	if is_bootstrap then
		require("packer").sync()
	end
end)
-- When we are bootstrapping a configuration, it doesn't
-- make sense to execute the rest of the init.lua.
-- You'll need to restart nvim, and then it will work.
if is_bootstrap then
	print("==================================")
	print("    Plugins are being installed")
	print("    Wait until Packer completes,")
	print("       then restart nvim")
	print("==================================")
	return
end

local packer_group = vim.api.nvim_create_augroup("Packer", { clear = true })

vim.api.nvim_create_autocmd({ "BufWritePost" }, {
	command = "source <afile> | silent! LspStop | silent! LspStart | PackerCompile",
	group = packer_group,
	pattern = vim.fn.expand("$MYVIMRC"),
})
