local home_dir = os.getenv("HOME")
local xdg_config = ".config"
local undo_dir = string.format("%s/%s/nvim/undodir", home_dir, xdg_config)
local python_path = "/usr/bin/python3"

local options = {
    wrap = false,
    scrolloff = 5,
    number = true,
    relativenumber = true,
    cursorline = true,
    lazyredraw = true,
    undofile = true,
    undodir = undo_dir,
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
    listchars =  { tab = "| ", trail = "-", nbsp = "+", eol = "↵" },
}

local globalVars = {
    python3_host_prog = python_path,
    loaded_ruby_provider = 0,
    loaded_node_provider = 0,
    loaded_perl_provider = 0,
    UltiSnipsExpandTrigger = '<c-j>',
    UltiSnipsJumpForwardTrigger = '<c-j>',
    UltiSnipsJumpBackwardTrigger = '<c-k>',
    user_emmet_install_global= 0,
    user_emmet_leader_key=',',
    tex_flavor = 'latex',
    vim_markdown_folding_disabled = 1,
    vim_markdown_math = 1,
    vim_markdown_frontmatter = 1,
}

vim.opt.shortmess:append("c")

for option, value in pairs(options) do
    vim.opt[option] = value
end

for var, value in pairs(globalVars) do
    vim.g[var] = value
end
