local config = function()
	require("tabline").setup({
		enable = true,
		no_name = "a", -- Name for buffers with no name
		padding = 300, -- Prefix and suffix space
		options = {
			section_separators = { "", "" },
			component_separators = { "", "" },
			max_bufferline_percent = 66, -- set to nil by default, and it uses vim.o.columns * 2/3
			show_tabs_always = true, -- this shows tabs only when there are more than one tab or if the first tab is named
			show_devicons = true, -- this shows devicons in buffer section
			show_bufnr = false, -- this appends [bufnr] to buffer section,
			show_filename_only = true, -- shows base filename only instead of relative path in filename
			modified_icon = "+ ", -- change the default modified icon
			modified_italic = false, -- set to true by default; this determines whether the filename turns italic if modified
			show_tabs_only = true, -- this shows only tabs instead of tabs + buffers
		},
	})
	vim.keymap.set("n", "1", "1gt")
	vim.keymap.set("n", "2", "2gt")
	vim.keymap.set("n", "3", "3gt")
	vim.keymap.set("n", "4", "4gt")
	vim.keymap.set("n", "5", "5gt")

	vim.api.nvim_set_keymap("t", "<Esc>", "<C-\\><C-n>", { noremap = true })

	vim.api.nvim_create_autocmd("TermOpen", {
		callback = function()
			vim.opt_local.number = false
			vim.opt_local.relativenumber = false
		end,
	})
end

return {
	"kdheepak/tabline.nvim",
	config = config,
	requires = { { "hoob3rt/lualine.nvim", opt = true }, { "kyazdani42/nvim-web-devicons", opt = true } },
}
