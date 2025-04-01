return {
	"dmmulroy/ts-error-translator.nvim",
	dependencies = { "dmmulroy/tsc.nvim" },
	config = function()
		require("ts-error-translator").setup()
	end,
}
