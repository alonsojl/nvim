return{
   {
		"sindrets/diffview.nvim",
		dependencies = { "nvim-lua/plenary.nvim" },
		cmd = { "DiffviewOpen", "DiffviewFileHistory" },
		keys = {
			{ "<leader>gd", "<cmd>DiffviewOpen<cr>", desc = "Open diff view" },
			{ "<leader>gh", "<cmd>DiffviewFileHistory<cr>", desc = "Open file history" },
         { "<leader>gc", "<cmd>DiffviewClose<cr>", desc = "Close diff view"},
		},
		opts = {
			enhanced_diff_hl = true,
			use_icons = true,
			view = {
				default = { layout = "diff2_horizontal" },
				merge_tool = {
					layout = "diff4_mixed",
					disable_diagnostics = true,
				}
			}
		},
   },
   {
		"lewis6991/gitsigns.nvim",
		event = "BufRead",
		keys = function()
         local gitsigns = require('gitsigns')
			return {
            { "<leader>gl", function() gitsigns.toggle_current_line_blame() end, desc = "Line blame" },
			-- { "<leader>gu", function() gitsigns.stage_hunk() end, desc = 'Undo "stage hunk"' },
			-- { "<leader>gn", function() gitsigns.nav_hunk("next") end, desc = "Next hunk" },
			-- { "<leader>gN", function() gitsigns.nav_hunk("prev") end, desc = "Previous hunk" },
			-- { "<leader>gp", function() gitsigns.preview_hunk_inline() end, desc = "Preview hunk" },
            -- { "<leader>gw", function() gitsigns.toggle_word_diff() end, desc = "Word diff" },
			-- { "<leader>gs", function() gitsigns.stage_hunk() end, desc = "Stage hunk", mode = { "n" } },
			-- { "<leader>gr", function() gitsigns.reset_hunk() end, desc = "Reset hunk", mode = { "n" } },
			}
		end,
		opts = {
			preview_config = { border = "rounded" },
			signs = {
				add = { text = "┃" },
				change = { text = "┃" },
				delete = { text = "╏" },
				topdelete = { text = "╏" },
				changedelete = { text = "╏" },
				untracked = { text = "┋" },
			},
		},
	},
}
