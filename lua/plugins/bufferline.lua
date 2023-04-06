local ok, bufferline = pcall(require, "bufferline")
if not ok then return end

require("bufferline").setup({
	options = {
		offsets = {
    	{
    	  filetype = "NvimTree",
    	  text = "File Explorer"
    	}
  	},
		show_buffer_icons = false,
		buffer_close_icon = ' ',
	}
})
