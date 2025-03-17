require("core")

vim.cmd([[
   autocmd FileType javascript,typescript,vue,html,json setlocal formatprg=prettier
]])

vim.diagnostic.config({
	virtual_text = false,
	signs = false,
	underline = true,
	update_in_insert = true,
	severity_sort = true,
})
