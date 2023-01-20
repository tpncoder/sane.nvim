local options = {
	ensure_installed = { },
	sync_install = true,
	ignore_install = {},

	highlight = {
		enable = true,
		disable = {},
		additional_vim_regex_highlighting = false,
	},
}

require"nvim-treesitter.configs".setup(options) 
