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
  ---Whether to attach navic to language servers automatically.
  ---
  ---@type boolean
  attach_navic = true,

  ---Whether to create winbar updater autocmd.
  ---
  ---@type boolean
  create_autocmd = true,

  ---Buftypes to enable winbar in.
  ---
  ---@type string[]
  include_buftypes = { "" },

  ---Filetypes not to enable winbar in.
  ---
  ---@type string[]
  exclude_filetypes = { "toggleterm" },

  modifiers = {
    ---Filename modifiers applied to dirname.
    ---
    ---See: `:help filename-modifiers`
    ---
    ---@type string
    dirname = ":~:.",

    ---Filename modifiers applied to basename.
    ---
    ---See: `:help filename-modifiers`
    ---
    ---@type string
    basename = "",
  },

  ---Whether to display path to file.
  ---
  ---@type boolean
  show_dirname = true,

  ---Whether to display file name.
  ---
  ---@type boolean
  show_basename = true,

  ---Whether to replace file icon with the modified symbol when buffer is
  ---modified.
  ---
  ---@type boolean
  show_modified = false,

  ---Get modified status of file.
  ---
  ---NOTE: This can be used to get file modified status from SCM (e.g. git)
  ---
  ---@type fun(bufnr: number): boolean
  modified = function(bufnr) return vim.bo[bufnr].modified end,

  ---Whether to show/use navic in the winbar.
  ---
  ---@type boolean
  show_navic = true,

  ---Get leading custom section contents.
  ---
  ---NOTE: This function shouldn't do any expensive actions as it is run on each
  ---render.
  ---
  ---@type fun(bufnr: number, winnr: number): barbecue.Config.custom_section
  lead_custom_section = function() return " " end,

  ---@alias barbecue.Config.custom_section
  ---|string # Literal string.
  ---|{ [1]: string, [2]: string? }[] # List-like table of `[text, highlight?]` tuples in which `highlight` is optional.
  ---
  ---Get custom section contents.
  ---
  ---NOTE: This function shouldn't do any expensive actions as it is run on each
  ---render.
  ---
  ---@type fun(bufnr: number, winnr: number): barbecue.Config.custom_section
  custom_section = function() return " " end,

  ---@alias barbecue.Config.theme
  ---|'"auto"' # Use your current colorscheme's theme or generate a theme based on it.
  ---|string # Theme located under `barbecue.theme` module.
  ---|barbecue.Theme # Same as '"auto"' but override it with the given table.
  ---
  ---Theme to be used for generating highlight groups dynamically.
  ---
  ---@type barbecue.Config.theme
  theme = "auto",

  ---Whether context text should follow its icon's color.
  ---
  ---@type boolean
  context_follow_icon_color = false,

  symbols = {
    ---Modification indicator.
    ---
    ---@type string
    modified = "●",

    ---Truncation indicator.
    ---
    ---@type string
    ellipsis = "…",

    ---Entry separator.
    ---
    ---@type string
    separator = "",
  },

  ---@alias barbecue.Config.kinds
  ---|false # Disable kind icons.
  ---|table<string, string> # Type to icon mapping.
  ---
  ---Icons for different context entry kinds.
  ---
  ---@type barbecue.Config.kinds
  kinds = {
    File = "",
    Module = "",
    Namespace = "",
    Package = "",
    Class = "",
    Method = "",
    Property = "",
    Field = "",
    Constructor = "",
    Enum = "",
    Interface = "",
    Function = "",
    Variable = "",
    Constant = "",
    String = "",
    Number = "",
    Boolean = "",
    Array = "",
    Object = "",
    Key = "",
    Null = "",
    EnumMember = "",
    Struct = "",
    Event = "",
    Operator = "",
    TypeParameter = "",
  },
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
