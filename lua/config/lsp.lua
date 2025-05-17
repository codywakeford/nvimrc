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
capabilities.workspace = {
	didChangeWatchedFiles = {
		dynamicRegistration = false,
	},
}

lspconfig.volar.setup({
	filetypes = { "typescript", "javascript", "javascriptreact", "typescriptreact", "vue", "html" },

	capabilities = capabilities,

	init_options = {
		maxTsServerMemory = 4096,
		vue = {
			hybridMode = false,
		},
		preferences = {
			importModuleSpecifier = "non-relative",
		},
	},

	on_attach = function(client, bufnr)
		lsp_signature.on_attach({
			bind = true,
		}, bufnr)
	end,
})

lspconfig.lua_ls.setup({
	capabilities = capabilities,
})

lspconfig.cssls.setup({
	capabilities = capabilities,
	filetypes = { "css", "less", "vue" },
	root_dir = require("lspconfig.util").root_pattern("package.json", ".git", "nuxt.config.ts", "nuxt.config.js"),
	settings = {
		css = {
			validate = true,
		},
		scss = {
			validate = true,
		},
	},
})

lspconfig.somesass_ls.setup({
	capabilities = capabilities,
	filetypes = { "scss", "sass", "vue" },
	root_dir = require("lspconfig.util").root_pattern("package.json", ".git", "nuxt.config.ts", "nuxt.config.js"),
})

vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
	border = "single", -- You can also use 'double', 'rounded', etc.
	max_width = 130, -- Adjust to your preferred width
	max_height = 1030, -- Adjust the height to show more lines
	side_padding = 1,
})

lspconfig.gopls.setup({
	on_attach = on_attach,
	capabilities = capabilities,
	cmd = { "gopls" },
	filetypes = { "go", "gomod", "gowork", "gotmpl" },
	settings = {
		gopls = {
			completeUnimported = true,
			usePlaceholders = true,
			analyses = {
				unusedparams = true,
			},
		},
	},
})

vim.api.nvim_create_autocmd("BufWritePost", {
	pattern = "*",
	callback = function()
		for _, client in ipairs(vim.lsp.get_active_clients({ name = "volar" })) do
			client.notify("workspace/didChangeWatchedFiles", {
				changes = {
					{
						uri = vim.uri_from_bufnr(0),
						type = 1, -- Created
					},
				},
			})
		end
	end,
})
