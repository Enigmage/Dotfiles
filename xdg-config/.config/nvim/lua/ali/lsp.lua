-- Mappings.
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
	-- Mappings.
	-- See `:help vim.lsp.*` for documentation on any of the below functions
	local bufopts = { noremap = true, silent = true, buffer = bufnr }
	map("n", "gD", vim.lsp.buf.declaration, bufopts)
	map("n", "gd", vim.lsp.buf.definition, bufopts)
	map("n", "K", vim.lsp.buf.hover, bufopts)
	map("n", "gi", vim.lsp.buf.implementation, bufopts)
	map("n", "<space>rn", vim.lsp.buf.rename, bufopts)
	map("n", "<space>do", vim.lsp.buf.code_action, bufopts)
	map("n", "gr", vim.lsp.buf.references, bufopts)
	map("n", "<space>D", vim.lsp.buf.type_definition, bufopts)
	map("n", "<C-k>", vim.lsp.buf.signature_help, bufopts)
end

local lspconfig = require("lspconfig")
local util = require("lspconfig.util")
local coq = require("coq")
-- local capabilities = require("cmp_nvim_lsp").update_capabilities(vim.lsp.protocol.make_client_capabilities())

local installedServers = {
	"tsserver",
	"pyright",
	"gopls",
	"clangd",
	"denols",
}

require("mason-lspconfig").setup({
	ensure_installed = installedServers,
	automatic_installation = false,
})

-- local lsp_flags = {
-- 	debounce_text_changes = 150,
-- }

lspconfig["tsserver"].setup(coq.lsp_ensure_capabilities({
	on_attach = on_attach,
}))

lspconfig["pyright"].setup(coq.lsp_ensure_capabilities({
	on_attach = on_attach,
}))

lspconfig["gopls"].setup(coq.lsp_ensure_capabilities({
	on_attach = on_attach,
}))

lspconfig["clangd"].setup(coq.lsp_ensure_capabilities({
	on_attach = on_attach,
}))

lspconfig["denols"].setup(coq.lsp_ensure_capabilities({
	on_attach = on_attach,
	init_options = {
		enable = true,
		unstable = true,
	},
	root_dir = util.root_pattern("deno.json", "deno.jsonc", ".git", "deps.ts", "dev_deps.ts"),
}))

-- lspconfig["sumneko_lua"].setup(coq.lsp_ensure_capabilities({
-- 	on_attach = on_attach,
-- 	flags = lsp_flags,
-- 	settings = {
-- 		diagnostics = {
-- 			globals = { "vim" },
-- 		},
-- 		workspace = {
-- 			library = vim.api.nvim_get_runtime_file("", true),
-- 		},
-- 	},
-- }))
