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
local mason_lspconfig = require("mason-lspconfig")
-- local coq = require("coq")

-- local lsp_flags = {
-- 	debounce_text_changes = 150,
-- }

local servers = {
	tsserver = {},
	pyright = {
		analysis = {
			typeCheckingMode = "basic",
			autoImportCompletions = true,
		},
	},
	gopls = {},
	clangd = {},
	texlab = {},
	rust_analyzer = {},
	cssls = {},
	cssmodules_ls = {},
	hls = {},
	tailwindcss = {},
	lua_ls = {
		runtime = {
			version = "LuaJIT",
		},
		diagnostics = {
			globals = { "vim" },
		},
		workspace = {
			library = vim.api.nvim_get_runtime_file("", true),
		},
	},
}

-- mason_lspconfig.setup({
-- 	ensure_installed = vim.tbl_keys(servers),
-- })

mason_lspconfig.setup_handlers({
	function(server_name)
		lspconfig[server_name].setup({
			capabilities = capabilities,
			on_attach = on_attach,
			settings = servers[server_name],
		})
	end,
})

lspconfig["denols"].setup({
	on_attach = on_attach,
	capabilities = capabilities,
	init_options = {
		enable = true,
		unstable = true,
	},
	root_dir = util.root_pattern("deno.json", "deno.jsonc", "deps.ts", "dev_deps.ts"),
})
