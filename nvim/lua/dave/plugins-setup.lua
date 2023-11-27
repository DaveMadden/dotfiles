-- auto install packer if not installed
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
local packer_bootstrap = ensure_packer() -- true if packer was just installed

-- autocommand that reloads neovim and installs/updates/removes plugins
-- when file is saved
vim.cmd([[ 
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins-setup.lua source <afile> | PackerSync
  augroup end
]])

-- import packer safely
local status, packer = pcall(require, "packer")
if not status then
	return
end

return packer.startup(function(use)
	use("wbthomason/packer.nvim")
	use("nvim-lua/plenary.nvim") -- lua functions that many plugins use

	-- color schemes
	use("sainnhe/everforest")
	use("sainnhe/sonokai")
	use("GlennLeo/cobalt2")
	use("catppuccin/nvim")
	use("EdenEast/nightfox.nvim") -- Packer
	use("folke/tokyonight.nvim")
	use("gertjanreynaert/cobalt2-vim-theme")

	-- use("christoomey/vim-tmux-navigator") -- actually i want <C-j> etc for harpoon
	use("szw/vim-maximizer")

	-- essential plugins
	use("tpope/vim-surround") --ys motion character and then ds character to delete it. cs oldchar newchar to change
	use("inkarkat/vim-ReplaceWithRegister") -- replace with register contents using motion (gr + motion)

	-- commenting with gc
	use("numToStr/Comment.nvim")

	-- file explorer
	use("nvim-tree/nvim-tree.lua")

	-- vs-code like icons
	use("nvim-tree/nvim-web-devicons")

	-- statusline
	use("nvim-lualine/lualine.nvim")

	-- fuzzy finding w/ telescope
	use({ "nvim-telescope/telescope-fzf-native.nvim", run = "make" }) -- dependency for better sorting performance
	use({ "nvim-telescope/telescope.nvim", branch = "0.1.x" }) -- fuzzy finder

	-- autocompletion
	use("hrsh7th/nvim-cmp") -- completion plugin
	use("hrsh7th/cmp-buffer") -- source for text in buffer
	use("hrsh7th/cmp-path") -- source for file system paths

	-- snippets
	use("L3MON4D3/LuaSnip") -- snippet engine
	use("saadparwaiz1/cmp_luasnip") -- for autocompletion
	use("rafamadriz/friendly-snippets") -- useful snippets

	-- managing & installing lsp servers, linters & formatters
	use("williamboman/mason.nvim") -- in charge of managing lsp servers, linters & formatters
	use("williamboman/mason-lspconfig.nvim") -- bridges gap b/w mason & lspconfig

	-- configuring lsp servers
	use("neovim/nvim-lspconfig") -- easily configure language servers
	use("hrsh7th/cmp-nvim-lsp") -- for autocompletion
	use({
		"glepnir/lspsaga.nvim",
		branch = "main",
		requires = {
			{ "nvim-tree/nvim-web-devicons" },
			{ "nvim-treesitter/nvim-treesitter" },
		},
	})

	-- enhanced lsp uis
	use("jose-elias-alvarez/typescript.nvim") -- additional functionality for typescript server (e.g. rename file & update imports)
	use("onsails/lspkind.nvim") -- vs-code like icons for autocompletion

	-- formatting & linting
	use("jose-elias-alvarez/null-ls.nvim") -- configure formatters & linters
	use("jayp0521/mason-null-ls.nvim") -- bridges gap b/w mason & null-ls

	-- treesitter configuration
	use({
		"nvim-treesitter/nvim-treesitter",
		run = function()
			local ts_update = require("nvim-treesitter.install").update({ with_sync = true })
			ts_update()
		end,
	})

	-- auto closing
	use("windwp/nvim-autopairs") -- autoclose parens, brackets, quotes, etc...
	use({ "windwp/nvim-ts-autotag", after = "nvim-treesitter" }) -- autoclose tags

	-- git integration
	use("lewis6991/gitsigns.nvim") -- show line modifications on left hand side

	-- from theprimeagen's setup
	use("theprimeagen/harpoon")
	use("mbbill/undotree")
	use("tpope/vim-fugitive")

	use("lukas-reineke/indent-blankline.nvim")

	use("mvdan/gofumpt")
	-- use("incu6us/goimports-reviser")
	use("mfussenegger/nvim-dap")
	use("leoluz/nvim-dap-go")

	-- trying to set up gohtmltmpl filetype:
	use("ray-x/go.nvim")
	use("ray-x/guihua.lua")

	-- use({
	-- 	"mfussenegger/nvim-dap",
	-- 	ft = "go",
	-- 	-- requires = {"mfussenegger/nvim-dap"},
	-- 	config = function()
	-- 		require("nvim-dap").setup()
	-- 		require("core.utils").load_mappings("nvim-dap_go")
	-- 	end,
	-- })
	-- use({
	-- 	"laytan/tailwind-sorter.nvim",
	-- 	requires = { "nvim-treesitter/nvim-treesitter", "nvim-lua/plenary.nvim" },
	-- 	config = function()
	-- 		require("tailwind-sorter").setup()
	-- 	end,
	-- 	run = "cd formatter && npm i && npm run build",
	-- })

	if packer_bootstrap then
		require("packer").sync()
	end
end)
