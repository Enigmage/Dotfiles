local general = vim.api.nvim_create_augroup("general", {
    clear = true,
})

local packer_group = vim.api.nvim_create_augroup("Packer", { clear = true })

local WebDevOptions = function()
    vim.opt_local.tabstop = 2
    vim.opt_local.softtabstop = 2
    vim.opt_local.shiftwidth = 2
    vim.opt_local.textwidth = 90
    vim.opt_local.expandtab = true
    vim.opt_local.colorcolumn = "90"
    vim.cmd([[EmmetInstall]])
end

vim.api.nvim_create_autocmd({ "BufWritePost" }, {
    command = "source <afile> | silent! LspStop | silent! LspStart | PackerCompile",
    group = packer_group,
    pattern = vim.fn.expand("$MYVIMRC"),
})

vim.api.nvim_create_autocmd({ "FileType" }, {
    pattern = { "*html*", "*css*", "*javascript*", "*typescript*" },
    callback = WebDevOptions,
    group = general,
})
