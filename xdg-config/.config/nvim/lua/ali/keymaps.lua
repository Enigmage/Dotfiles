-- General keymaps

local map = vim.keymap.set -- provides non-recursive mapping by default
--local rem = vim.keymap.del

vim.g.mapleader = " "
vim.g.maplocalleader = " "
vim.g.user_emmet_leader_key = ","

-- Silent and non-recursive
local opts = { silent = true, noremap = true }

--Modes
--  normal_mode = "n",
--  insert_mode = "i",
--  visual_mode = "v",
--  visual_block_mode = "x",
--  term_mode = "t",
--  command_mode = "c",

-- Move lines up or down
map("x", "K", ":move '<-2<CR>gv-gv")
map("x", "J", ":move '>+1<CR>gv-gv")

-- Better Escape
map("i", "jk", "<Esc>")

-- Keep stuff highlighted after indent
map("v", "<", "<gv")
map("v", ">", ">gv")

-- Terminal mappings
map("t", "<C-[>", "<C-\\><C-N>", opts)
map("n", "\\t", ":split term://zsh<CR>", opts)
map("n", "\\p", ":split term://pyrun %<CR>", opts)
map("n", "\\c", ":split term://cppc %<CR>", opts)
map("n", "\\j", ":split term://deno run %<CR>", opts)
map("n", "\\rj", ":split term://deno<CR>", opts)
map("n", "\\rp", ":split term://python3<CR>", opts)

-- Better window navigation
map("n", "<A-h>", "<C-w>h")
map("n", "<A-j>", "<C-w>j")
map("n", "<A-k>", "<C-w>k")
map("n", "<A-l>", "<C-w>l")

map({ "t", "i" }, "<A-h>", "<C-\\><C-N><C-w>h")
map({ "t", "i" }, "<A-j>", "<C-\\><C-N><C-w>j")
map({ "t", "i" }, "<A-k>", "<C-\\><C-N><C-w>k")
map({ "t", "i" }, "<A-l>", "<C-\\><C-N><C-w>l")

-- Disable arrow keys
map({ "n", "i" }, "<up>", "<nop>")
map({ "n", "i" }, "<down>", "<nop>")
map({ "n", "i" }, "<left>", "<nop>")
map({ "n", "i" }, "<right>", "<nop>")

-- Filetree
map("n", "<C-n>", ":Vexplore<CR>", opts)

local toggleWinbar = function()
	if vim.g.my_winbar_active == true then
		vim.opt.winbar = ""
		vim.g.my_winbar_active = false
	else
		vim.opt.winbar = "%t%M%=%b"
		vim.g.my_winbar_active = true
	end
end

-- Optional winbar
map("n", "<Leader>w", toggleWinbar)
