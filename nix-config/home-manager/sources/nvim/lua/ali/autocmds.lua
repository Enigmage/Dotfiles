local general = vim.api.nvim_create_augroup("general", {
	clear = true,
})

local WebDevOptions = function()
	vim.o.tabstop = 2
	vim.o.softtabstop = 2
	vim.o.shiftwidth = 2
	vim.o.textwidth = 90
	vim.o.expandtab = true
	vim.o.colorcolumn = "90"
	-- vim.cmd([[EmmetInstall]])
end

vim.api.nvim_create_autocmd({ "FileType" }, {
	pattern = { "*html*", "*css*", "*javascript*", "*typescript*" },
	callback = WebDevOptions,
	group = general,
})
