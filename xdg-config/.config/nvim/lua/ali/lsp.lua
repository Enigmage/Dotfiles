-- See `:help vim.diagnostic.*` for documentation on any of the below functions
local opts = { noremap = true, silent = true }
local map = vim.keymap.set
map("n", "[g", vim.diagnostic.goto_prev, opts)
map("n", "]g", vim.diagnostic.goto_next, opts)
map("n", "<F6>", vim.lsp.buf.format, opts)

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
	-- Enable completion triggered by <c-x><c-o>
	-- vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')
	-- See `:help vim.lsp.*` for documentation on any of the below functions
	local bufopts = { noremap = true, silent = true, buffer = bufnr }
	map("n", "gD", vim.lsp.buf.declaration, bufopts)
	map("n", "gd", vim.lsp.buf.definition, bufopts)
	map("n", "gr", vim.lsp.buf.references, bufopts)
	map("n", "gi", vim.lsp.buf.implementation, bufopts)
	map("n", "K", vim.lsp.buf.hover, bufopts)
	map("n", "<space>rn", vim.lsp.buf.rename, bufopts)
	map("n", "<space>do", vim.lsp.buf.code_action, bufopts)
	map("n", "<space>D", vim.lsp.buf.type_definition, bufopts)
	map("n", "<C-k>", vim.lsp.buf.signature_help, bufopts)
end

local lspconfig = require("lspconfig")
local util = require("lspconfig.util")
local capabilities = require("cmp_nvim_lsp").default_capabilities()
-- local coq = require("coq")

-- local lsp_flags = {
-- 	debounce_text_changes = 150,
-- }

lspconfig["tsserver"].setup({
	capabilities = capabilities,
	on_attach = on_attach,
})

lspconfig["pyright"].setup({
	capabilities = capabilities,
	on_attach = on_attach,
	analysis = {
		typeCheckingMode = "basic",
		autoImportCompletions = true,
	},
})

lspconfig["gopls"].setup({
	capabilities = capabilities,
	on_attach = on_attach,
})

lspconfig["clangd"].setup({
	capabilities = capabilities,
	on_attach = on_attach,
})

lspconfig["denols"].setup({
	capabilities = capabilities,
	on_attach = on_attach,
	init_options = {
		enable = true,
		unstable = true,
	},
	root_dir = util.root_pattern("deno.json", "deno.jsonc", "deps.ts", "dev_deps.ts"),
})

lspconfig["texlab"].setup({
	capabilities = capabilities,
	on_attach = on_attach,
})

lspconfig["rust_analyzer"].setup({
	capabilities = capabilities,
	on_attach = on_attach,
})

lspconfig["cssmodules_ls"].setup({
	capabilities = capabilities,
	on_attach = on_attach,
})

lspconfig["hls"].setup({
	capabilities = capabilities,
	on_attach = on_attach,
})

lspconfig["cssls"].setup({
	capabilities = capabilities,
	on_attach = on_attach,
})

-- lspconfig["tailwindcss"].setup(coq.lsp_ensure_capabilities({
-- 	on_attach = on_attach,
-- }))

--lspconfig["sumneko_lua"].setup(coq.lsp_ensure_capabilities({
--	on_attach = on_attach,
--	settings = {
--		diagnostics = {
--			globals = { "vim" },
--		},
--		workspace = {
--			library = vim.api.nvim_get_runtime_file("", true),
--		},
--	},
--}))
