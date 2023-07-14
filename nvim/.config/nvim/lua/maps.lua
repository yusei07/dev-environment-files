vim.g.mapleader = ' '
local keymap = vim.keymap


keymap.set('n', '<leader>pv', ':Ex<CR>')
keymap.set('n', 'x', '"_x')

-- increment/decrement
keymap.set('n', '+', '<c-a>')
keymap.set('n', '-', '<c-x>')

-- clear search highlights
keymap.set("n", "<leader>no", ":nohl<CR>")

-- delete a word backwards
keymap.set('n', 'dw', 'vb"_d')

-- select all
keymap.set('n', '<C-l>', 'ggVG')

-- save with root permission (not working for now)
--vim.api.nvim_create_user_command('w', 'w !sudo tee > /dev/null %', {})

-- new tab
keymap.set('n', 'te', ':tabedit<return>', { silent = true })

-- split window
keymap.set('n', 'ss', ':split<return><c-w>w')
keymap.set('n', 'sv', ':vsplit<return><c-w>w')

-- move window
-- keymap.set('n', '<space>', '<c-w>w')
keymap.set('', 'sh', '<c-w>h')
keymap.set('', 'sk', '<c-w>k')
keymap.set('', 'sj', '<c-w>j')
keymap.set('', 'sl', '<c-w>l')

-- resize window
keymap.set('n', '<c-w><left>', '<c-w><')
keymap.set('n', '<c-w><right>', '<c-w>>')
keymap.set('n', '<c-w><up>', '<c-w>+')
keymap.set('n', '<c-w><down>', '<c-w>-')

-- tree file explorer
-- keymap.set('n', '<leader>e', ':nvimtreetoggle<cr>')


-- center screen and move half a page up or down
keymap.set('n', '<c-d>', '<c-d>zz')
keymap.set('n', '<c-u>', '<c-u>zz')

keymap.set('n', 'j', 'jzz')
keymap.set('n', 'k', 'kzz')

keymap.set("v", "J", ":m '>+1<CR>gv=gv")
keymap.set("v", "K", ":m '<-2<CR>gv=gv")

keymap.set("n", "n", "nzzzv")
keymap.set("n", "N", "Nzzzv")

keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])


-- emmet shortcut
-- vim.g.user_emmet_mode = 'n'
-- vim.g.user_emmet_leader_key = ','

-- keymap.set('n', '<leader>nt', '<plug>(emmet-next-edit-point)')
-- keymap.set('n', '<leader>pv', '<plug>(emmet-prev-edit-point)')
-- keymap.set('n', '<leader>k', '<plug>(emmet-expand-abbr)')
-- keymap.set('i', '<c-y>,', '<plug>(emmet-expand-abbr)')
-- keymap.set('n', '<leader>j', '<plug>(emmet-toggle-comment)')
