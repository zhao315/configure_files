local status_ok, kanagawa = pcall(require, "kanagawa")
if not status_ok then
	return
end

kanagawa.setup({})

-- setup must be called before loading
vim.cmd("colorscheme kanagawa-wave")
