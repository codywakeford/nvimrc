require("core")

-- Modules
require("packages.hover")

vim.cmd([[
   autocmd FileType javascript,typescript,vue,html,json,markdown setlocal formatprg=prettier
]])

-- On VimEnter, set up terminal tabs
vim.api.nvim_create_autocmd("VimEnter", {
	callback = function()
		vim.cmd("tabnew")
		vim.cmd("tabnew")

		vim.cmd("tabfirst")
	end,
})

vim.api.nvim_create_autocmd({ "BufNewFile", "BufRead" }, {
	pattern = "*.md", -- This matches any markdown file
	callback = function()
		vim.cmd("Neoformat")
	end,
})

-- LSP Crash
vim.api.nvim_create_autocmd("LspDetach", {
	callback = function(args)
		vim.notify("LSP detached unexpectedly from buffer " .. args.buf, vim.log.levels.WARN)
	end,
})
