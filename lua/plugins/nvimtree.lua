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
      side = "left",
      width = 27,
      hide_root_folder = true,
   },
   git = {
      enable = false,
      ignore = true,
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
         enable = true,
      },

      icons = {
         show = {
            file = true,
            folder = true,
            folder_arrow = false,
            git = false,
         },

         glyphs = {
            default = "",
            symlink = "",
            folder = {
               default = " ",
               empty = " ",
               empty_open = " ",
               open = " ",
               symlink = "",
               symlink_open = " ",
               arrow_open = "",
               arrow_closed = "",
			   arrow_closed = "",
               arrow_open = "",
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
