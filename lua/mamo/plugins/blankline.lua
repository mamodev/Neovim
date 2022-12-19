vim.opt.list = true
vim.opt.listchars:append("space:⋅")
vim.opt.listchars:append("eol:↴")

local status, plugin = pcall(require, "indent_blankline")
if not status then
	return
end

plugin.setup({
	show_end_of_line = true,
	space_char_blankline = " ",
})
