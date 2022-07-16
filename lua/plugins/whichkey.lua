local status_ok, which_key = pcall(require, "which-key")
if not status_ok then
  return
end

local setup = {
  plugins = {
    marks = true, -- shows a list of your marks on ' and `
    registers = true, -- shows your registers on " in NORMAL or <C-r> in INSERT mode
    spelling = {
      enabled = true, -- enabling this will show WhichKey when pressing z= to select spelling suggestions
      suggestions = 20, -- how many suggestions should be shown in the list?
    },
    -- the presets plugin, adds help for a bunch of default keybindings in Neovim
    -- No actual key bindings are created
    presets = {
      operators = true, -- adds help for operators like d, y, ... and registers them for motion / text object completion
      motions = true, -- adds help for motions
      text_objects = true, -- help for text objects triggered after entering an operator
      windows = true, -- default bindings on <c-w>
      nav = true, -- misc bindings to work with windows
      z = true, -- bindings for folds, spelling and others prefixed with z
      g = true, -- bindings for prefixed with g
    },
  },
  -- add operators that will trigger motion and text object completion
  -- to enable all native operators, set the preset / operators plugin above
  -- operators = { gc = "Comments" },
  key_labels = {
    -- override the label used to display some keys. It doesn't effect WK in any other way.
    -- For example:
    -- ["<space>"] = "SPC",
    -- ["<CR>"] = "RET",
    -- ["<tab>"] = "TAB",
  },
  icons = {
    breadcrumb = "»", -- symbol used in the command line area that shows your active key combo
    separator = "➜", -- symbol used between a key and it's label
    group = "+", -- symbol prepended to a group
  },
  popup_mappings = {
    scroll_down = "<c-j>", -- binding to scroll down inside the popup
    scroll_up = "<c-k>", -- binding to scroll up inside the popup
  },
  window = {
    border = "single", -- none, single, double, shadow
    position = "bottom", -- bottom, top
    margin = { 1, 0, 1, 0 }, -- extra window margin [top, right, bottom, left]
    padding = { 2, 2, 2, 2 }, -- extra window padding [top, right, bottom, left]
    winblend = 0,
  },
  layout = {
    height = { min = 4, max = 25 }, -- min and max height of the columns
    width = { min = 20, max = 50 }, -- min and max width of the columns
    spacing = 3, -- spacing between columns
    align = "left", -- align columns left, center or right
  },
  ignore_missing = true, -- enable this to hide mappings for which you didn't specify a label
  hidden = { "<silent>", "<cmd>", "<Cmd>", "<CR>", "call", "lua", "^:", "^ " }, -- hide mapping boilerplate
  show_help = true, -- show help message on the command line when the popup is visible
  triggers = "auto", -- automatically setup triggers
  -- triggers = {"<leader>"} -- or specify a list manually
  triggers_blacklist = {
    -- list of mode / prefixes that should never be hooked by WhichKey
    -- this is mostly relevant for key maps that start with a native binding
    -- most people should not need to change this
    i = { "j", "k" },
    v = { "j", "k" },
  },
}

local leader_opts = {
  mode = "n", -- NORMAL mode
  prefix = "<leader>",
  buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
  silent = true, -- use `silent` when creating keymaps
  noremap = true, -- use `noremap` when creating keymaps
  nowait = true, -- use `nowait` when creating keymaps
}

