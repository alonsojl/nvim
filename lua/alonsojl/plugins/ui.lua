return {
    {
        "folke/zen-mode.nvim",
        dependencies = { "folke/twilight.nvim" },
        cmd = "ZenMode",
        opts = {
            window = {
                backdrop = 0.95, -- shade the backdrop of the Zen window. Set to 1 to keep the same as Normal
                -- height and width can be:
                -- * an absolute number of cells when > 1
                -- * a percentage of the width / height of the editor when <= 1
                -- * a function that returns the width or the height
                width = .50,               -- width will be 50% of the editor width
                options = {
                    signcolumn = "no",     -- disable signcolumn
                    number = true,         -- disable number column
                    relativenumber = true, -- disable relative numbers
                    cursorline = false,    -- disable cursorline
                    cursorcolumn = false,  -- disable cursor column
                    foldcolumn = "0",      -- disable fold column
                    list = false,          -- disable whitespace characters
                }
            },
            plugins = {
                gitsigns = true,
                tmux = { enabled = false }, -- disables the tmux statusline
                kitty = { enabled = false, font = "+2" },
                twilight = { enabled = true },
            },
        },
        keys = { { "<leader>z", "<cmd>ZenMode<cr>", desc = "Zen Mode" } },
    },
    {
        "rcarriga/nvim-notify",
        opts = {
            background_colour = "#1a1b26",
            timeout = 5000,
        },
    },
    {
        "folke/noice.nvim",
        event = "VeryLazy",
        opts = {
            -- add any options here
        },
        dependencies = {
            -- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
            "MunifTanjim/nui.nvim",
            -- OPTIONAL:
            --   `nvim-notify` is only needed, if you want to use the notification view.
            --   If not available, we use `mini` as the fallback
            "rcarriga/nvim-notify",
        },
        config = {
            lsp = {
                hover = { enabled = false },
                signature = { enabled = false }
            }
        }
    }
}
