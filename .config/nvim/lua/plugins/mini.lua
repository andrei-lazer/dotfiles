-- all have the same format, so doing it with a for loop
local packages = {
    "ai",
    "surround",
    "completion",
    "pairs",
    "icons",
    "splitjoin",
    "bracketed"
}

local configs = {
    splitjoin = {
        mappings = {
            toggle = "<leader>m"
        }
    }
}

for _, p in pairs(packages) do
    vim.pack.add{ GH("nvim-mini/mini." .. p)}
    if configs[p] ~= nil then
        require("mini." .. p).setup(configs[p])
    else
        require("mini." .. p).setup({})
    end
end
