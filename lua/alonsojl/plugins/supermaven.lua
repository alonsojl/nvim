return {
    "supermaven-inc/supermaven-nvim",
    config = function()
        require("supermaven-nvim").setup({
            keymaps = {
                accept_suggestion = "<C-g>",
                clear_suggestions = "<C-]>",
                accept_word = "<C-j>",
            },
            ignore_filetypes = { cpp = true },
            color = {
                suggestion_color = "#7c6f64",
                cterm = 244,
            },
            disable_inline_completion = false, -- disables inline completion for use with cmp
            disable_keymaps = false            -- disables built in keymaps for more manual control
        })
    end
}
