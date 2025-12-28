vim.pack.add({
    {
        src = gh('ThePrimeagen/harpoon'),
        version = "harpoon2" 
    }
})

local harpoon = require("harpoon")
harpoon:setup()
