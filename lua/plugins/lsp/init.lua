require("nvim-lsp-installer").setup({
   ensure_installed = { "cssls", "sumneko_lua", "clangd", "rust-analyzer"}, -- ensure these servers are always installed
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
require"lspconfig".rust_analyzer.setup{}
require"lspconfig".sumneko_lua.setup{}

vim.lsp.handlers["textDocument/publishDiagnostics"] =
  vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
    underline = false,
    update_in_insert = false,
    virtual_text = true
  })

  local lspsaga = require 'lspsaga'
lspsaga.setup { -- defaults ...
  debug = false,
  use_saga_diagnostic_sign = true,
  -- diagnostic sign
  error_sign = "",
  warn_sign = "",
  hint_sign = "",
  infor_sign = "",
  diagnostic_header_icon = "   ",
  -- code action title icon
  code_action_icon = " ",
  code_action_prompt = {
    enable = true,
    sign = true,
    sign_priority = 40,
    virtual_text = true,
  },
  finder_definition_icon = "  ",
  finder_reference_icon = "  ",
  max_preview_lines = 10,
  finder_action_keys = {
    open = "o",
    vsplit = "s",
    split = "i",
    quit = "q",
    scroll_down = "<C-f>",
    scroll_up = "<C-b>",
  },
  code_action_keys = {
    quit = "q",
    exec = "<CR>",
  },
  rename_action_keys = {
    quit = "<C-c>",
    exec = "<CR>",
  },
  definition_preview_icon = "  ",
  border_style = "single",
  rename_prompt_prefix = "➤",
  rename_output_qflist = {
    enable = false,
    auto_open_qflist = false,
  },
  server_filetype_map = {},
  diagnostic_prefix_format = "%d. ",
  diagnostic_message_format = "%m %c",
  highlight_prefix = false,
}
vim.diagnostic.config({
    virtual_text = false,
    signs = true,
    float = { border = "single" },
})
