require("core")

vim.cmd([[
   autocmd FileType javascript,typescript,vue,html,json,markdown setlocal formatprg=prettier
]])

vim.api.nvim_create_autocmd("VimEnter", {
	callback = function()
		vim.cmd("tabnew")
		vim.cmd("tabnew")

		vim.cmd("tabnew | terminal")
		vim.cmd("tabnew | terminal")

		vim.cmd("tabfirst")
	end,
})

vim.api.nvim_create_autocmd("BufEnter", {
	callback = function(args)
		if vim.bo[args.buf].buftype == "terminal" then
			vim.opt_local.number = false
			vim.opt_local.relativenumber = false
		end
	end,
})

local move_mode = false

-- Toggle the Move Mode
function toggle()
	move_mode = not move_mode

	if M.move_mode then
		print("Move Mode: ON 🚀")
		vim.keymap.set("n", "h", "5h", { noremap = true, silent = true })
		vim.keymap.set("n", "l", "5l", { noremap = true, silent = true })
		vim.keymap.set("n", "j", "5j", { noremap = true, silent = true })
		vim.keymap.set("n", "k", "5k", { noremap = true, silent = true })
		vim.keymap.set("n", "w", "3w", { noremap = true, silent = true })
		vim.keymap.set("n", "b", "3b", { noremap = true, silent = true })
		vim.keymap.set("n", "q", M.toggle, { noremap = true, silent = true }) -- Exit Move Mode
	else
		print("Move Mode: OFF ❌")
		vim.keymap.del("n", "h")
		vim.keymap.del("n", "l")
		vim.keymap.del("n", "j")
		vim.keymap.del("n", "k")
		vim.keymap.del("n", "w")
		vim.keymap.del("n", "b")
		vim.keymap.del("n", "q")
	end
end

-- Setup the user command
function setup()
	vim.api.nvim_create_user_command("MoveMode", toggle, { nargs = 0 })
end
