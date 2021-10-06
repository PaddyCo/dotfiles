-- Leader key settings
vim.g.mapleader = ' '
vim.api.nvim_set_option('timeoutlen', 1000)

-- Search settings
vim.o.ignorecase = true
vim.o.smartcase = true

-- Preview results from substitute and other actions
vim.opt.inccommand = "nosplit"

-- No line wrap
vim.g.nowrap = true

-- Line numbers
vim.o.number = true
vim.o.signcolumn = 'number'

-- Set terminal title
vim.o.title = true
vim.api.nvim_command([[ auto BufEnter * let &titlestring = fnamemodify(getcwd(), ":t") . " (nvim)" ]])

-- Show indentation and trailing spaces
vim.o.listchars = "tab:→ ,trail:·,nbsp:·"
vim.o.list = true

-- Reduce updatetime
vim.o.updatetime=300

-- Set clipboard to use system clipboard by default
vim.opt.clipboard = "unnamed,unnamedplus"

-- Set defauult tabs
vim.opt.tabstop = 8
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = false

