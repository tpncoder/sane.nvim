---depends om https://github.com/feline-nvim/feline.nvim
local present, feline = pcall(require, "feline")

if not present then
  return
end

local theme = {
  aqua = "#7AB0DF",
  bg = "#101317",
  blue = "#5FB0FC",
  cyan = "#70C0BA",
  darkred = "#FB7373",
  fg = "#C7C7CA",
  gray = "#1f2328",
  green = "#79DCAA",
  lime = "#54CED6",
  orange = "#FFD064",
  pink = "#D997C8",
  purple = "#C397D8",
  red = "#F87070",
  yellow = "#FFE59E"
}

local mode_theme = {
  ["NORMAL"] = theme.green,
  ["OP"] = theme.cyan,
  ["INSERT"] = theme.aqua,
  ["VISUAL"] = theme.red,
  ["LINES"] = theme.darkred,
  ["BLOCK"] = theme.orange,
  ["REPLACE"] = theme.purple,
  ["V-REPLACE"] = theme.pink,
  ["ENTER"] = theme.pink,
  ["MORE"] = theme.pink,
  ["SELECT"] = theme.darkred,
  ["SHELL"] = theme.cyan,
  ["TERM"] = theme.lime,
  ["NONE"] = theme.gray,
  ["COMMAND"] = theme.blue,
}

local component = {}

component.vim_mode = {
	provider = 'vi_mode',
  hl = function()
    return {
      fg = "#141b1e",
      bg = require("feline.providers.vi_mode").get_mode_color(),
      style = "bold",
      name = "NeovimModeHLColor",
    }
  end,
  left_sep = "block",
  right_sep = "block",
	icon = ''
}

component.git_branch = {
  provider = "git_branch",
  hl = {
    fg = "fg",
    bg = "bg",
  },
  left_sep = "block",
  right_sep = "",
}

component.git_add = {
  provider = "git_diff_added",
  hl = {
    fg = "green",
    bg = "bg",
  },
  left_sep = "",
  right_sep = "",
}

component.git_delete = {
  provider = "git_diff_removed",
  hl = {
    fg = "red",
    bg = "bg",
  },
  left_sep = "",
  right_sep = "",
}

component.git_change = {
  provider = "git_diff_changed",
  hl = {
    fg = "purple",
    bg = "bg",
  },
  left_sep = "",
  right_sep = "",
}

component.separator = {
  provider = "",
  hl = {
    fg = "bg",
    bg = "bg",
  },
}

component.diagnostic_errors = {
  provider = "diagnostic_errors",
  hl = {
    fg = "red",
  },
}

component.diagnostic_warnings = {
  provider = "diagnostic_warnings",
  hl = {
    fg = "yellow",
  },
}

component.diagnostic_hints = {
  provider = "diagnostic_hints",
  hl = {
    fg = "aqua",
  },
}

component.diagnostic_info = {
  provider = "diagnostic_info",
}

component.lsp = {
  provider = function()
    if not rawget(vim, "lsp") then
      return ""
    end

    local progress = vim.lsp.util.get_progress_messages()[1]
    if vim.o.columns < 120 then
      return ""
    end

    local clients = vim.lsp.get_active_clients({ bufnr = 0 })
    if #clients ~= 0 then
      if progress then
        local spinners = {
          " ◜ ",
          " ◠ ",
          " ◝ ",
          " ◞ ",
          " ◡ ",
          " ◟ ",
        }
        local ms = vim.loop.hrtime() / 1000000
        local frame = math.floor(ms / 120) % #spinners
        local content = string.format("%%<%s", spinners[frame + 1])
        return content or ""
      else
        return " לּ LSP"
      end
    end
    return ""
  end,
  hl = function()
    local progress = vim.lsp.util.get_progress_messages()[1]
    return {
      fg = progress and "yellow" or "green",
      bg = "gray",
      style = "bold",
    }
  end,
  left_sep = "",
  right_sep = "block",
}

component.file_type = {
  provider = {
    name = "file_info",
  },
	type = 'relative',
  hl = {
    fg = "fg",
    bg = "gray",
  },
  left_sep = "block",
  right_sep = "block",
}

local left = {
	component.vim_mode,
  component.file_type,
}
local middle = {
  component.diagnostic_errors,
  component.diagnostic_warnings,
  component.diagnostic_info,
  component.diagnostic_hints,
}
local right = {
	component.git_branch,
  component.separator,

}

local components = {
  active = {
    left,
    middle,
    right,
  },
}

feline.setup({
  components = components,
  theme = theme,
  vi_mode_colors = mode_theme,
})

