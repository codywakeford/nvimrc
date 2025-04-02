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
	on_attach = function(client, bufnr)
		-- Function Sigs
		lsp_signature.on_attach({
			bind = true,
		}, bufnr)
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

vim.lsp.handlers["textDocument/hover"] = function(_, result, ctx, config)
	if not (result and result.contents) then
		return
	end

	local contents = result.contents

	-- Check if it's a markdown object, and if so, expand it
	if type(contents) == "table" and contents.kind == "markdown" then
		-- You can customize how to render markdown, or make this longer
		contents.value = contents.value:gsub("\n", "\n\n")
	end

	-- Default behavior, but modified for wider content display
	vim.lsp.util.open_floating_preview(contents, "markdown", config)
end

vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
	border = "rounded", -- You can also use 'double', 'rounded', etc.
	max_width = 130, -- Adjust to your preferred width
	max_height = 1030, -- Adjust the height to show more lines
})
