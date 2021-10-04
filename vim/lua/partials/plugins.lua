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
	use { 'tpope/vim-eunuch', cmd = {'Delete', 'Unlink', 'Remove', 'Move', 'Rename', 'Chmod', 'Mkdir', 'Mkdir!'} }

	-- Text operations
	use 'tpope/vim-surround'

	-- LSP
	use 'neovim/nvim-lspconfig'
	use 'glepnir/lspsaga.nvim'

	-- Statusline
	use {
	    'hoob3rt/lualine.nvim',
	    requires = {'kyazdani42/nvim-web-devicons', opt = true}
	}

	-- Theme
	use 'ayu-theme/ayu-vim'
	use 'folke/lsp-colors.nvim'
    end,
    config = {
	-- Move to lua dir so impatient.nvim can cache it
	compile_path = vim.fn.stdpath('config')..'/lua/packer_compiled.lua'
    }
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

