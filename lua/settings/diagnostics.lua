vim.diagnostic.config({
	virtual_text = false,
	signs = false,
	update_in_insert = true,

	underline = true,
	severity_sort = true,

	float = {
		source = "always",
		focusable = false,

		border = "single",

		-- Add padding to the float window for more space around the text
		padding = { left = 1, right = 1, top = 1, bottom = 1 },

		max_width = 100,
	},
})
