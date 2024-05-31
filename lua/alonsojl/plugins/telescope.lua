return {
    "nvim-telescope/telescope.nvim",
    dependencies = {
        "nvim-lua/plenary.nvim",
        {
            "nvim-telescope/telescope-fzf-native.nvim",
            build = "make",
            enabled = true
        },
    },
    branch = "0.1.x",
    config = function()
        local telescope = require("telescope")
        local actions = require("telescope.actions")

        telescope.setup({
            defaults = {
                sorting_strategy = "ascending",
                layout_strategy = "horizontal",
                layout_config = {
                    prompt_position = "top",
                },
                mappings = {
                    i = {
                        ["<C-k>"] = actions.move_selection_previous,                      -- move to prev result
                        ["<C-j>"] = actions.move_selection_next,                          -- move to next result
                        ["<C-q>"] = actions.send_selected_to_qflist +
                        actions.open_qflist                                               -- send selected to quickfixlist
                    }
                }
            },
            extensions = {
                fzf = {
                    fuzzy = true,                   -- false will only do exact matching
                    override_generic_sorter = true, -- override the generic sorter
                    override_file_sorter = true,    -- override the file sorter
                    case_mode = "smart_case",       -- or "ignore_case" or "respect_case" the default case_mode is "smart_case"
                }
            }
        })

        telescope.load_extension("fzf")
        local builtin = require("telescope.builtin")

        -- key maps
        local map = vim.keymap.set
        local opts = { noremap = true, silent = true }

        map('n', '<C-p>', builtin.git_files, opts)
        map("n", "<leader>ff", builtin.find_files, opts)    -- Lists files in your current working directory, respects .gitignore
        map("n", "<leader>fx", builtin.treesitter, opts)    -- Lists tree-sitter symbols
        map("n", "<leader>fs", builtin.spell_suggest, opts) -- Lists spell options
        map('n', '<leader>fg', builtin.live_grep, {})
        map('n', '<leader>fb', builtin.buffers, {})
        map('n', '<leader>fh', builtin.help_tags, {})
        map('n', '<leader>fc', builtin.git_commits, {})
    end
}
