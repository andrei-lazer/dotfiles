vim.pack.add({
    {
        src = GH('ThePrimeagen/harpoon'),
        version = "harpoon2" 
    }
})

local harpoon = require("harpoon")
harpoon:setup()
