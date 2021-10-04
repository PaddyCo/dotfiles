local utils = require'partials/utils'

-- Stop highlighting
utils.keymap('n', '<CR>', ':noh<CR>')

-- File
_G.paddyco.delete_file = function()
    local confirm = vim.fn.input('Do you want to delete current file? [y/N]: ')
    if confirm == "y" then
        vim.cmd(":Delete")
    end
end
utils.keymap('n', '<leader>fD', '<cmd>lua _G.paddyco.delete_file()<CR>', { silent = false })
utils.keymap('n', '<leader>fR', ':Rename<SPACE>', { silent = false })
utils.keymap('n', '<leader>fe', ':e %:h/', { silent = false })

-- Find/search files in current project
utils.keymap('n', '<leader><leader>', ':Telescope find_files<CR>')
utils.keymap('n', '<leader>sp', ':Telescope live_grep<CR>')

-- Buffers
utils.keymap('n', '<leader>bb', ':Telescope buffers<CR>')
utils.keymap('n', '<leader>bn', ':bnext<CR>')
utils.keymap('n', '<leader>bp', ':bprev<CR>')
utils.keymap('n', '<leader>bd', ':bdelete<CR>')
utils.keymap('n', '<leader>bc', ':enew<CR>')

-- Terminal
utils.keymap('n', '<leader>tv', '<cmd>vsplit | :wincmd l | :terminal<CR>')
utils.keymap('n', '<leader>th', '<cmd>split | :wincmd j | :terminal<CR>')
utils.keymap('n', '<leader>t.', '<cmd>terminal<CR>')

-- LSP
utils.keymap('n', '<leader>gd', '<cmd>lua vim.lsp.buf.definition()<CR>')
utils.keymap('n', '<leader>gr', '<cmd>Telescope lsp_references<CR>')
utils.keymap('n', '<leader>rr', '<cmd>lua vim.lsp.buf.rename()<CR>')

-- Tabs
utils.keymap('n', '<leader><tab>n', '<cmd>$tabnew<CR>')
utils.keymap('n', '<leader><tab>d', '<cmd>tabclose<CR>')
for i=1,9 do 
    utils.keymap('n', '<leader><tab>' .. i, '<cmd>tabn' .. i .. '<CR>')
end
