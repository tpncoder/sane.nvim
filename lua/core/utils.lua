vim.opt.termguicolors = true
vim.wo.number = true
vim.cmd[[let g:dashboard_default_executive ="telescope"]]
vim.cmd[[set mouse=a]]
vim.cmd[[autocmd BufEnter * ++nested if winnr('$') == 1 && bufname() == 'NvimTree_' . tabpagenr() | quit | endif]]
vim.cmd[[autocmd FileType Alpha set showtabline=-1 | autocmd WinLeave <buffer> set showtabline=3]]
vim.cmd[[:set cursorline]]
vim.cmd[[set noshowmode]]
vim.cmd[[hi statusline guibg=nvim_treebg guifg=nvim_treebg]]
vim.cmd[[set tabstop=4]]
vim.cmd[[set mousemoveevent]]
vim.cmd[[set shiftwidth=4]]
vim.cmd[[set tabstop=4]]

local vim = vim
local opt = vim.opt
--opt.foldmethod = "indent"
opt.foldexpr = "nvim_treesitter#foldexpr()"
vim.cmd[[setlocal foldignore=]]
vim.opt.fillchars:append { eob = " " }
vim.opt.laststatus = 3

vim.cmd [[highlight IndentBlanklineIndent1 guifg=#E06C75 gui=nocombine]]
vim.cmd [[highlight IndentBlanklineIndent2 guifg=#E5C07B gui=nocombine]]
vim.cmd [[highlight IndentBlanklineIndent3 guifg=#98C379 gui=nocombine]]
vim.cmd [[highlight IndentBlanklineIndent4 guifg=#56B6C2 gui=nocombine]]
vim.cmd [[highlight IndentBlanklineIndent5 guifg=#61AFEF gui=nocombine]]
vim.cmd [[highlight IndentBlanklineIndent6 guifg=#C678DD gui=nocombine]]

require("nvim-lsp-installer").setup {}
require("which-key").setup {}
require('gitsigns').setup()
require('Comment').setup()

require("indent_blankline").setup {
    space_char_blankline = " ",
    show_current_context = true,
    show_current_context_start = true,
	space_char_blankline = " ",
    char_highlight_list = {
        "IndentBlanklineIndent1",
        "IndentBlanklineIndent2",
        "IndentBlanklineIndent3",
        "IndentBlanklineIndent4",
        "IndentBlanklineIndent5",
        "IndentBlanklineIndent6",
    },
}

local M = {}

vim.api.nvim_set_hl(0, 'WinBarPath', { bg = '#dedede', fg = '#363636' })
vim.api.nvim_set_hl(0, 'WinBarModified', { bg = '#dedede', fg = '#ff3838' })

vim.o.foldcolumn = '1'
vim.o.foldlevel = 99
vim.o.foldlevelstart = 99
vim.o.foldenable = true
vim.o.fillchars = [[eob: ,fold: ,foldopen:,foldsep: ,foldclose:]]
