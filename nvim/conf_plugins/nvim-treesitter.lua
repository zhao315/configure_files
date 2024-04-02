local status_ok, nvim_treesitter = pcall(require, "nvim-treesitter.configs")
if not status_ok then
	return
end

nvim_treesitter.setup({
	ensure_installed = {
		"c", "lua", "vim", "vimdoc", "query",
		"elixir", "heex",
		"javascript", "html", "json", "r",
		"python", "cpp", "sql", "latex", "markdown",
		"git_config", "git_rebase", "gitcommit", "gitattributes", "gitignore"
	},
	sync_install = false,
	auto_install = true,
	highlight = { enable = true },
	indent = { enable = true },
	-- ignore_install = { "arduino" },
})
