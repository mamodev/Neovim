-- automatic Packer (PluginManager) install
local ensure_packer = function()
	local fn = vim.fn
	local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
	if fn.empty(fn.glob(install_path)) > 0 then
		fn.system({ "git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path })
		vim.cmd([[packadd packer.nvim]])
		return true
	end
	return false
end

local packer_bootstrap = ensure_packer()

-- Automatic command that reloads packer confing on save
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins-setup.lua source <afile> | PackerSync
  augroup end
]])

-- get packer
local status, packer = pcall(require, "packer")
if not status then
	return
end

packer.init({
	display = {
		open_fn = function()
			return require("packer.util").float({ border = "rounded" })
		end,
	},
})

return packer.startup(function(use)
	use("wbthomason/packer.nvim")

	use("nvim-lua/plenary.nvim") -- lua functions that many plugins use
	use("nvim-lua/popup.nvim") -- Popup API from vim in neovim

	-- treesitter configuration
	use({
		"nvim-treesitter/nvim-treesitter",
		run = function()
			local ts_update = require("nvim-treesitter.install").update({ with_sync = true })
			ts_update()
		end,
	})

	-- window managing
	use("christoomey/vim-tmux-navigator") -- tmux & split window navigation
	use("szw/vim-maximizer") -- maximizes and restores current window
	use("petertriho/nvim-scrollbar") --implementation of vs-code scrollbar
	use("lukas-reineke/indent-blankline.nvim") --indentation line and space dots
	use({ "akinsho/bufferline.nvim", tag = "v3.*", requires = "nvim-tree/nvim-web-devicons" })

	-- file explorer
	use("nvim-tree/nvim-tree.lua")
	-- vs-code like icons
	use("nvim-tree/nvim-web-devicons")

	--tabs
	use("akinsh/bufferline.nvim")
	--	use("moll/vim-bbye")

	-- statusline
	use("nvim-lualine/lualine.nvim")

	--undotree
	use("mbbill/undotree")
	-- themes
	use("bluz71/vim-nightfly-guicolors") -- preferred colorschemes
	use("lunarvim/colorschemes")

	-- fuzzy finding w/ telescope
	use({ "nvim-telescope/telescope-fzf-native.nvim", run = "make" }) -- dependency for better sorting performance
	use({ "nvim-telescope/telescope.nvim", branch = "0.1.x" }) -- fuzzy finder

	------------------
	-- LSP for NVIM --
	------------------
	use({
		"VonHeikemen/lsp-zero.nvim",
		requires = {
			-- managing & installing lsp servers, linters , formatters
			use("neovim/nvim-lspconfig"),
			use("williamboman/mason.nvim"), -- in charge of managing lsp servers, linters & formatters
			use("williamboman/mason-lspconfig.nvim"), -- bridges gap b/w mason & lspconfig

			-- Autocompletion
			use("hrsh7th/nvim-cmp"), -- completion plugin
			use("hrsh7th/cmp-buffer"), -- source for text in buffer
			use("hrsh7th/cmp-path"), -- source for file system paths
			use("saadparwaiz1/cmp_luasnip"), -- for autocompletion
			use("hrsh7th/cmp-nvim-lsp"), -- for autocompletion
			use("hrsh7th/cmp-nvim-lua"), -- for autocompletion

			-- snippets
			use("L3MON4D3/LuaSnip"), -- snippet engine
			use("rafamadriz/friendly-snippets"), -- useful snippets:
		},
	})

	-- Lsp server utils
	-- use("onsails/lspkind.nvim") -- vs-code like icons for NVIM LSP
	-- use({ "glepnir/lspsaga.nvim", branch = "main" }) -- enhanced lsp UI
	-- use("jose-elias-alvarez/typescript.nvim") -- additional functionality for typescript server (e.g. rename file & update imports)
	---------------- END LSP ----------------

	-- formatting & linting
	-- use("jose-elias-alvarez/null-ls.nvim") -- configure formatters & linters
	-- use("jayp0521/mason-null-ls.nvim") -- bridges gap b/w mason & null-ls

	-- auto closing
	use("windwp/nvim-autopairs") -- autoclose parens, brackets, quotes, etc...
	use({ "windwp/nvim-ts-autotag", after = "nvim-treesitter" }) -- autoclose tags

	-- utils plugins
	use("tpope/vim-surround") -- add, delete, change surroundings (it's awesome)
	use("numToStr/Comment.nvim")
	-- use("inkarkat/vim-ReplaceWithRegister") -- replace with register contents using motion (gr + motion)

	-- git integration
	use("lewis6991/gitsigns.nvim") -- show line modifications on left hand side

	if packer_bootstrap then
		require("packer").sync()
	end
end)
