require("core")

vim.cmd([[
   autocmd FileType javascript,typescript,vue,html,json setlocal formatprg=prettier
]])

vim.diagnostic.config({
	virtual_text = false,
	signs = true,

	underline = true,
	severity_sort = true,

	float = {
		source = "always",
		focusable = false,
		border = "rounded",
		format = function(diagnostic)
			print(diagnostic)
			return string.format("[%s] %s", diagnostic.source, diagnostic.message)
		end,
	},
})

vim.lsp.handlers["textDocument/publishDiagnostics"] = function(_, result, ctx, config)
	if not result.diagnostics then
		return
	end

	for _, diagnostic in ipairs(result.diagnostics) do
		diagnostic.message = string.format("🔥 [TS]: %s", diagnostic.message)
	end

	vim.lsp.diagnostic.on_publish_diagnostics(_, result, ctx, config)
end
