local status_ok, builtin = pcall(require, "telescope.builtin")
if not status_ok then
	return
end

local status_ok, telescope = pcall(require, "telescope")
if not status_ok then
	return
end


-- telescope key bindings
vim.keymap.set("n", "<leader>ff", builtin.find_files, {})
vim.keymap.set("n", "<leader>fg", builtin.live_grep, {})
vim.keymap.set("n", "<leader>fb", builtin.buffers, {})
vim.keymap.set("n", "<leader>fh", builtin.help_tags, {})


-- telescope conf
telescope.setup({
	extensions = {
		fzf = {
			fuzzy = true,
			override_generic_sorter = true,
			override_file_sorter = true,
			case_mode = "smart_case",
		},
		media_files = {
			filetypes = {"png", "webp", "jpg", "jpeg"} ,
			find_cmd = "rg",
		},
	},
})

telescope.load_extension("fzf")
telescope.load_extension("media_files")

