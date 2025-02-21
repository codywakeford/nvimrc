return { 
    "Mofiqul/vscode.nvim",
    config = function ()
	color = color or "vscode"
	vim.cmd.colorscheme(color)

    end
}