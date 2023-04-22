return {
'lewis6991/impatient.nvim',
{ 'freddiehaddad/feline.nvim' },
{ 
	"nvim-telescope/telescope.nvim",
	event = "VeryLazy",
	cmd = "Telescope"
},
{"dharmx/nvim-colo",
  config = true 
},
{'decaycs/decay.nvim'},
{
  'VonHeikemen/lsp-zero.nvim',
  branch = 'v1.x',
  dependencies = {
    -- LSP Support
    {'neovim/nvim-lspconfig'},             -- Required
    {'williamboman/mason.nvim'},           -- Optional
    {'williamboman/mason-lspconfig.nvim'}, -- Optional

    -- Autocompletion
    {'hrsh7th/nvim-cmp'},         -- Required
    {'hrsh7th/cmp-nvim-lsp'},     -- Required
    {'hrsh7th/cmp-buffer'},       -- Optional
    {'hrsh7th/cmp-path'},         -- Optional
    {'saadparwaiz1/cmp_luasnip'}, -- Optional
    {'hrsh7th/cmp-nvim-lua'},     -- Optional

    -- Snippets
    {'rafamadriz/friendly-snippets'}, -- Optional
  }
},
"typicode/bg.nvim",
 'AlphaTechnolog/pywal.nvim',
{
  "nvim-neo-tree/neo-tree.nvim"
},
{ 'Everblush/nvim', name = 'everblush' },
{
	"nvim-treesitter/nvim-treesitter",
	event = "BufReadPre"
},
{
	'tjdevries/colorbuddy.nvim'
},
{
	"kyazdani42/nvim-tree.lua",
	cmd = "NvimTreeToggle"
},
"kyazdani42/nvim-web-devicons",
{
	"nvim-lua/plenary.nvim",
	event = "VeryLazy"
},
{
	"L3MON4D3/LuaSnip",
	-- follow latest release.
	version = "<CurrentMajor>.*",
	-- install jsregexp (optional!).
	build = "make install_jsregexp"
},
{
	"catppuccin/nvim",
	lazy = true
},
{
	'NvChad/nvim-colorizer.lua',
	event = "VeryLazy",
	config = function ()
		require 'colorizer'.setup()
	end
},
{
	"ellisonleao/glow.nvim", 
	cmd = "Glow",
	ft = "md",
	config = true,
},
{
	"evanleck/vim-svelte",
	ft="svelte"
},
{
	'mrjones2014/legendary.nvim',
	cmd = "Legendary"
},
{ 
	"ziontee113/icon-picker.nvim",
	config = true
},
'decaycs/decay.nvim',
{
	"neovim/nvim-lspconfig",
	event = "VeryLazy"
},
{
	"folke/trouble.nvim" ,
	cmd = "Trouble",
},
'tami5/lspsaga.nvim',
'akinsho/bufferline.nvim', 
"rebelot/heirline.nvim",
'goolord/alpha-nvim',
{
	"akinsho/toggleterm.nvim",
	cmd = "Toggleterm"
},
{
	"ziontee113/icon-picker.nvim",
	cmd = "IconPickerInsert"
},
{
	'lewis6991/gitsigns.nvim',
	event = "BufReadPre"
},
{ 
	'numToStr/Comment.nvim',
	event = "InsertEnter"
},
{
	"alvan/vim-closetag",
	event = "InsertEnter"
},
{
	"jiangmiao/auto-pairs",
},
"lukas-reineke/indent-blankline.nvim",
{
	"folke/neodev.nvim",
	event = "InsertEnter",
	config = true
},
{ 
	"folke/which-key.nvim", 
	lazy = true,
	cmd = "WhichKey"
},
{
	"rcarriga/nvim-notify",
	event = "VeryLazy",
	config = function ()
		vim.notify = require("notify")
	end,	
},
{ 
	"folke/noice.nvim",
	event = "VeryLazy",
	dependencies = {
		'MunifTanjim/nui.nvim'
	}
},
{
	"utilyre/barbecue.nvim",
	event = "BufReadPost",
	dependencies = {
		"neovim/nvim-lspconfig",
		"SmiteshP/nvim-navic",
	},
	config = function ()
		require("barbecue").setup(
		{
		  symbols = {
  		  modified = "●",
    		ellipsis = "…",
    		separator = " ",
  		}
		}
		)
	end
},
{ 
	"hrsh7th/nvim-cmp", 
	event = "InsertEnter",
	dependencies = {
		"hrsh7th/cmp-nvim-lsp",
		"hrsh7th/cmp-buffer",
		"hrsh7th/cmp-path",
		"hrsh7th/cmp-cmdline",
		"saadparwaiz1/cmp_luasnip",
		"rafamadriz/friendly-snippets",
	},
},
'onsails/lspkind.nvim',
{ 
	"folke/todo-comments.nvim", 
	event = "VeryLazy"
},
{ 
	"stevearc/dressing.nvim", 
	event = "VeryLazy" 
},
}
