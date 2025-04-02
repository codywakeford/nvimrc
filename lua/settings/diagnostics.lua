vim.diagnostic.config({
	virtual_text = false,
	signs = false,
	update_in_insert = true,

	underline = true,
	severity_sort = true,

	float = {
		source = "always",
		focusable = false,

		border = "rounded",

		-- Add padding to the float window for more space around the text
		padding = { left = 2, right = 2, top = 1, bottom = 1 },

		max_width = 100,
		max_height = 15,
	},
})
