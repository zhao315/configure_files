local lspconfig_status_ok, lspconfig = pcall(require, "lspconfig")
if not lspconfig_status_ok then
	return
end


local cmp_status_ok, cmp = pcall(require,  "cmp")
if not cmp_status_ok then
	return
end


local cmp_nvim_lsp_status_ok, capabilities = pcall(require, "cmp_nvim_lsp")
if not cmp_nvim_lsp_status_ok then
	return
end

capabilities = capabilities.default_capabilities()


-- Setup language server
lspconfig.pyright.setup{ capabilities = capabilities }
lspconfig.clangd.setup{ capabilities = capabilities }
lspconfig.lua_ls.setup{
	single_file_support = true,
	flags = { debounce_text_changes = 150, },
	capabilities = capabilities,
}
lspconfig.texlab.setup{ capabilities = capabilities }
lspconfig.jsonls.setup{ capabilities = capabilities }
lspconfig.docker_compose_language_service.setup{ capabilities = capabilities }
lspconfig.dockerls.setup{ capabklities = capabilities }




local html_capabilities = vim.lsp.protocol.make_client_capabilities()
lspconfig.html.setup{ capabilities = html_capabilities }

-- Global mappings.
-- See `:help vim.diagnostic.*` for documentation on any of the below functions
vim.keymap.set('n', '<space>e', vim.diagnostic.open_float)
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev)
vim.keymap.set('n', ']d', vim.diagnostic.goto_next)
vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist)

-- Use LspAttach autocommand to only map the following keys
-- after the language server attaches to the current buffer
vim.api.nvim_create_autocmd('LspAttach', {
	group = vim.api.nvim_create_augroup('UserLspConfig', {}),
	callback = function(ev)
		-- Enable completion triggered by <c-x><c-o>
		vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'

		-- Buffer local mappings.
		-- See `:help vim.lsp.*` for documentation on any of the below functions
		local opts = { buffer = ev.buf }
		vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
		vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
		vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
		vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
		vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, opts)
		vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, opts)
		vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, opts)
		vim.keymap.set('n', '<space>wl', function()
			print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
		end, opts)
		vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, opts)
		vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, opts)
		vim.keymap.set({ 'n', 'v' }, '<space>ca', vim.lsp.buf.code_action, opts)
		vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
		vim.keymap.set('n', '<space>f', function()
		  vim.lsp.buf.format { async = true }
		end, opts)
	end,
})


cmp.setup({
	snippet = {
		expand = function(args)
			require("luasnip").lsp_expand(args.body)
		end,
	},

	window = {
		completion = cmp.config.window.bordered(),
		documentation = cmp.config.window.bordered(),
	},

	mapping = cmp.mapping.preset.insert({
		["<C-b>"] = cmp.mapping.scroll_docs(-4),
		["<C-f>"] = cmp.mapping.scroll_docs(4),
		["<S-space>"] = cmp.mapping.complete(),
		["<C-e>"] = cmp.mapping.abort(),
		["<cr>"] = cmp.mapping.confirm({ select = true }),
	}),

	sources = cmp.config.sources({
		{ name = "nvim_lsp" },
		{ name = "luasnip" },
		}, {
			{ name = "buffer" },
	})
})


cmp.setup.filetype("gitcommit", {
	sources = cmp.config.sources({
		{ name = "git" },
		}, {
			{ name = "buffer" },
	})
})


cmp.setup.cmdline({"/", "?"}, {
	mapping = cmp.mapping.preset.cmdline(),
	sources = { { name = "buffer" } },
})


cmp.setup.cmdline(":", {
	mapping = cmp.mapping.preset.cmdline(),
	sources = cmp.config.sources({
		{ name = "path" },
		}, {
			{ name = "cmdline" },
	})
})


