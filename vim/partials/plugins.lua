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

	-- File operations
	use {'tpope/vim-eunuch', opt = true, cmd = {'Delete', 'Unlink', 'Remove', 'Move', 'Rename', 'Chmod', 'Mkdir', 'Mkdir!'}}

	-- Text operations
	use 'tpope/vim-surround'

	-- Writing
	use {'reedes/vim-pencil'}

	-- LSP
	use 'neovim/nvim-lspconfig'
	use 'glepnir/lspsaga.nvim'
	use {
		'folke/trouble.nvim',
		requires = 'kyazdani42/nvim-web-devicons',
		config = function() require("trouble").setup {} end
	}

	-- nvim-tree
	use {
	    'kyazdani42/nvim-tree.lua',
	    requires = 'kyazdani42/nvim-web-devicons',
	    config = function() require'nvim-tree'.setup({}) end
	}

	-- Statusline
	use {
	    'hoob3rt/lualine.nvim',
	    requires = {'kyazdani42/nvim-web-devicons', opt = true}
	}

	-- Theme
	use 'ayu-theme/ayu-vim'
	use 'folke/lsp-colors.nvim'
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

vim.api.nvim_exec([[
    augroup pencil
      autocmd!
      autocmd FileType markdown,mkd call pencil#init()
      autocmd FileType text         call pencil#init()
    augroup END
]], false)
