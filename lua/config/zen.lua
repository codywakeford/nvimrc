-- Define variables to store the Zen-mode window id
local zen_win = nil

local options = {
    width = 0.6,
}

local function zen()
    vim.cmd("autocmd VimEnter * lua require'alpha.setup()")

    local win_width = vim.o.columns
    print("win_width", win_width)

    local center_width = win_width * options.width
    print("center_width", center_width)

    local margin_width = (win_width - center_width) * 0.5
    print("margin_width", margin_width)

    -- create right margin
    vim.cmd("vsplit")
    vim.cmd("wincmd l")
    vim.cmd("enew")
    vim.cmd(string.format("vertical resize %d", margin_width))
    print(string.format("vertical resize %d", margin_width))

    -- create left margin
    vim.cmd("wincmd h")
    vim.cmd("vsplit")
    vim.cmd("enew")
    vim.cmd(string.format("vertical resize %d", margin_width))

    vim.cmd("wincmd l")
    vim.cmd(string.format("vertical resize %d", center_width))
end

-- Toggle function for Zen Mode
vim.api.nvim_create_autocmd("User", {
    pattern = "ToggleZenMode", -- Custom event name
    callback = zen,
})
--
-- vim.api.nvim_set_keymap("n", "<Leader>z", "", {
--     noremap = true,
--     silent = true,
--     callback = function()
--         vim.api.nvim_exec_autocmds("User", { pattern = "ToggleZenMode" })
--     end,
-- })
-- set columns=100
--
--
--[[

:vsplit
:wincmd l
:enew
:wincmd h
:vsplit
:wincmd h
:enew
:wincmd l



--]]
