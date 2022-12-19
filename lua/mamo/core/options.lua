local opt = vim.opt -- for conciseness

--line numbers
	-- opt.relativenumber = true
opt.number = true

--tabs & indentation
opt.tabstop = 8
opt.shiftwidth = 8
opt.expandtab = true
opt.autoindent = true

--line wrapping
opt.wrap = false

-- search settings
opt.ignorecase = true
opt.smartcase = true

--cursir line
opt.cursorline = true

--theme
opt.termguicolors = true
opt.background = "dark"
opt.signcolumn = "yes"

--backspace
opt.backspace = "indent,eol,start"

--clipborad
opt.clipboard:append("unnamedplus")

--split windows
opt.splitright = true
opt.splitbelow = true

opt.iskeyword:append("-")
