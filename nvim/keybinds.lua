vim.g.mapleader = " "

vim.keymap.set("i", "jk", "<Esc>")


vim.keymap.set("", "<F2>", "<cmd>CommentToggle<cr>")
vim.keymap.set("", "<F3>", "<cmd>TagbarToggle<cr>")
vim.keymap.set("", "<F5>", "<Esc>:w<cr>:!python3 %<cr>")

vim.keymap.set("n", "<Esc>", "<cmd>noh<cr>")
vim.keymap.set("n", "<leader><leader>", "za")

-- Move vertically
vim.keymap.set("n", "<M-j>", "<cmd>move .+1<cr>==")
vim.keymap.set("n", "<M-k>", "<cmd>move .-2<cr>==")

-- Switch among buffer
vim.keymap.set("n", "<S-h>", "<cmd>bprevious<cr>")
vim.keymap.set("n", "<S-l>", "<cmd>bnext<cr>")
-- Close buffer
vim.keymap.set("n", "<leader>bb", "<cmd>bd<cr>")
