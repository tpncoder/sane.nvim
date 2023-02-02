require('core.colorscheme')
require('core.mappings')
require('core.utils')
require('core.statuscolumn')
require('core.autocommands')
require('plugins.lsp')
require('plugins.alpha')
require('plugins.bufferline')
require('plugins.cmp')
require('plugins.nvimtree')
require('plugins.others')
require('plugins.statusline')
require('plugins.telescope')
require('plugins.terminal')
require('plugins.treesitter')
require('plugins.whichkey')

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)-- example using a list of specs with the default options
vim.g.mapleader = " " -- make sure to set `mapleader` before lazy so your mappings are correct

require("lazy").setup("core.plugins")
