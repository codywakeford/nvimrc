local telescope = require("telescope")
local pickers = require("telescope.pickers")
local finders = require("telescope.finders")
local conf = require("telescope.config").values
local actions = require("telescope.actions")
local action_state = require("telescope.actions.state")
local previewers = require("telescope.previewers")
local Job = require("plenary.job") -- Make sure you have plenary!

local dirs = {
	"~/git/",
	"~/git/monorepo/core",
	"~/git/monorepo/templates",
	"~/git/monorepo/client",
}

-- Expand tilde to full path
local function expand_path(p)
	return vim.fn.expand(p)
end

-- Get { display = folder name, path = full path } for each project
local function get_projects()
	local results = {}

	for _, dir in ipairs(dirs) do
		local full_path = expand_path(dir)
		local handle = io.popen("find " .. full_path .. " -maxdepth 1 -mindepth 1 -type d 2>/dev/null")
		if handle then
			for line in handle:lines() do
				table.insert(results, {
					display = vim.fn.fnamemodify(line, ":t"), -- just folder name
					path = line,
				})
			end
			handle:close()
		end
	end

	return results
end

-- Custom previewer that shows tree or ls output
local folder_tree_previewer = previewers.new_termopen_previewer({
	get_command = function(entry)
		local path = entry.value or entry.path
		if vim.fn.executable("tree") == 1 then
			return { "tree", "-L", "1", "--dirsfirst", path }
		else
			return { "ls", "-la", path }
		end
	end,
})

local function open_project()
	local projects = get_projects()

	pickers
		.new({}, {
			prompt_title = "Dev Projects",
			finder = finders.new_table({
				results = projects,
				entry_maker = function(entry)
					return {
						value = entry.path,
						display = entry.display,
						ordinal = entry.display,
						path = entry.path,
					}
				end,
			}),
			sorter = conf.generic_sorter({}),
			previewer = folder_tree_previewer,
			attach_mappings = function(prompt_bufnr, _)
				actions.select_default:replace(function()
					actions.close(prompt_bufnr)
					local selection = action_state.get_selected_entry()
					local dir = selection.value
					vim.cmd("cd " .. dir)
					print("Changed directory to " .. dir)
				end)
				return true
			end,
		})
		:find()
end

return {
	open_project = open_project,
}
