local dependencies =  { "nvim-lua/plenary.nvim" }

local config = function()
    require("config.harpoon")
end

return {
    "ThePrimeagen/harpoon",
    dependencies = dependencies,
    config = config
}