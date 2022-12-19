require("bufferline").setup({
	options = {
		diagnostic = "nvim_lsp",
		offsets = {
			{
				filetype = "NvimTree",
				text = "File Explorer",
				text_align = "left",
				separator = true,
			},
		},
	},
})
