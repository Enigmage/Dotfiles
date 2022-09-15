local null_ls = require("null-ls")

local formatting = null_ls.builtins.formatting

null_ls.setup({
	debug = false,
	sources = {
		formatting.black.with({ extra_args = { "--fast" } }),
		formatting.gofumpt,
		formatting.prettier.with({ extra_args = { "--arrow-parens=avoid" } }),
		formatting.stylua,
	},
})
