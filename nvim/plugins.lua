return  {
	-- theme
	{
		"rebelot/kanagawa.nvim",
		config = function()
			require("conf_plugins.theme")
		end
	},

	-- statusline
	{ 	"nvim-tree/nvim-web-devicons" },
	{
		"nvim-lualine/lualine.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		config = function()
			require("conf_plugins.lualine")
		end
	},

	-- parentheses and autopair
	{ 	"jiangmiao/auto-pairs" },
	{ 	"tpope/vim-surround" },
	-- tagbar
	{ 	"preservim/tagbar" },

	-- auto indent
	{
		"lukas-reineke/indent-blankline.nvim",
		main = "ibl",
		config = function()
			require("conf_plugins.indent-blankline")
		end

	},

	-- comment
	{
		"terrortylor/nvim-comment",
		config = function()
			require("conf_plugins.nvim-comment")
		end
	},


	-- grammer
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		config  = function()
			require("conf_plugins.nvim-treesitter")
		end
	},

	-- telescope
	{
		"nvim-telescope/telescope.nvim", tag = "0.1.6",
		dependencies = { "nvim-lua/plenary.nvim" },
		config = function()
			require("conf_plugins.telescope")
		end
	},
	-- fuzzy search
	{	"nvim-telescope/telescope-fzf-native.nvim", build = "make" },
	-- telescope media files
	{	"nvim-telescope/telescope-media-files.nvim" },

	-- lsp
	{	"neovim/nvim-lspconfig",
		config = function()
			require("conf_plugins.lsp")
		end
	},
	-- mason
	{	"williamboman/mason.nvim",
		config = function()
			require("conf_plugins.mason")
		end
	},
	-- auto-completion
	{ 	"hrsh7th/cmp-nvim-lsp" },
	{ 	"hrsh7th/cmp-buffer" },
	{ 	"hrsh7th/cmp-path" },
	{ 	"hrsh7th/cmp-cmdline" },
	{ 	"hrsh7th/nvim-cmp" },
	{
		"L3MON4D3/LuaSnip", version = "2.2.0",
		build = "make install_jsregexp",
		dependencies = { "rafamadriz/friendly-snippets" }
	},
}
