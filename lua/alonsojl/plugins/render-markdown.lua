return {
    "MeanderingProgrammer/render-markdown.nvim",
    dependencies = {
        "nvim-treesitter/nvim-treesitter",
        "nvim-tree/nvim-web-devicons"
    },
    ft = {"markdown"},
    config = function()
        require("render-markdown").setup({
            -- start with rendering on; toggle with the keymap below
            enabled = true
        })

        -- toggle inline rendering on/off
        vim.keymap.set("n", "<leader>tm", "<cmd>RenderMarkdown toggle<cr>",
            {desc = "Toggle Markdown render"})
    end
}
