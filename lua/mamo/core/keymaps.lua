vim.g.mapleader = " "

local keymap = vim.keymap

-- use jk to exit insert mode
keymap.set("i", "jk", "<ESC>")

-- clear seyarch highlights
keymap.set("n", "<leader>nh", ":nohl<CR>")

-- delete single character without copying into register
keymap.set("n", "x", '"_x')

-- increment/decrement numbers
keymap.set("n", "<leader>+", "<C-a>") -- increment
keymap.set("n", "<leader>-", "<C-x>") -- decrement

--buffers
keymap.set("n", "≥", ":BufferLineCycleNext<CR>")
keymap.set("n", "≤", ":BufferLineCyclePrev<CR>")
keymap.set("n", "∑", ":bd<CR>") --  safe close buffer

-- window management
keymap.set("n", "<leader>sv", "<C-w>v") -- split window vertically
keymap.set("n", "<leader>sh", "<C-w>s") -- split window horizontallyyyy
keymap.set("n", "<leader>se", "<C-w>=") -- make split windows equal width & height
keymap.set("n", "<leader>sx", ":close<CR>") -- close current split window

keymap.set("n", "<leader>to", ":tabnew %<CR>") -- open new tab
keymap.set("n", "<leader>tx", ":tabclose<CR>") -- close current tab
keymap.set("n", "<leader>tn", ":tabn<CR>") --  go to next tab
keymap.set("n", "<leader>tp", ":tabp<CR>") --  go to previous tab

--Move up and down code
keymap.set("n", "∆", ":m .+1<CR>==")
keymap.set("n", "˚", ":m .-2<CR>==")
keymap.set("v", "∆", ":m '>+1<CR>gv=gv")
keymap.set("v", "˚", ":m '<-2<CR>gv=gv")

----------------------
-- Plugin Keybinds
----------------------

-- vim-maximizer
keymap.set("n", "<leader>sm", ":MaximizerToggle<CR>") -- toggle split window maximization

-- nvim-tree
keymap.set("n", "<leader>e", ":NvimTreeToggle<CR>") -- toggle file explorer

-- telescope
keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<cr>") -- find files within current working directory, respects .gitignore
keymap.set("n", "<leader>fs", "<cmd>Telescope live_grep<cr>") -- find string in current working directory as you type
keymap.set("n", "<leader>fc", "<cmd>Telescope grep_string<cr>") -- find string under cursor in current working directory
keymap.set("n", "<leader>fb", "<cmd>Telescope buffers<cr>") -- list open buffers in current neovim instance
keymap.set("n", "<leader>fh", "<cmd>Telescope help_tags<cr>") -- list available help tags
keymap.set("n", "<leader>fg", "<cmd>Telescope git_files<cr>") -- list available help tags

--undo tree
keymap.set("n", "<leader>u", "<cmd>UndotreeToggle<cr>")
