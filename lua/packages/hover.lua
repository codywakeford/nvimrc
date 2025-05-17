local M = {}

--- Get diagnostic under the cursor
local function get_diagnostic_under_cursor()
	local bufnr = vim.api.nvim_get_current_buf()
	local cursor = vim.api.nvim_win_get_cursor(0)
	local line = cursor[1] - 1
	local col = cursor[2]
	local diags = vim.diagnostic.get(bufnr, { lnum = line })

	for _, d in ipairs(diags) do
		if d.col <= col and col <= (d.end_col or d.col + 1) then
			return d
		end
	end
	return nil
end

local function format_markdown(diagnostic)
	local severity_names = {
		[vim.diagnostic.severity.ERROR] = "**❌ Error**\n",
		[vim.diagnostic.severity.WARN] = "**⚠️ Warning**\n",
		[vim.diagnostic.severity.INFO] = "**💡 Info**\n",
		[vim.diagnostic.severity.HINT] = "**💭 Hint**\n",
	}

	local lines = {}
	local type_counter = 1 -- To keep track of the type aliases (A, B, C...)

	-- Add the corresponding severity to the lines
	local severity_label = severity_names[diagnostic.severity] or "Error\n"
	table.insert(lines, severity_label)

	-- Split the string inside the diagnostic message
	local diagnostic_message = diagnostic.message

	-- Match and process everything before the first quote
	local start_pos = 1
	while true do
		-- Find the next pair of single quotes
		local before, inside, after = diagnostic_message:match("^(.-)'(.-)'(.*)$")

		if not before then
			-- If no more quotes, add the remaining part
			table.insert(lines, diagnostic_message:sub(start_pos))
			break
		end

		-- Insert the part before the first quote
		if #before > 0 then
			table.insert(lines, before)
		end

		-- Add the type alias (e.g., "type A =")
		table.insert(lines, string.format("```ts\ntype %s = %s\n```", string.char(64 + type_counter), inside))

		-- Increment the counter for the next type alias (A, B, C, etc.)
		type_counter = type_counter + 1

		-- Move to the next part after the closing quote
		diagnostic_message = after
	end

	return lines
end

M.show_diagnostic_hover = function()
	local diag = get_diagnostic_under_cursor()
	if not diag then
		return
	end

	local markdown = format_markdown(diag)

	local opts = {
		border = "single", -- Square border (you can also try "double" for a different square effect)
		focusable = true,
		close_events = { "FocusLost" },
		height = 20,
		width = 30,
	}

	local bufnr, winid = vim.lsp.util.open_floating_preview(markdown, "markdown", opts)

	if bufnr and vim.api.nvim_buf_is_valid(bufnr) then
		-- Set modifiable and remove readonly
		vim.api.nvim_buf_set_option(bufnr, "modifiable", true)
		vim.api.nvim_buf_set_option(bufnr, "readonly", false)

		vim.api.nvim_buf_set_option(bufnr, "filetype", "markdown")
		vim.api.nvim_buf_call(bufnr, function()
			vim.cmd(":Neoformat")
		end)
	end

	if winid then
		vim.api.nvim_set_current_win(winid)
		vim.api.nvim_buf_set_keymap(bufnr, "n", "q", "<cmd>close<CR>", { silent = true, noremap = true })
	end
end

-- open in pane instead
local function window()
	M.show_diagnostic_hover = function()
		local diag = get_diagnostic_under_cursor()
		if not diag then
			vim.notify("No diagnostic under cursor", vim.log.levels.INFO)
			return
		end

		-- Format markdown
		local markdown = format_markdown(diag)

		-- Join the markdown lines with proper newlines
		local markdown_content = table.concat(markdown, "\n")

		-- Create a new buffer
		local buf = vim.api.nvim_create_buf(false, true) -- false for non-listed, true for scratch buffer
		vim.api.nvim_buf_set_lines(buf, 0, -1, false, vim.split(markdown_content, "\n"))

		-- Open a vertical split for the markdown
		vim.cmd("vsplit")
		local winid = vim.api.nvim_get_current_win()

		-- Set options for the new buffer
		vim.api.nvim_win_set_buf(winid, buf)
		vim.api.nvim_buf_set_option(buf, "modifiable", true)
		vim.api.nvim_buf_set_option(buf, "readonly", false)
		vim.api.nvim_buf_set_option(buf, "filetype", "markdown")
		vim.api.nvim_win_set_width(winid, 50)

		vim.cmd(":Neoformat")
		-- Set keymap to close the window with 'q'
		vim.api.nvim_buf_set_keymap(buf, "n", "q", "<cmd>close<CR>", { silent = true, noremap = true })
	end

	return M
end

return M
