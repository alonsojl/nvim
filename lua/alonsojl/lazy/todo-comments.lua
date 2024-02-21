return {
  "folke/todo-comments.nvim",
  dependencies = { "nvim-lua/plenary.nvim" },
  config = function()
    local comments = require("todo-comments")
    comments.setup()
    vim.keymap.set("n", "<leader>tt", ":TodoTelescope<CR>")
    vim.keymap.set("n", "]t", function()comments.jump_next() end, { desc = "Next todo comment" })
    vim.keymap.set("n", "[t", function()comments.jump_prev() end, { desc = "Previous todo comment" })

  end
}
