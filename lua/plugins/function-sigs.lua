local config = function()
	vim.keymap.set({ "i" }, "<C-k>", function()
		require("lsp_signature").toggle_float_win()
	end, { silent = true, noremap = true, desc = "toggle signature" })

	require("lsp_signature").setup({
		bind = true,
		fix_pos = true,
		hint_enable = false,
		floating_window = false,
		always_trigger = false,
		timer_interval = 10,
	})
end

return {
	"ray-x/lsp_signature.nvim",
	config = config,
}
