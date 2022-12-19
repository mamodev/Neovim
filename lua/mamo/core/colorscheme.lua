local status, _ = pcall(vim.cmd, "colorscheme nightfly")
if not status then
	print("Colorscheme not found!")
	return
end
--remove background
function Color(color)
	color = color or "nightfly"
	vim.cmd.colorscheme(color)
	vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
	vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
end

--Color()
