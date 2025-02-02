local alpha = require("alpha")
local dashboard = require("alpha.themes.dashboard")

-- Set header
dashboard.section.header.val = {
    [[                                                                       ]],
    [[                                                                       ]],
    [[                                                                       ]],
    [[                                                                       ]],
    [[                                                                     ]],
    [[       ████ ██████           █████      ██                     ]],
    [[      ███████████             █████                             ]],
    [[      █████████ ███████████████████ ███   ███████████   ]],
    [[     █████████  ███    █████████████ █████ ██████████████   ]],
    [[    █████████ ██████████ █████████ █████ █████ ████ █████   ]],
    [[  ███████████ ███    ███ █████████ █████ █████ ████ █████  ]],
    [[ ██████  █████████████████████ ████ █████ █████ ████ ██████ ]],
    [[                                                                       ]],
    [[                                                                       ]],
    [[                                                                       ]],
}

-- Set menu
dashboard.section.buttons.val = {
    dashboard.button("f", "   Find file", ":Telescope find_files<CR>"),
    dashboard.button("n", "   New file", ":enew<CR>"),
    dashboard.button("r", "   Recent files", ":Telescope oldfiles<CR>"),
    dashboard.button("p", "   Open Projects",
        ":lua require('telescope.builtin').find_files({ cwd = vim.fn.expand('~') .. '/git', find_command = { 'find', vim.fn.expand('~') .. '/git', '-maxdepth', '1', '-type', 'd' } })<CR>"),
    dashboard.button("q", "   Quit", ":qa<CR>"),
}

-- Send config to alpha
alpha.setup(dashboard.opts)

-- Disable folding on alpha buffer
vim.cmd([[
    autocmd FileType alpha setlocal nofoldenable
]])
