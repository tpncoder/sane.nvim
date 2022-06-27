require("nvim-lsp-installer").setup({
   ensure_installed = { "cssls", "sumneko_lua", "clangd", "omnisharp", "gopls" }, -- ensure these servers are always installed
   automatic_installation = true, -- automatically detect which servers to install (based on which servers are set up via lspconfig)
   	ui = {
        icons = {
            server_installed = "✓",
            pending = "➜",
            server_uninstalled = "✗"
        }
    }
})

require"lspconfig".pyright.setup{}
require"lspconfig".cssls.setup{}
require"lspconfig".clangd.setup{}
require"lspconfig".omnisharp.setup{}
require"lspconfig".gopls.setup{}
require"lspconfig".sumneko_lua.setup{}
