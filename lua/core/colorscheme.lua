local defaults = {
  -- Neovim theme.
  theme = "radium_dark",
  ---Enable theme cycles and history tracking. This will keep track of previous
  ---and next themes
  ---so you can switch back and forth between them.
  cycle = true,
  ---Skip loading extensions when colo is first loaded i.e. only set the colorscheme.
  manual = true,
  ---Set the inverted version of the theme.
  ---WARN: This will not change the source colors itself. It will only change the
  ---current highlights. So, if one decides to import colors from the theme after
  ---inversion then the imported colors would not be inverted.
  inverted = false,
  ---This sets mappings. Note that mappings.items is just a table that passes values
  ---through |vim.keymap.set()|
  mappings = {
    enable = false,
    items = {
      {
        mode = "n",
        key = ";a",
        action = vim.cmd.ColoPrevious,
        options = {
          silent = true
        }
      },
      {
        mode = "n",
        key = ";s",
        action = vim.cmd.ColoInvert,
        options = {
          silent = true
        }
      },
      {
        mode = "n",
        key = ";d",
        action = vim.cmd.ColoNext,
        options = {
          silent = true
        }
      },
      {
        mode = "n",
        key = "<leader>t",
        action = vim.cmd.ColoTele,
        options = {
          silent = true
        }
      },
    },
  },
  ---Configure builtin extension and your own custom extensions.
  ---Don't install them if all of them are set to false
  extensions = {
    feline = {
      enable = true,
      module = "colo.extensions.feline",
      options = {},
    },
    bufferline = {
      enable = false,
      module = "colo.extensions.bufferline",
      options = {},
    },
    devicons = {
      enable = false,
      module = "colo.extensions.devicons",
      options = {},
    },
  },
  ---Add, remove and toggle font styles for some specific highlights.
  aggregates = {
    enable = false,
    items = {
      bold = false,
      undercurl = false,
      underline = false,
      italic = true,
      transparent = false,
    },
  },
  ---Extra highlights. These will be sourced after overrides.
  custom_hl = {
    enable = false,
    items = {
      LspDiagnosticsSignWarn = { link = "DevIconHtm" },
      LspDiagnosticsSignError = { link = "DevIconJava" },
      LspDiagnosticsSignInfo = { link = "DevIconCobol" },
      LspDiagnosticsSignHint = { link = "DevIconMaterial" },
    },
  },
  ---Special style options.
  presets = {
    enable = false,
    items = {
      italic_comments = false,
      dotted_spell = false,
      contrast = false,
    },
  },
  ---Options regarding the telescope theme picker.
  telescope = {
    theme = "ivy",
    results_title = false,
    sorting_strategy = "ascending",
    layout_strategy = "center",
    layout_config = {
      preview_cutoff = 1,
      width = function(_, max_columns, _)
        return math.min(max_columns, 60)
      end,
      height = function(_, _, max_lines)
        return math.min(max_lines, 20)
      end,
    },
    border = true,
    borderchars = {
      prompt = { "─", "│", " ", "│", "╭", "╮", "│", "│" },
      results = { "─", "│", "─", "│", "├", "┤", "╯", "╰" },
      preview = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" },
    },
    separator = "┃  ",
    ---Exclude theme file patterns that you do not want to show in the picker.
    exclude = {
      "^sexy_",
      "^tempus_",
      "^base16_",
      "^dkeg_",
      "^stardew_",
      "^decay_",
      "^hybrid_",
    },
    ---Highlights for theme categories and variants.
    highlights = {
      ---Theme variant color marking.
      background = {
        dark = "@debug",
        light = "@label",
      },
      ---Theme category color marking.
      pack = {
        ["base16"] = "Operator",
        ["single"] = "Directory",
        ["sexy"] = "Keyword",
        ["decay"] = "Question",
        ["dkeg"] = "Macro",
        ["stardew"] = "Number",
        ["hybrid"] = "Todo",
        ["tempus"] = "Float",
      },
    },
  },
}

