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
            -- gopls is managed by `navigator` (navigator.lua); disable vim-go's
            -- own gopls client to avoid a duplicate LSP and its "could not
            -- determine working directory for gopls" warning.
            vim.g.go_gopls_enabled = 0
        end
    }
}
