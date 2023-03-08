--[[ vim.g.nvim_tree_width = 25
require 'nvim-tree'.setup {
  renderer = {
    indent_markers = {
      enable = false,
    },
    icons = {
      glyphs = {
        default = '',
        symlink = '',
      },
      show = {
        git = true,
        folder = true,
        file = true,
        folder_arrow = true,
      }
    }
  },
  actions = {
    open_file = {
      window_picker = {
        exclude = {
          filetype = {
            "packer",
            "qf"
          },
          buftype = {
            "terminal",
            "help"
          }
        },
      },
    },
  },
  filters = {
    exclude = { '.git', 'node_modules', '.cache' },
  },
  update_focused_file = {
    enable = true,
    update_root = true,
  },

  hijack_directories = { enable = true },
  view = {
    hide_root_folder = true,
    mappings = {
      list = {
        { key = 'l',    action = "edit" },
        { key = 'o',    action = "edit" },
        { key = '<cr>', action = "edit" },
        { key = 'I',    action = "toggle_ignored" },
        { key = 'H',    action = "toggle_dotfiles" },
        { key = 'R',    action = "refresh" },
        { key = '=',    action = "preview" },
        { key = 'X',    action = "xdg_open",       action_cb = xdg_open }
      }
    }
  },
}
vim.cmd [[
autocmd BufEnter * ++nested if winnr('$') == 1 && bufname() == 'NvimTree_' . tabpagenr() | quit | endif
nnoremap <leader>cd :cd %:p:h<CR>:pwd<CR>
]]

local present, nvimtree = pcall(require, "nvim-tree")

if not present then
  return
end

local options = {
  filters = {
    dotfiles = false,
  },
  disable_netrw = true,
  hijack_netrw = true,
  hijack_cursor = true,
  hijack_unnamed_buffer_when_opening = false,
  update_cwd = true,
  update_focused_file = {
    enable = true,
    update_cwd = false,
  },
  view = {
    adaptive_size = true,
    side = "left",
    width = 35,
    hide_root_folder = true,
  },
  git = {
    enable = false,
    ignore = true,
  },
  filesystem_watchers = {
    enable = true,
  },
  actions = {
    open_file = {
      resize_window = true,
    },
  },
  renderer = {
    highlight_git = false,
    highlight_opened_files = "none",

    indent_markers = {
      enable = false,
    },

    icons = {
      show = {
        file = true,
        folder = true,
        folder_arrow = true,
        git = false,
      },

      glyphs = {
        default = "",
        symlink = "",
        folder = {
          default = "",
          empty = "",
          empty_open = "",
          open = "",
          symlink = "",
          symlink_open = "",
          arrow_open = "",
          arrow_closed = "",
        },
        git = {
          unstaged = "✗",
          staged = "✓",
          unmerged = "",
          renamed = "➜",
          untracked = "★",
          deleted = "",
          ignored = "◌",
        },
      },
    },
  },
}

nvimtree.setup(options)
