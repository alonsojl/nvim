return {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons", "ellisonleao/gruvbox.nvim" },
    config = function()
        require("lualine").setup({ options = { theme = "gruvbox" } })
    end
}
