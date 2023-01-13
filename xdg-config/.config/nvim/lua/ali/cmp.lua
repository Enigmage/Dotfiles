local cmp = require("cmp")
local luasnip = require("luasnip")

cmp.setup({
	snippet = {
		expand = function(args)
			luasnip.lsp_expand(args.body)
		end,
	},
	mapping = cmp.mapping.preset.insert({
		["<C-d>"] = cmp.mapping.scroll_docs(-4),
		["<C-f>"] = cmp.mapping.scroll_docs(4),
		["<C-Space>"] = cmp.mapping.complete(),
		["<CR>"] = cmp.mapping.confirm({
			behavior = cmp.ConfirmBehavior.Replace,
			select = true,
		}),
		["<Tab>"] = cmp.mapping(function(fallback)
			if cmp.visible() then
				cmp.select_next_item()
			elseif luasnip.expand_or_jumpable() then
				luasnip.expand_or_jump()
			else
				fallback()
			end
		end, { "i", "s" }),
		["<S-Tab>"] = cmp.mapping(function(fallback)
			if cmp.visible() then
				cmp.select_prev_item()
			elseif luasnip.jumpable(-1) then
				luasnip.jump(-1)
			else
				fallback()
			end
		end, { "i", "s" }),
	}),
	sources = {
		{ name = "nvim_lsp" },
		{ name = "luasnip" },
		{ name = "buffer" },
	},
})
-- local cmp = require("cmp")
--
-- vim.g.UltiSnipsExpandTrigger = "<c-j>"
-- vim.g.UltiSnipsJumpForwardTrigger = "<c-j>"
-- vim.g.UltiSnipsJumpBackwardTrigger = "<c-k>"
--
-- cmp.setup({
-- 	snippet = {
-- 		expand = function(args)
-- 			vim.fn["UltiSnips#Anon"](args.body)
-- 		end,
-- 	},
-- 	window = {
-- 		completion = cmp.config.window.bordered(),
-- 		documentation = cmp.config.window.bordered(),
-- 	},
-- 	mapping = {
-- 		["<Tab>"] = cmp.mapping({
-- 			c = function()
-- 				if cmp.visible() then
-- 					cmp.select_next_item({ behavior = cmp.SelectBehavior.Insert })
-- 				else
-- 					cmp.complete()
-- 				end
-- 			end,
-- 			i = function(fallback)
-- 				if cmp.visible() then
-- 					cmp.select_next_item({ behavior = cmp.SelectBehavior.Insert })
-- 				elseif vim.fn["UltiSnips#CanJumpForwards"]() == 1 then
-- 					vim.api.nvim_feedkeys(t("<Plug>(ultisnips_jump_forward)"), "m", true)
-- 				else
-- 					fallback()
-- 				end
-- 			end,
-- 			s = function(fallback)
-- 				if vim.fn["UltiSnips#CanJumpForwards"]() == 1 then
-- 					vim.api.nvim_feedkeys(t("<Plug>(ultisnips_jump_forward)"), "m", true)
-- 				else
-- 					fallback()
-- 				end
-- 			end,
-- 		}),
-- 		["<S-Tab>"] = cmp.mapping({
-- 			c = function()
-- 				if cmp.visible() then
-- 					cmp.select_prev_item({ behavior = cmp.SelectBehavior.Insert })
-- 				else
-- 					cmp.complete()
-- 				end
-- 			end,
-- 			i = function(fallback)
-- 				if cmp.visible() then
-- 					cmp.select_prev_item({ behavior = cmp.SelectBehavior.Insert })
-- 				elseif vim.fn["UltiSnips#CanJumpBackwards"]() == 1 then
-- 					return vim.api.nvim_feedkeys(t("<Plug>(ultisnips_jump_backward)"), "m", true)
-- 				else
-- 					fallback()
-- 				end
-- 			end,
-- 			s = function(fallback)
-- 				if vim.fn["UltiSnips#CanJumpBackwards"]() == 1 then
-- 					return vim.api.nvim_feedkeys(t("<Plug>(ultisnips_jump_backward)"), "m", true)
-- 				else
-- 					fallback()
-- 				end
-- 			end,
-- 		}),
-- 		["<Down>"] = cmp.mapping(cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Select }), { "i" }),
-- 		["<Up>"] = cmp.mapping(cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Select }), { "i" }),
-- 		["<C-n>"] = cmp.mapping({
-- 			c = function()
-- 				if cmp.visible() then
-- 					cmp.select_next_item({ behavior = cmp.SelectBehavior.Select })
-- 				else
-- 					vim.api.nvim_feedkeys(t("<Down>"), "n", true)
-- 				end
-- 			end,
-- 			i = function(fallback)
-- 				if cmp.visible() then
-- 					cmp.select_next_item({ behavior = cmp.SelectBehavior.Select })
-- 				else
-- 					fallback()
-- 				end
-- 			end,
-- 		}),
-- 		["<C-p>"] = cmp.mapping({
-- 			c = function()
-- 				if cmp.visible() then
-- 					cmp.select_prev_item({ behavior = cmp.SelectBehavior.Select })
-- 				else
-- 					vim.api.nvim_feedkeys(t("<Up>"), "n", true)
-- 				end
-- 			end,
-- 			i = function(fallback)
-- 				if cmp.visible() then
-- 					cmp.select_prev_item({ behavior = cmp.SelectBehavior.Select })
-- 				else
-- 					fallback()
-- 				end
-- 			end,
-- 		}),
-- 		["<C-b>"] = cmp.mapping(cmp.mapping.scroll_docs(-4), { "i", "c" }),
-- 		["<C-f>"] = cmp.mapping(cmp.mapping.scroll_docs(4), { "i", "c" }),
-- 		-- ['<C-Space>'] = cmp.mapping(cmp.mapping.complete(), {'i', 'c'}),
-- 		["<C-e>"] = cmp.mapping({ i = cmp.mapping.close(), c = cmp.mapping.close() }),
-- 		["<CR>"] = cmp.mapping({
-- 			i = cmp.mapping.confirm({ behavior = cmp.ConfirmBehavior.Replace, select = false }),
-- 			-- behaviour for commandline mode c = ...
-- 		}),
-- 	},
-- 	sources = {
-- 		{ name = "nvim_lsp" },
-- 		{ name = "ultisnips" },
-- 		{ name = "buffer" },
-- 		{ name = "path" },
-- 	},
-- 	experimental = {
-- 		ghost_text = false,
-- 	},
-- })
--
-- -- Use buffer source for `/` (if you enabled `native_menu`, this won't work anymore).
-- cmp.setup.cmdline("/", {
-- 	mapping = cmp.mapping.preset.cmdline(),
-- 	sources = {
-- 		{ name = "buffer" },
-- 	},
-- })
-- -- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
-- cmp.setup.cmdline(":", {
-- 	mapping = cmp.mapping.preset.cmdline(),
-- 	sources = cmp.config.sources({
-- 		{ name = "path" },
-- 	}, {
-- 		{ name = "cmdline" },
-- 	}),
-- })
