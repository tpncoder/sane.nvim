if StatusColumn then
  return
end

local icons = {
  misc = {
    collapsed = " ",
    expanded = " ",
  }
}

local excluded_filetypes_for_ornaments = {
  ['terminal'] = true,
  ['toggleterm'] = true,
  ['prompt'] = true,
  ['NvimTree'] = true,
  ['alpha'] = true,
	['neo-tree'] = true
}

local excluded_filetypes_for_line_num = {
  ['terminal'] = true,
  ['toggleterm'] = true,
  ['prompt'] = true,
  ['NvimTree'] = true,
  ['alpha'] = true,
	['neo-tree'] = true
}

_G.StatusColumn = {
  handler = {
    fold = function()
      local lnum = vim.fn.getmousepos().line

      -- Only lines with a mark should be clickable
      if vim.fn.foldlevel(lnum) <= vim.fn.foldlevel(lnum - 1) then
        return
      end

      local state
      if vim.fn.foldclosed(lnum) == -1 then
        state = "close"
      else
        state = "open"
      end

      vim.cmd.execute("'" .. lnum .. "fold" .. state .. "'")
    end
  },

  display = {
    line_num = function()
      if excluded_filetypes_for_line_num[vim.bo.filetype] then
        return ""
      end

      local lnum = tostring(vim.v.lnum)

      if vim.v.wrap then
        return " " .. string.rep(" ", #lnum)
      end

      if #lnum == 1 then
        return " " .. lnum
      else
        return lnum
      end
    end,

    fold = function()
      if excluded_filetypes_for_ornaments[vim.bo.filetype] then
        return ""
      end

      if vim.v.wrap then
        return ""
      end

      local lnum = vim.v.lnum
      local icon = "  "

      -- Line isn't in folding range
      if vim.fn.foldlevel(lnum) <= 0 then
        return icon
      end

      -- Not the first line of folding range
      if vim.fn.foldlevel(lnum) <= vim.fn.foldlevel(lnum - 1) then
        return icon
      end

      if vim.fn.foldclosed(lnum) == -1 then
        icon = icons.misc.expanded
      else
        icon = icons.misc.collapsed
      end

      return icon
    end,

    padding = function()
      if excluded_filetypes_for_ornaments[vim.bo.filetype] then
        return ""
      end

      return " "
    end
  },


  sections = {
		spacing = {
			[[  ]]
		},
    sign_column = {
      [[%s]],
    },
    line_number = {
      [[%=%{v:lua.StatusColumn.display.line_num()}]]
    },
    spacing     = {
      [[ ]]
    },
    folds       = {
      [[%#FoldColumn#]], -- HL
      [[%@v:lua.StatusColumn.handler.fold@]],
      [[%{v:lua.StatusColumn.display.fold()}]]
    },
    border      = {
      [[%#StatusColumnBorder#]], -- HL
      -- I don't like the border, but I might change my mind
    },
    padding     = {
      [[%#StatusColumnBuffer#]], -- HL
      [[%{v:lua.StatusColumn.display.padding()}]]
    },
  },

  build = function(tbl)
    local statuscolumn = {}

    for _, value in ipairs(tbl) do
      if type(value) == "string" then
        table.insert(statuscolumn, value)
      elseif type(value) == "table" then
        table.insert(statuscolumn, StatusColumn.build(value))
      end
    end

    return table.concat(statuscolumn)
  end,

  set_window = function(value)
    vim.defer_fn(function()
      vim.api.nvim_win_set_option(vim.api.nvim_get_current_win(), "statuscolumn", value)
    end, 1)
  end
}

vim.opt.statuscolumn = StatusColumn.build({
  StatusColumn.sections.spacing,
  StatusColumn.sections.sign_column,
  StatusColumn.sections.line_number,
  StatusColumn.sections.spacing,
  StatusColumn.sections.folds,
  StatusColumn.sections.border,
  StatusColumn.sections.padding
})

