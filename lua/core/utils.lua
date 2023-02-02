vim.opt.termguicolors = true
vim.wo.number = true
vim.cmd[[let g:dashboard_default_executive ="telescope"]]
vim.cmd[[set mouse=a]]
vim.cmd[[autocmd BufEnter * ++nested if winnr('$') == 1 && bufname() == 'NvimTree_' . tabpagenr() | quit | endif]]
vim.cmd[[autocmd FileType Alpha set showtabline=-1 | autocmd WinLeave <buffer> set showtabline=3]]
vim.cmd[[:set cursorline]]
vim.cmd[[set noshowmode]]
vim.cmd[[hi statusline guibg=nvim_treebg guifg=nvim_treebg]]
vim.cmd[[set mousemoveevent]]
vim.cmd[[set shiftwidth=2]]
vim.cmd[[set tabstop=2]]

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
require("noice").setup({
  lsp = {
    -- override markdown rendering so that **cmp** and other plugins use **Treesitter**
    override = {
      ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
      ["vim.lsp.util.stylize_markdown"] = true,
      ["cmp.entry.get_documentation"] = true,
    },
  },
  -- you can enable a preset for easier configuration
  presets = {
    bottom_search = true, -- use a classic bottom cmdline for search
    command_palette = true, -- position the cmdline and popupmenu together
    long_message_to_split = true, -- long messages will be sent to a split
    inc_rename = false, -- enables an input dialog for inc-rename.nvim
    lsp_doc_border = false, -- add a border to hover docs and signature help
  },
})
require("todo-comments").setup()

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

local vim = vim
local api = vim.api
local M = {}
-- function to create a list of commands and convert them to autocommands
-------- This function is taken from https://github.com/norcalli/nvim_utils
function M.nvim_create_augroups(definitions)
    for group_name, definition in pairs(definitions) do
        api.nvim_command('augroup '..group_name)
        api.nvim_command('autocmd!')
        for _, def in ipairs(definition) do
            local command = table.concat(vim.tbl_flatten{'autocmd', def}, ' ')
            api.nvim_command(command)
        end
        api.nvim_command('augroup END')
    end
end


local autoCommands = {
    -- other autocommands
    open_folds = {
        {"BufReadPost,FileReadPost", "*", "normal zR"}
    }
}

M.nvim_create_augroups(autoCommands)

vim.cmd[[set fillchars+=vert:\ ]]
