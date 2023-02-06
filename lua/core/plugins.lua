return {
'lewis6991/impatient.nvim',
"nvim-telescope/telescope.nvim",
"nvim-treesitter/nvim-treesitter",
"kyazdani42/nvim-tree.lua",
"kyazdani42/nvim-web-devicons",
"nvim-lua/plenary.nvim",
"catppuccin/nvim",
{ 
	"ziontee113/icon-picker.nvim",
	config = true
},
'decaycs/decay.nvim',
"neovim/nvim-lspconfig",
"williamboman/nvim-lsp-installer",
"folke/trouble.nvim" ,
'onsails/lspkind.nvim',
'tami5/lspsaga.nvim',
"williamboman/mason.nvim",
'akinsho/bufferline.nvim', 
"rebelot/heirline.nvim",
'goolord/alpha-nvim',
"akinsho/toggleterm.nvim",
"ziontee113/icon-picker.nvim",
'lewis6991/gitsigns.nvim',
'numToStr/Comment.nvim',
"alvan/vim-closetag",
"jiangmiao/auto-pairs",
"lukas-reineke/indent-blankline.nvim",
{
	"folke/neodev.nvim",
	config = true
},

{ 
	"folke/which-key.nvim", 
	lazy = true
},

{
	"rcarriga/nvim-notify",
	config = function ()
		vim.notify = require("notify")
	end,	
},

{ 
	"folke/noice.nvim",
	dependencies = {
		'MunifTanjim/nui.nvim'
	}
},

{
	"utilyre/barbecue.nvim",
	dependencies = {
		"neovim/nvim-lspconfig",
		"SmiteshP/nvim-navic",
	},
	config = true
},

{ 
	"hrsh7th/nvim-cmp", 

	dependencies = {
		"hrsh7th/cmp-nvim-lsp",
		"hrsh7th/cmp-buffer",
		"hrsh7th/cmp-path",
		"hrsh7th/cmp-cmdline",
		"hrsh7th/vim-vsnip",
		"hrsh7th/vim-vsnip-integ",
		"saadparwaiz1/cmp_luasnip",
		"L3MON4D3/LuaSnip",
		"rafamadriz/friendly-snippets",
	}
},

{ 
	"folke/todo-comments.nvim", 
	event = "VeryLazy"
},

{ 
	"stevearc/dressing.nvim", 
	event = "VeryLazy" 
},
}
