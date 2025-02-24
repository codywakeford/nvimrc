vim.keymap.set("n", "<leader>cg", ":CodeCompanionChat Toggle<CR>")

function config()
	require("codecompanion").setup({

		display = {
			action_palette = {
				width = 40,
				height = 10,
				prompt = "Prompt ",
				provider = "default",
				opts = {
					show_default_actions = true, -- Show default actions in the action palette
					show_default_prompt_library = true, -- Show the default prompt library in the action palette
				},
			},
		},
		strategies = {
			chat = {
				adapter = "gemini",
				keymaps = {
					send = {
						modes = { n = "<C-enter>", i = "<C-enter>" },
					},
					close = {
						modes = { n = "<C-c>", i = "<C-c>" },
					},
				},
			},
			inline = {
				adapter = "gemini",
			},
		},

		adapters = {
			gemini = function()
				return require("codecompanion.adapters").extend("gemini", {
					env = {
						api_key = "AIzaSyBmINF8Uda-hSvQvQBUyNhHfdyA0Cdi-AM",
					},
				})
			end,
		},
	})
end

return {
	"olimorris/codecompanion.nvim",
	config = config,
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-treesitter/nvim-treesitter",
	},
}
