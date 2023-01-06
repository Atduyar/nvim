
return require("packer").startup(function(use)
	-- Packer can manage itself
	use "wbthomason/packer.nvim"
	use 'github/copilot.vim'
	use {
		'nvim-treesitter/nvim-treesitter',
		run = ':TSUpdate'
	}

	-- intelisens
	use {
		'VonHeikemen/lsp-zero.nvim',
		requires = {
			-- LSP Support
			{'neovim/nvim-lspconfig'},
			{'williamboman/mason.nvim'},
			{'williamboman/mason-lspconfig.nvim'},

			-- Autocompletion
			{'hrsh7th/nvim-cmp'},
			{'hrsh7th/cmp-buffer'},
			{'hrsh7th/cmp-path'},
			{'saadparwaiz1/cmp_luasnip'},
			{'hrsh7th/cmp-nvim-lsp'},
			{'hrsh7th/cmp-nvim-lua'},

			-- Snippets
			{'L3MON4D3/LuaSnip'},
			{'rafamadriz/friendly-snippets'},
		}
	}
	use {
		"folke/zen-mode.nvim",
		config = function()
			require("zen-mode").setup {}
		end
	}
	
	use 'lewis6991/gitsigns.nvim'
	use('tpope/vim-fugitive')
	
	use('mbbill/undotree')

	-- color
	use "nanotech/jellybeans.vim"
	use "mhartington/oceanic-next"
	use "drewtempelmeyer/palenight.vim"
	use "rakr/vim-one"
	use "tomasr/molokai"
	use "dracula/vim"
	use "EdenEast/nightfox.nvim"
	use "Shatur/neovim-ayu"
	use "folke/tokyonight.nvim"

	use {
		"nvim-tree/nvim-tree.lua",
		requires = {
			"nvim-tree/nvim-web-devicons", -- optional, for file icons
		},
		tag = "nightly" -- optional, updated every week. (see issue #1193)
	}
	use {
		"nvim-telescope/telescope.nvim", tag = "0.1.0",
		requires = { {"nvim-lua/plenary.nvim"} }
	}
	use"petertriho/nvim-scrollbar"
	use {
		"kevinhwang91/nvim-hlslens",
		config = function()
			require("scrollbar.handlers.search").setup({})
		end,
	}
	use {
		'nvim-lualine/lualine.nvim',
		requires = { 'kyazdani42/nvim-web-devicons', opt = true }
	}
	use {'akinsho/bufferline.nvim', tag = "v3.*", requires = 'nvim-tree/nvim-web-devicons'}
	use {"akinsho/toggleterm.nvim", tag = '*', config = function()
		require("toggleterm").setup()
	end}
end)
