local null_ls = require("null-ls")

local formatting = null_ls.builtins.formatting

null_ls.setup({
	debug = false,
	sources = {
		formatting.black.with({ extra_args = { "--fast" } }),
		formatting.prettier,
		formatting.stylua,
		formatting.clang_format.with({ extra_args = { "--style=file" } }),
	},
})

vim.keymap.set("n", "<F6>", ":lua vim.lsp.buf.format()<CR>")
