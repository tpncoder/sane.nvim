vim.opt.termguicolors = true
vim.wo.number = true
vim.cmd[[let g:dashboard_default_executive ="telescope"]]
vim.cmd[[set mouse=a]]
vim.cmd[[autocmd BufEnter * ++nested if winnr('$') == 1 && bufname() == 'NvimTree_' . tabpagenr() | quit | endif]]
vim.cmd[[autocmd FileType Alpha set showtabline=0 | autocmd WinLeave <buffer> set showtabline=3]]
vim.cmd[[:set cursorline]]
vim.cmd[[set noshowmode]]
vim.cmd[[hi statusline guibg=nvim_treebg guifg=nvim_treebg]]

local vim = vim
local opt = vim.opt
--opt.foldmethod = "indent"
opt.foldexpr = "nvim_treesitter#foldexpr()"
vim.cmd[[setlocal foldignore=]]
vim.opt.fillchars:append { eob = " " }
vim.opt.laststatus = 3

require("nvim-lsp-installer").setup {}
require("which-key").setup {}

local M = {}

vim.api.nvim_set_hl(0, 'WinBarPath', { bg = '#dedede', fg = '#363636' })
vim.api.nvim_set_hl(0, 'WinBarModified', { bg = '#dedede', fg = '#ff3838' })

vim.api.nvim_create_autocmd({ "CursorMoved", "BufWinEnter", "BufFilePost", "InsertEnter", "BufWritePost" }, {
  callback = function()
    require("core.winbar").get_winbar()
  end,
})
