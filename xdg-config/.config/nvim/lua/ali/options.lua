local python_path = "/usr/bin/python3"
local undoDirectory = "/home/alizaidi/.config/nvim/undodir"

local generalOptions = {
	wrap = false,
	scrolloff = 5,
	number = true,
	relativenumber = true,
	cursorline = true,
	lazyredraw = false,
	undofile = true,
	undodir = undoDirectory,
	-- colorcolumn = "80",
	tabstop = 4,
	softtabstop = 4,
	shiftwidth = 4,
	expandtab = true,
	smartindent = true,
	textwidth = 85,
	inccommand = "split",
	updatetime = 1000,
	writebackup = false,
	encoding = "utf-8",
	title = true,
	confirm = true,
	swapfile = false,
	splitright = true,
	splitbelow = true,
	grepprg = "rg --vimgrep --smart-case --follow",
	laststatus = 3,
	cmdheight = 0,
	termguicolors = true,
	list = true,
	listchars = { tab = "| ", trail = "-", nbsp = "+", eol = "↵" },
}

local globalVars = {
	python3_host_prog = python_path,
	loaded_ruby_provider = 0,
	loaded_node_provider = 0,
	loaded_perl_provider = 0,
	-- user_emmet_install_global = 1,
	tex_flavor = "latex",
	vim_markdown_folding_disabled = 1,
	vim_markdown_math = 1,
	vim_markdown_frontmatter = 1,
	-- coq_settings = {
	-- 	["auto_start"] = "shut-up",
	-- 	["display.icons.mode"] = "none",
	-- 	["display.pum.source_context"] = { " <", ">" },
	-- },
	netrw_liststyle = 3, -- Tree style list view
	netrw_banner = 0,
	netrw_browse_split = 4, -- 3 opens files in new tabs, 4 uses prev window
	netrw_altv = 1, -- open vertical split on right
	netrw_alto = 0, -- open horizontal split on top
	netrw_winsize = 45,
}

vim.opt.shortmess:append("c")

for option, value in pairs(generalOptions) do
	vim.opt[option] = value
end

for var, value in pairs(globalVars) do
	vim.g[var] = value
end

vim.cmd([[
let g:fzf_action = {
            \ 'ctrl-t': 'tab split',
            \ 'ctrl-s': 'split',
            \ 'ctrl-v': 'vsplit'
            \}
let g:fzf_layout = { 'window': { 'width': 0.9, 'height': 0.6 } }
]])
