local conditions = require("heirline.conditions")
local utils = require("heirline.utils")
local colors = require("catppuccin.palettes").get_palette()
local conditions = require("heirline.conditions")

local Align = { provider = "%=", hl = { bg = '#101419' } }

local ViMode = {
    init = function(self)
        self.mode = vim.fn.mode(1) -- :h mode()
        if not self.once then
            vim.api.nvim_create_autocmd("ModeChanged", {
                pattern = "*:*o",
                command = 'redrawstatus'
            })
            self.once = true
        end
    end,
    static = {
        mode_names = { -- change the strings if you like it vvvvverbose!
			["n"] = "NORMAL",
					["no"] = "OP",
					["nov"] = "OP",
					["noV"] = "OP",
					["no"] = "OP",
					["niI"] = "NORMAL",
					["niR"] = "NORMAL",
					["niV"] = "NORMAL",
					["v"] = "VISUAL",
					["vs"] = "VISUAL",
					["V"] = "LINES",
					["Vs"] = "LINES",
					[""] = "BLOCK",
					["s"] = "BLOCK",
					["s"] = "SELECT",
					["S"] = "SELECT",
					[""] = "BLOCK",
					["i"] = "INSERT",
					["ic"] = "INSERT",
					["ix"] = "INSERT",
					["R"] = "REPLACE",
					["Rc"] = "REPLACE",
					["Rv"] = "V-REPLACE",
					["Rx"] = "REPLACE",
					["c"] = "COMMAND",
					["cv"] = "COMMAND",
					["ce"] = "COMMAND",
					["r"] = "ENTER",
					["rm"] = "MORE",
					["r?"] = "CONFIRM",
					["!"] = "SHELL",
					["t"] = "TERM",
					["nt"] = "TERM",
					["null"] = "NONE",
        },
        mode_colors = {
            n = "#70a5eb" ,
            i = "#78dba9",
            v = "#e05f65",
            V =  "#e05f65",
            ["\22"] =  "#74bee9",
            c =  "#78dba9",
            s =  "#c68aee",
            S =  "#c68aee",
            ["\19"] =  "#c68aee",
            R =  "#e5646a",
            r =  "#e5646a",
            ["!"] =  "#e5646a",
            t =  "#e5646a",
        }
    },
    provider = function(self)
        return "▍ %2("..self.mode_names[self.mode].."%) "
    end,
    hl = function(self)
        local mode = self.mode:sub(1, 1) -- get only the first mode character
        return { fg = self.mode_colors[mode], bold = true, bg="#1f2328"}
    end,
    update = {
        "ModeChanged",
    },
}

local FileNameBlock = {
	init = function(self)
		self.filename = vim.api.nvim_buf_get_name(0)
	end,
	condition = conditions.buffer_not_empty,
	hl = { bg = '#101419', fg = colors.subtext1 },
}

local FileIcon = {
	init = function(self)
		local filename = self.filename
		local extension = vim.fn.fnamemodify(filename, ":e")
		self.icon, self.icon_color = require("nvim-web-devicons").get_icon_color(
			vim.fn.fnamemodify(filename, ":t"),
			extension,
			{ default = true }
		)
	end,
	provider = function(self)
		return self.icon and (" " .. self.icon .. " ")
	end,
	hl = function(self)
		return { fg = self.icon_color }
	end,
}
local FileName = {
	provider = function(self)
	local filename = vim.fn.fnamemodify(self.filename, ":~:.")
		if filename == "" then
			return " no file opened"
		end
		if filename == "NvimTree_1" then
			return " Nvim Tree"
		end

		if filename == "t//~/.c/n//2/b/zsh;#toggleterm#1" then
				return " toggleterm"
		end

		if not conditions.width_percent_below(#filename, 0.25) then
			filename = vim.fn.pathshorten(filename)
		end
		return filename
	end,
	hl = { fg = colors.subtext1, bold = true },
}

local FileFlags = {
	{
		condition = function()
			return vim.bo.modified
		end,
		provider = " ● ",
		hl = { fg = colors.lavender },
	},
	{
		condition = function()
			return not vim.bo.modifiable or vim.bo.readonly
		end,
		provider = "",
			hl = { fg = red },
		},
}

local FileNameModifer = {
	hl = function()
		if vim.bo.modified then
			return { fg = colors.text, bold = true, force = true }
		end
	end,
}

FileNameBlock = utils.insert(
	FileNameBlock,
		FileIcon,
		utils.insert(FileNameModifer, FileName),
		unpack(FileFlags),
		{ provider = "%< " }
	)

local FileType = {
	provider = function()
		return " " .. string.upper(vim.bo.filetype) .. " "
	end,
	hl = { bg = '#101419', fg = colors.surface2 },
}

local LSPActive = {
	update = { "LspAttach", "LspDetach" },
	provider = function()
	local names = {}
		for _, server in pairs(vim.lsp.get_active_clients()) do
			if server.name ~= "null-ls" then
				table.insert(names, server.name)
			end
		end
		return "▍  " .. table.concat(names, " ") .. "   "
	end,
	hl = {fg = '#4d82c8', bold = true, italic = false },
}
local Diagnostics = {
    condition = conditions.has_diagnostics,

    static = {
        error_icon = vim.fn.sign_getdefined("DiagnosticSignError")[1].text,
        warn_icon = vim.fn.sign_getdefined("DiagnosticSignWarn")[1].text,
        info_icon = vim.fn.sign_getdefined("DiagnosticSignInfo")[1].text,
        hint_icon = vim.fn.sign_getdefined("DiagnosticSignHint")[1].text,
    },

    init = function(self)
        self.errors = #vim.diagnostic.get(0, { severity = vim.diagnostic.severity.ERROR })
        self.warnings = #vim.diagnostic.get(0, { severity = vim.diagnostic.severity.WARN })
        self.hints = #vim.diagnostic.get(0, { severity = vim.diagnostic.severity.HINT })
        self.info = #vim.diagnostic.get(0, { severity = vim.diagnostic.severity.INFO })
    end,

    update = { "DiagnosticChanged", "BufEnter" },

    {
        provider = "",
    },
    {
        provider = function(self)
            return self.errors > 0 and (" " .. self.error_icon .. self.errors .. " ")
        end,
		hl = { fg = '#bd3c42' }
    },
    {
        provider = function(self)
            return self.warnings > 0 and (" " .. self.warn_icon .. self.warnings .. " ")
        end,
		hl = { fg = '#ceac67'}
    },
    {
        provider = function(self)
            return self.info > 0 and (" " .. self.info_icon .. self.info .. " ")
        end,
		hl = { fg = '#5287cd'}
    },
    {
        provider = function(self)
            return self.hints > 0 and (" " .. self.hint_icon .. self.hints .. " ")
        end,
		hl = { fg = '#69b373'}
    }
}

local DiagnosticArrow = {
	provider = "",
	hl = { fg = '#1f2328' },
}

local StatusLine = {
	ViMode,
	FileNameBlock,
	Align,
	
	LSPActive,
	Diagnostics
}

require("heirline").setup({
	statusline = StatusLine
})
