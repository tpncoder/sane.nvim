vim.opt.background = "dark"

local function colorChangeonTime()
	local tableTime = os.date("*t")
	local hour = tableTime.hour
	if hour < 14 then
		vim.cmd[[color tokyonight]]
	elseif hour >= 14 and hour < 16 then
		vim.g.catppuccin_flavour = "frappe"
		vim.cmd[[color catppuccin]]
	elseif hour >= 16 and hour < 18 then
		vim.g.catppuccin_flavour = "macchiato"
		vim.cmd[[color catppuccin]]
	elseif hour >= 18 then
		vim.g.catppuccin_flavour = "mocha"
		vim.cmd[[color catppuccin]]
	end
end

colorChangeonTime()
