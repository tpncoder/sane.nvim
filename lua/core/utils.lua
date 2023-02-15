local vim = vim
local opt = vim.opt
local g = vim.g
local cmd = vim.cmd

opt.termguicolors = true
opt.number = true
opt.cursorline=true
opt.mousemoveevent=true
opt.shiftwidth = 2
opt.tabstop = 2
opt.foldexpr="nvim_treesitter#foldexpr()"
opt.foldtext="getline(v:foldstart).'...'.trim(getline(v:foldend))"
opt.fillchars:append { eob = " " }
opt.laststatus = 3
opt.foldcolumn = '1'
opt.foldlevel = 99
opt.foldlevelstart = 99
opt.foldenable = true
opt.fillchars = [[eob: ,fold: ,foldopen:,foldsep: ,foldclose:]]

g.foldnestmax=3
g.foldminlines=1
g.foldmethod=expr
g.mouse=a

cmd[[set fillchars+=vert:\  ]]
cmd[[set fillchars=fold:\\ ]]
