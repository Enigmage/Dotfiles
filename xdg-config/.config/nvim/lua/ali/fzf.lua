vim.cmd([[
let g:fzf_action = {
            \ 'ctrl-t': 'tab split',
            \ 'ctrl-s': 'split',
            \ 'ctrl-v': 'vsplit'
            \}
let g:fzf_layout = { 'window': { 'width': 0.9, 'height': 0.6 } }
]])

-- Fzf <Leader>f
vim.keymap.set("n", "<Leader>ff", ":Files<CR>")
vim.keymap.set("n", "<Leader>fg", ":Rg<CR>")
vim.keymap.set("n", "<Leader>fb", ":Buffers<CR>")
vim.keymap.set("n", "<Leader>fl", ":BLines<CR>")
vim.keymap.set("n", "<Leader>fm", ":Marks<CR>")
