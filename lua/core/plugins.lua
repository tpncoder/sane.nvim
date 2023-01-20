local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
  PACKER_BOOTSTRAP = fn.system {
    "git",
    "clone",
    "--depth",
    "1",
    "https://github.com/wbthomason/packer.nvim",
    install_path,
  }
  print "Installing packer close and reopen Neovim..."
  vim.cmd [[packadd packer.nvim]]
end

local status_ok, packer = pcall(require, "packer")
if not status_ok then
  return
end

packer.init {
  -- snapshot = "july-24",
  snapshot_path = fn.stdpath "config" .. "/snapshots",
  max_jobs = 50,
  display = {
    open_fn = function()
      return require("packer.util").float { border = "rounded" }
    end,
    prompt_border = "rounded", -- Border style of prompt popups.
  },
}


return require('packer').startup(function()
		use 'wbthomason/packer.nvim'
		use 'lewis6991/impatient.nvim'
	
		--some shit
	  	use "nvim-telescope/telescope.nvim"
	  	use "nvim-treesitter/nvim-treesitter"
	 	use "kyazdani42/nvim-tree.lua"
	 	use "kyazdani42/nvim-web-devicons"
	  	use "nvim-lua/plenary.nvim"
	  	use "folke/which-key.nvim"

		--colorschemes
	  	use "catppuccin/nvim"
	  	use "folke/tokyonight.nvim"
		use 'navarasu/onedark.nvim'
		use "ellisonleao/gruvbox.nvim"
		use 'NTBBloodbath/doom-one.nvim'
		use 'tomasiser/vim-code-dark'
		use 'decaycs/decay.nvim'

		--completion and lsp
	  	use "hrsh7th/vim-vsnip"
	  	use "hrsh7th/vim-vsnip-integ"
	  	use "neovim/nvim-lspconfig"
	  	use "hrsh7th/cmp-nvim-lsp"
	  	use "hrsh7th/cmp-buffer"
	  	use "hrsh7th/cmp-path"
	  	use "hrsh7th/cmp-cmdline"
	  	use "hrsh7th/nvim-cmp"
	  	use "L3MON4D3/LuaSnip"
	  	use "saadparwaiz1/cmp_luasnip"
	  	use "williamboman/nvim-lsp-installer"
		use {
			"folke/trouble.nvim", 
			requires = "kyazdani42/nvim-web-devicons", 
			config = function()
			require("trouble").setup()
		end,
		}
		use 'onsails/lspkind.nvim'
		use 'tami5/lspsaga.nvim'
		use "rafamadriz/friendly-snippets"
		use { "williamboman/mason.nvim" }
		use 'rcarriga/nvim-notify'

		--icing of the cake
		use "nvim-lualine/lualine.nvim"
		use {
				'akinsho/bufferline.nvim', 
				tag = "v2.*", 
				requires = 'kyazdani42/nvim-web-devicons'
		}
		use({"rebelot/heirline.nvim"})
	  	use 'goolord/alpha-nvim'
	  	use "akinsho/toggleterm.nvim"
		use {
				"christianchiarulli/nvim-gps", 
				branch = "text_hl"
		}
		use "stevearc/dressing.nvim"
		use({
				"ziontee113/icon-picker.nvim",
				config = function()
						require("icon-picker")
				end,
		})
		use {
			'lewis6991/gitsigns.nvim',
			config = function()
				require('gitsigns').setup()
			end
		}

		use 'ellisonleao/glow.nvim'
		use "mhartington/formatter.nvim"
  	  	use "alvan/vim-closetag"
	  	use "jiangmiao/auto-pairs"
		use {
				'Pocco81/TrueZen.nvim',
				opt = true,
				event = "WinEnter",
				config = function ()
				require("true-zen").setup()
			end,
		}
        use "lukas-reineke/indent-blankline.nvim"
	
		--debugging
		use 'mfussenegger/nvim-dap'
		use "rcarriga/nvim-dap-ui"
		use "Pocco81/DAPInstall.nvim"
end)

