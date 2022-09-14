local null_ls = require("null-ls")

local formatting = null_ls.builtins.formatting

null_ls.setup({
	debug = false,
	sources = {
		formatting.black.with({ extra_args = { "--fast" } }),
		formatting.clang_format.with({ extra_args = { "--style=file" } }),
		formatting.gofumpt,
		formatting.prettier.with({ extra_args = { "--arrow-parens=avoid" } }),
		formatting.stylua,
	},
})
