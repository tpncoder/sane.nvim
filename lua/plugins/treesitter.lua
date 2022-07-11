local options = {
	ensure_installed = { "c", "lua", "rust", "go" },
	sync_install = true,
	ignore_install = {},

	highlight = {
		enable = true,
		disable = {},
		additional_vim_regex_highlighting = false,
	},
}

require"nvim-treesitter.configs".setup(options) 
