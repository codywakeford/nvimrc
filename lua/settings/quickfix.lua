vim.keymap.set("n", "<A-n>", ":cnext <CR>")
vim.keymap.set("n", "<A-p>", ":cprev <CR>")

vim.keymap.set("n", "<leader>qf", function()
	vim.diagnostic.setqflist({ severity = vim.diagnostic.severity.ERROR }) -- Only errors
	vim.cmd("copen") -- Open the quickfix window
end, { noremap = true, silent = true })
