local function pretty_json(param)
	local ok, decoded = pcall(vim.fn.json_decode, param) -- Try parsing as JSON
	if not ok then
		return param -- If it's not JSON, return as-is
	end

	local lines = {}
	for key, value in pairs(decoded) do
		local formatted_line = string.format("  %s: %s", key, vim.inspect(value))
		table.insert(lines, formatted_line)
	end
	return "{\n" .. table.concat(lines, ",\n") .. "\n}"
end

local config = function()
	require("lsp_signature").setup({
		bind = true,
		hint_enable = false,
		floating_window = true,
		always_trigger = true,
		timer_interval = 10,
		wrap = true,
		doc_lines = 5,
		hint_prefix = "🔹 ",
		handler_opts = { border = "single" },
		toggle_key = "<C-k>",
		max_height = 50,
		max_width = 80,
		auto_close_after = nil,
		extra_trigger_chars = { "{", "(", "," },
		hi_parameter = "IncSearch",
		zindex = 50,

		floating_window_off_x = vim.o.columns - 0, -- Shift left from screen width
		floating_window_off_y = 0,

		decode_param = function(param)
			local max_param_length = 200 -- Allow longer formatted JSON display
			local formatted = pretty_json(param)

			if #formatted > max_param_length then
				return formatted:sub(1, max_param_length) .. "\n  … }" -- Truncate only when necessary
			end
			return formatted
		end,
	})
end

return {
	"ray-x/lsp_signature.nvim",
	config = config,
}
