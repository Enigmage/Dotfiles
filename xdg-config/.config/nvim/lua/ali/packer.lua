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
	use("nvim-lua/plenary.nvim")
	use({
		"nvim-lualine/lualine.nvim",
		config = function()
			local myConfig = require("ali.statusline")
			require("lualine").setup(myConfig)
		end,
	})
	use({
		"norcalli/nvim-colorizer.lua",
		config = function()
			require("colorizer").setup()
		end,
	})
	use({ "folke/tokyonight.nvim", branch = "main" })
	use({ "luisiacc/gruvbox-baby", branch = "main" })
	use("shaunsingh/nord.nvim")
	-- use 'RishabhRD/popfix'
	-- use 'RishabhRD/nvim-cheat.sh'
	use({
		"numToStr/Comment.nvim",
		config = function()
			require("Comment").setup()
		end,
	})
	use("chrisbra/unicode.vim")
	use({
		"junegunn/fzf",
		run = function()
			vim.fn["fzf#install"]()
		end,
	})
	use("junegunn/fzf.vim")
	use("mattn/emmet-vim")
	use("tpope/vim-fugitive")
	use({ "lervag/vimtex", ft = { "tex" } })
	use({ "preservim/vim-markdown", ft = { "markdown" } })
	use("godlygeek/tabular")
	use({ -- Highlight, edit, and navigate code
		"nvim-treesitter/nvim-treesitter",
		run = function()
			pcall(require("nvim-treesitter.install").update({ with_sync = true }))
		end,
		config = function()
			require("ali.treesitter")
		end,
	})
	use({
		"p00f/nvim-ts-rainbow",
		"nvim-treesitter/nvim-treesitter-context",
		"nvim-treesitter/nvim-treesitter-textobjects",
		after = "nvim-treesitter",
	})
	-- Plug 'ThePrimeagen/refactoring.nvim'
	use({
		"williamboman/mason.nvim",
		config = function()
			require("mason").setup()
		end,
	})
	use("williamboman/mason-lspconfig.nvim")
	use({"neovim/nvim-lspconfig", config = function() 
        require('ali.lsp')
    end})
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
	})
	use("tpope/vim-surround")
	use({ -- Autocompletion
		"hrsh7th/nvim-cmp",
		config = function()
			require("ali.cmp")
		end,
		requires = { "hrsh7th/cmp-nvim-lsp", "L3MON4D3/LuaSnip", "saadparwaiz1/cmp_luasnip", "hrsh7th/cmp-buffer" },
	})
end)

-- When we are bootstrapping a configuration, it doesn't
-- make sense to execute the rest of the init.lua.
--
-- You'll need to restart nvim, and then it will work.
if is_bootstrap then
	print("==================================")
	print("    Plugins are being installed")
	print("    Wait until Packer completes,")
	print("       then restart nvim")
	print("==================================")
	return
end
-- require("ali.noice")
-- require("ali.refactor")