local lspconfig = require("lspconfig")

require("mason").setup()
require("mason-lspconfig").setup({
	ensure_installed = {
		"eslint",
		"volar",
		"lua_ls",
		"cssls",
	},
	automatic_installation = true,
})

local capabilities = require("cmp_nvim_lsp").default_capabilities()
local lsp_signature = require("lsp_signature")

-- Setup LSPs
lspconfig.volar.setup({
	filetypes = { "typescript", "javascript", "javascriptreact", "typescriptreact", "vue" },
	init_options = {
		vue = {
			hybridMode = false,
		},
	},
	fileWatching = true,

	on_attach = function(client, bufnr)
		-- Function Sigs
		lsp_signature.on_attach({
			bind = true,
		}, bufnr)

		client.config.capabilities.workspace.didChangeWatchedFiles.dynamicRegistration = true
	end,
})

lspconfig.lua_ls.setup({
	capabilities = capabilities,
})

lspconfig.eslint.setup({
	capabilities = capabilities,
	filetypes = { "javascript", "typescript", "vue" },
	settings = {
		eslint = {
			enable = true,
			packageManager = "npm",
			nodePath = "/home/cody/.nvm/versions/node/v18.20.5/bin/node",
		},
	},
})

lspconfig.cssls.setup({
	capabilities = capabilities,
	filetypes = { "css", "scss", "less" },
})
