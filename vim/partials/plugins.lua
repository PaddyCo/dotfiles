-- TODO: VIM pencil for markdown etc
require('packer').startup{
    function()
    use 'lewis6991/impatient.nvim'
    use {
        'nvim-treesitter/nvim-treesitter',
        run = ':TSUpdate'
    }

    -- Git
    use 'tpope/vim-fugitive'

    -- Tab detection
    use 'tpope/vim-sleuth'
    vim.g.sleuth_automatic = 1

    -- Editor cofnig
    use 'editorconfig/editorconfig-vim'

    -- Telescope
    use 'nvim-lua/plenary.nvim'
    use {
        'nvim-telescope/telescope.nvim',
        requires = {'kyazdani42/nvim-web-devicons', opt = true}
    }
    use { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }
    use { 'ElPiloto/telescope-vimwiki.nvim' }

    -- File operations
    use {'tpope/vim-eunuch', opt = true, cmd = {'Delete', 'Unlink', 'Remove', 'Move', 'Rename', 'Chmod', 'Mkdir', 'Mkdir!'}}

    -- Text operations
    use 'tpope/vim-surround'

    -- Writing
    use {'reedes/vim-pencil'}
    use {
        'vimwiki/vimwiki',
        config = function()
            vim.g.vimwiki_list = {
                {
                    path = '/mnt/c/Users/Patrik/Dropbox/Notes/Personal',
                    syntax = 'markdown', 
                    ext = '.md',
                    path_html = '/mnt/c/Users/Patrik/Dropbox/Notes/Personal_html',
                    custom_wiki2html = '~/.dotfiles/vim/scripts/wiki2html.sh'
                },
                {
                    path = '/mnt/c/Users/Patrik/Dropbox/Notes/Work',
                    syntax = 'markdown', 
                    ext = '.md',
                    path_html = '/mnt/c/Users/Patrik/Dropbox/Notes/Work_html',
                    custom_wiki2html = '~/.dotfiles/vim/scripts/wiki2html.sh'
                },
                {
                    path = '/mnt/c/Users/Patrik/Dropbox/Notes/La-mulana',
                    syntax = 'markdown', 
                    ext = '.md',
                    path_html = '/mnt/c/Users/Patrik/Dropbox/Notes/La-mulana_html',
                    custom_wiki2html = '~/.dotfiles/vim/scripts/wiki2html.sh'
                }
            }
        end
    }

    -- LSP
    use 'neovim/nvim-lspconfig'
    use {
        'folke/trouble.nvim',
        requires = 'kyazdani42/nvim-web-devicons',
        config = function() require("trouble").setup {} end
    }

    use {
        'hrsh7th/nvim-cmp',
        requires = { 'hrsh7th/cmp-nvim-lsp', 'hrsh7th/cmp-buffer', 'hrsh7th/cmp-calc', 'hrsh7th/cmp-path' },
        config = function()
            local cmp = require('cmp')
            cmp.setup({
                snippet = {
                    expand = function(args)
                        -- For `vsnip` user.
                        -- vim.fn["vsnip#anonymous"](args.body)

                        -- For `luasnip` user.
                        -- require('luasnip').lsp_expand(args.body)

                        -- For `ultisnips` user.
                        -- vim.fn["UltiSnips#Anon"](args.body)
                    end,
                },
                mapping = {
                    ['<C-d>'] = cmp.mapping.scroll_docs(-4),
                    ['<C-f>'] = cmp.mapping.scroll_docs(4),
                    ['<C-Space>'] = cmp.mapping.complete(),
                    ['<C-e>'] = cmp.mapping.close(),
                    ['<CR>'] = cmp.mapping.confirm({ select = true }),
                },
                sources = {
                    { name = 'nvim_lsp' },

                    -- For vsnip user.
                    -- { name = 'vsnip' },

                    -- For luasnip user.
                    -- { name = 'luasnip' },

                    -- For ultisnips user.
                    -- { name = 'ultisnips' },

                    { name = 'buffer' },

                    { name = 'path' },

                    { name = 'calc' },
                }
            })
        end
    }

    -- nvim-tree
    use {
        'kyazdani42/nvim-tree.lua',
        requires = 'kyazdani42/nvim-web-devicons',
        config = function() 
        require'nvim-tree'.setup {
            auto_resize = true,
        }
        end
    }

    -- Statusline
    use {
        'hoob3rt/lualine.nvim',
        requires = {'kyazdani42/nvim-web-devicons', opt = true}
    }

    -- Theme
    use 'ayu-theme/ayu-vim'
    use 'folke/lsp-colors.nvim'
    use 'chriskempson/base16-vim'
    end
}

-- Telescope
local actions = require("telescope.actions")
require("telescope").setup({
    defaults = {
    mappings = {
        i = {
        ["<esc>"] = actions.close, -- Make it so single ESC closes window
        },
    },
    },
})
require("telescope").load_extension('vimwiki')

vim.api.nvim_exec([[
augroup pencil
autocmd!
autocmd FileType markdown,mkd call pencil#init()
autocmd FileType text         call pencil#init()
let g:pencil#autoformat = 0
augroup END
]], false)
