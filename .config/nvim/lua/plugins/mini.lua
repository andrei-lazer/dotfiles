-- all have the same format, so doing it with a for loop
local packages = {
    "ai", -- enhances the built-in text objects, e.g. diq deletes inside any types of quotes
    "surround", -- shortcuts for surrounding text - use s + r/a
    "completion", -- automatic completion
    "pairs", -- auto pairs for quotes and brackets
    "icons",
    "splitjoin", -- splits and joins array like objects (try with <leader>m)
    "bracketed" -- go back and forth with square brackets
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
