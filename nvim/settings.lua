vim.opt.number = true
vim.opt.relativenumber = true
vim.cmd[[
	augroup relativenumber
		autocmd InsertEnter * : set norelativenumber
	augroup END
]]

vim.wo.signcolumn = "yes"

vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.incsearch = true


vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth =4
vim.opt.expandtab = true


vim.opt.termguicolors = true


vim.opt.cursorline = true
vim.opt.showmode = false


vim.opt.completeopt = { "menu", "menuone", "noselect" }


vim.opt.backup = false
vim.opt.swapfile = false
vim.opt.hidden = true
vim.clipboard = "unnamedplus"


vim.opt.syntax = "on"


vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
vim.opt.foldenable = false
vim.opt.foldlevel = 99

vim.opt.wrap = true
vim.opt.textwidth = 79


vim.cmd[[ filetype plugin indent on ]]


-- disable netrw for nvim-tree
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
