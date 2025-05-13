return {
  "crnvl96/lazydocker.nvim",
  event = "VeryLazy",
  dependencies = {
    "MunifTanjim/nui.nvim",
  },
  config = function()
    require("lazydocker").setup()
    vim.keymap.set("n", "<leader>d", "<cmd>LazyDocker<CR>", { desc = "Toggle LazyDocker", noremap = true, silent = true })
  end
}
