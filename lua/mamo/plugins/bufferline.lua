require("bufferline").setup({
	options = {
		diagnostics = "nvim_lsp",
        diagnostics_update_in_insert = true,
        diagnostics_indicator = function(_, level,_, _)
          local icon = level:match("error") and " " or " "
          return icon
        end,
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
