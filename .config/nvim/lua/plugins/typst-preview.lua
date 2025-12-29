vim.pack.add{ 
    {
        src = GH("chomosuke/typst-preview.nvim"),
        version = vim.version.range("^1") -- this means any 1.x.x version
    }
}
require("typst-preview").setup()
