local null_ls = require("null-ls")

local formatting = null_ls.builtins.formatting

null_ls.setup {
    debug = false,
    sources = {
        formatting.black.with({extra_args =  {"--fast"}}),
        formatting.prettier,
    }, 
}

vim.keymap.set("n", "<F6>", ":lua vim.lsp.buf.format()<CR>")
