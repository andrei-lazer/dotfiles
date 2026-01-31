vim.pack.add{ 
    {
        src = GH("chomosuke/typst-preview.nvim"),
    }
}
require("typst-preview").setup()