local leader_mappings = {
  ["a"] = { "<cmd>Alpha<CR>", "Alpha" },

  ["b"] = {
    "<cmd>lua require('telescope.builtin').buffers()<CR>",
    "Buffers",
  },

   d = {
    name = "Debug",
    t = { "<cmd>lua require'dap'.toggle_breakpoint()<CR>", "Toggle Breakpoint" },
    b = { "<cmd>lua require'dap'.step_back()<CR>", "Step Back" },
    c = { "<cmd>lua require'dap'.continue()<CR>", "Continue" },
    C = { "<cmd>lua require'dap'.run_to_cursor()<CR>", "Run To Cursor" },
    d = { "<cmd>lua require'dap'.disconnect()<CR>", "Disconnect" },
    g = { "<cmd>lua require'dap'.session()<CR>", "Get Session" },
    i = { "<cmd>lua require'dap'.step_into()<CR>", "Step Into" },
    o = { "<cmd>lua require'dap'.step_over()<CR>", "Step Over" },
    u = { "<cmd>lua require'dap'.step_out()<CR>", "Step Out" },
    p = { "<cmd>lua require'dap'.pause.toggle()<CR>", "Pause" },
    r = { "<cmd>lua require'dap'.repl.toggle()<CR>", "Toggle Repl" },
    s = { "<cmd>lua require'dap'.continue()<CR>", "Start" },
    q = { "<cmd>lua require'dap'.close()<CR>", "Quit" },
    l = { "<cmd>lua require'osv'.run_this()<CR>", "Debug Lua" },
  },

  f = {
    name = "Find",
    b = { "<cmd>Telescope git_branches<CR>", "Checkout branch" },
    c = { "<cmd>Telescope colorscheme<CR>", "Colorscheme" },
    f = {
      [[<cmd>lua require('telescope.builtin').find_files()<CR>]],
      "Find files",
    },
    F = {
      "<cmd>lua require('telescope.builtin').find_files({no_ignore=true})<CR>",
      "Find files but no ignore",
    },
    t = { "<cmd>Telescope live_grep theme=ivy<CR>", "Find Text" },
    h = { "<cmd>Telescope help_tags<CR>", "Help" },
    l = { "<cmd>Telescope resume<CR>", "Last Search" },
    M = { "<cmd>Telescope man_pages<CR>", "Man Pages" },
    r = { "<cmd>Telescope oldfiles<CR>", "Recent File" },
    R = { "<cmd>Telescope registers<CR>", "Registers" },
    k = { "<cmd>Telescope keymaps<CR>", "Keymaps" },
    C = { "<cmd>Telescope commands<CR>", "Commands" },
  },

  l = {
    name = "LSP",
    a = { "<cmd>lua vim.lsp.buf.code_action()<CR>", "Code Action" },
    d = {
      "<cmd>Telescope lsp_document_diagnostics<CR>",
      "Document Diagnostics",
    },
    w = {
      "<cmd>Telescope lsp_workspace_diagnostics<CR>",
      "Workspace Diagnostics",
    },
    f = { "<cmd>lua vim.lsp.buf.formatting()<CR>", "Format" },
    i = { "<cmd>LspInfo<CR>", "Info" },
    I = { "<cmd>LspInstallInfo<CR>", "Installer Info" },
    j = {
      "<cmd>lua vim.diagnostic.goto_next()<CR>",
      "Next Diagnostic",
    },
    k = {
      "<cmd>lua vim.diagnostic.goto_prev()<CR>",
      "Prev Diagnostic",
    },
    l = { "<cmd>lua vim.lsp.codelens.run()<CR>", "CodeLens Action" },
    q = { "<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>", "Quickfix" },
    s = { "<cmd>Telescope lsp_document_symbols<CR>", "Document Symbols" },
    S = {
      "<cmd>Telescope lsp_dynamic_workspace_symbols<CR>",
      "Workspace Symbols",
    },
    n = { '<cmd>lua require("renamer").rename()<CR>', "Rename" }
  },

  m = {
    name = "Markdown",
    p = { "<cmd>Glow<CR>", "Preview Markdown" },
  },

  ["n"] = { "<cmd>noh<CR>", "Clear Highlight" },

  p = {
    name = "Packer",
    c = { "<cmd>PackerCompile<CR>", "Compile" },
	C = { "<cmd>PackerClean<CR>", "Clean" },
    i = { "<cmd>PackerInstall<CR>", "Install" },
    s = { "<cmd>PackerSync<CR>", "Sync" },
    S = { "<cmd>PackerStatus<CR>", "Status" },
    u = { "<cmd>PackerUpdate<CR>", "Update" },
  },

  s = {
    name = "Rust Tools",
    r = { "<cmd>RustRunnables<CR>", "Runnables List" },
    d = { "<cmd>RustDebuggables<CR>", "Debuggables List" },
    e = { "<cmd>RustExpandMacro<CR>", "Expand Macro" },
    j = { "<cmd>RustMoveItemDown<CR>", "Move Item Down" },
    k = { "<cmd>RustMoveItemUp<CR>", "Move Item Up" },
    K = { "<cmd>lua require('user.utils.rust-crate-doc')()<CR>", "Hover Me" },
    R = { "<cmd>RustHoverRange<CR>", "Hover Range Me" },
    o = { "<cmd>RustOpenCargo<CR>", "Open Cargo" },
    l = { "<cmd>RustJoinLines<CR>", "Join Lines" },
    v = { "<cmd>lua require('crates').show_versions_popup()<CR>", "Show Versions Popup" },
    f = { "<cmd>lua require('crates').show_features_popup()<CR>", "Show Features Popup" },
    D = { "<cmd>lua require('crates').show_dependencies_popup()<CR>", "Show Dependencies Popup" },
    u = { "<cmd>lua require('crates').update_crate()<CR>", "Update Crate" },
    U = { "<cmd>lua require('crates').update_all_crates()<CR>", "Update All Crates" },
    p = { "<cmd>lua require('crates').upgrade_crate()<CR>", "Upgrade Crate" },
    P = { "<cmd>lua require('crates').upgrade_all_crates()<CR>", "Upgrade All Crates" },
    h = { "<cmd>lua require('crates').open_homepage()<CR>", "Open Homepage" }
  },

  t = {
    name = "Terminal",
    f = { "<cmd>ToggleTerm direction=float<CR>", "Float" },
    h = { "<cmd>ToggleTerm size=10 direction=horizontal<CR>", "Horizontal" },
    v = { "<cmd>ToggleTerm size=80 direction=vertical<CR>", "Vertical" },
	p = { "<cmd>lua _pwsh_toggle()<CR>", "Powershell" },
  },

  T = {
    name = "Todo",
    t = { "<cmd>TodoTelescope<CR>", "Show todos" },
  },
}

which_key.setup(setup)
which_key.register(leader_mappings, leader_opts)
