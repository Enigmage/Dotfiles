local python_path = "/usr/bin/python3"
local undoDirectory = "/home/alizaidi/.config/nvim/undodir"

local generalOptions = {
	wrap = false,
	scrolloff = 5,
	number = true,
	relativenumber = true,
	cursorline = true,
	lazyredraw = true,
	undofile = true,
	undodir = undoDirectory,
	colorcolumn = "80",
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
	winbar = "%t%M%=Unicode:%b",
	cmdheight = 1,
	termguicolors = true,
	list = true,
	listchars = { tab = "| ", trail = "-", nbsp = "+", eol = "↵" },
}

local generalGlobalVars = {
	python3_host_prog = python_path,
	loaded_ruby_provider = 0,
	loaded_node_provider = 0,
	loaded_perl_provider = 0,
	user_emmet_install_global = 0,
	tex_flavor = "latex",
	vim_markdown_folding_disabled = 1,
	vim_markdown_math = 1,
	vim_markdown_frontmatter = 1,
}

vim.opt.shortmess:append("c")

for option, value in pairs(generalOptions) do
	vim.opt[option] = value
end

for var, value in pairs(generalGlobalVars) do
	vim.g[var] = value
end
