local netrwSettings = {
    netrw_liststyle = 3, -- Tree style list view
    netrw_banner = 0,
    netrw_browse_split = 4, -- 3 opens files in new tabs, 4 uses prev window
    netrw_altv = 1, -- open vertical split on right
    netrw_alto = 0, -- open horizontal split on top
    netrw_winsize = 45,
}

for var, val in pairs(netrwSettings) do
    vim.g[var] = val
end
