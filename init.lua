-- Packer plugins set up
require("mamo.plugins-setup") --Packer autoinstall and setup
-- Core
require("mamo.core.options") --Vim options
require("mamo.core.keymaps") -- Editor shortcuts
require("mamo.core.colorscheme") -- Theme setUp
-- Editor main components setup
require("mamo.plugins.treesitter")
require("mamo.plugins.bufferline") -- Tabs and Buffers bar
require("mamo.plugins.nvim-tree") -- File explorer
require("mamo.plugins.scrollbar") -- Scrollbar
require("mamo.plugins.lualine") -- Better bottom line
require("mamo.plugins.blankline") -- Tabs vertical columns
require("mamo.plugins.telescope") -- fzf integration
-- Git integration
require("mamo.plugins.gitsigns")
--lsp
require("mamo.plugins.lsp")
require("mamo.plugins.lspsaga")
-- Linters and Formatters
require("mamo.plugins.null-ls")
-- Utils
require("mamo.plugins.autopairs")
require("mamo.plugins.comment")
