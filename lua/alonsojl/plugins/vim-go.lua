return {
    { "AndrewRadev/splitjoin.vim" },
    {
        "SirVer/ultisnips",
        config = function()
            vim.g.UltiSnipsEditSplit = "vertical"
            vim.g.UltiSnipsExpandTrigger = "<S-Tab>"
            vim.g.UltiSnipsEditSplit = "vertical"
        end
    },
    {
        "fatih/vim-go",
        config = function()
            vim.g.go_snippet_engine = "ultisnips"
            vim.g.go_highlight_operators = 1
            vim.g.go_highlight_extra_types = 1
            vim.g.go_auto_type_info = 1
        end
    }
}
