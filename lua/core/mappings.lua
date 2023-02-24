--keymaps
local keymap = vim.api.nvim_set_keymap
local buf_keymap = vim.api.nvim_buf_set_keymap

vim.g.mapleader = " "

keymap("n","<leader>q",":q<cr>", { noremap = true  })
keymap("n","<C-x><C-s>",":w<cr>", { noremap = true  })
keymap("n","<leader>i",":PackerInstall<cr>", { noremap = true})
keymap("n","<leader>c",":PackerClean<cr>", { noremap = true})
keymap("n","<leader>s",":PackerSync<cr>", { noremap = true})
keymap("n","<leader>h",":sp<cr>", { noremap = true })
keymap("n","<leader>v",":vsp<cr>", { noremap = true })
keymap("n","<C-n>", ":NeoTreeShowToggle<cr>",  { noremap = true })
-- keymap("n","<C-n>", ":NvimTreeToggle<cr>",  { noremap = true })
keymap("n","<leader>w", ":WhichKey<cr>", { noremap = true })
keymap("n","<leader>tc",":Telescope colorscheme<cr>", { noremap = true })
keymap("n","<leader>ff",":Telescope find_files<cr>", { noremap = true })
keymap("n","<leader>fo",":Telescope oldfiles<cr>", { noremap = true })
keymap("n","<leader>bm",":Telescope marks<cr>", { noremap = true })
keymap("n","<leader>fw",":Telescope live_grep<cr>", { noremap = true })
keymap("n","<C-h>",":Alpha<cr>", { noremap = true })
keymap("n","<leader>t",":ToggleTerm<cr>", { noremap = true })
keymap("n","<leader>pt", "<cmd>lua _pwsh_toggle()<cr>", { noremap = true })
keymap("n","<leader>pht", "<cmd>lua _pwshh_toggle()<cr>", { noremap = true })
keymap("n", "<Leader><Leader>i", "<cmd>PickIcons<cr>", { noremap = true })
keymap('n', '<space>e', '<cmd>lua vim.diagnostic.open_float()<CR>', { noremap = true })
keymap("n", "<Leader><Leader>i", "<cmd>IconPickerNormal<cr>", { noremap = true })
keymap("i", "<C-d>", "<cmd>lua vim.lsp.buf.hover()<CR>", { noremap = true })
keymap("n", "<C-d>", "<cmd>lua vim.lsp.buf.hover()<CR>", { noremap = true })
keymap("n", "<C-w>", "<cmd>bdelete<CR>", { noremap = true })
keymap("n", "<C-b><C-n>", "<cmd>bnext<CR>", { noremap = true })
keymap("n", "<C-b><C-p>", "<cmd>bprevious<CR>", { noremap = true })
