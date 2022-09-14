require("nvim-treesitter.configs").setup({
	ensure_installed = {
		"cpp",
		"c",
		"lua",
		"python",
		"typescript",
		"tsx",
		"javascript",
		"go",
		"html",
		"css",
		"regex",
		"haskell",
		"yaml",
		"java",
		"json",
		"nix",
	},
	auto_install = false,
	ignore_install = {},
	highlight = {
		enable = true,
		disable = {},
		additional_vim_regex_highlighting = false,
	},
	indent = {
		enable = true,
		disable = { "python" },
	},
	rainbow = {
		enable = true,
		extended_mode = true,
		max_file_lines = nil,
	},
	textobjects = {
		select = {
			enable = true,
			lookahead = true,
			keymaps = {
				["af"] = "@function.outer",
				["if"] = "@function.inner",
				["ac"] = "@class.outer",
				["ic"] = "@class.inner",
			},
			include_surrounding_whitespace = false,
		},
	},
})